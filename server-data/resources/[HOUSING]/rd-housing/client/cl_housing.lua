--[[

    Variables

]]

Housing.currentOwned = {}
Housing.currentKeys = {}
Housing.currentlyEditing = false
Housing.currentHousingInteractions = nil
Housing.currentlyInsideBuilding = false

Housing.currentHousingLocks = {}
Housing.currentHousingLockdown = {}
Housing.currentAccess = nil

Housing.hasEditedOrigin = false

--[[

    Functions

]]

function gatherPlayerInfo()
    -- print("reload")
    Housing.currentOwned = STR.execute("getCurrentOwned")
    -- print(json.encode(Housing.currentOwned))
    Housing.currentKeys = STR.execute("currentKeys")
    Housing.currentHousingLockdown = STR.execute("getCurrentLockdown")
    updateBuisnessLocations(STR.execute("getBuisnessLocations"))
end

RegisterCommand("gatherPlayerInfo", function()
    gatherPlayerInfo()

end)

function getHousingforPhone()
    return Housing.info
end

exports('housingForPhone',getHousingforPhone)

function updateBuisnessLocations(data)
    local assigned = {}

    for k, v in pairs(Housing.info) do
        if v.assigned then
            assigned[v.assigned] = k
        end
    end

    for k, v in pairs(data) do
        local c = v.coords
        Housing.info[assigned[v.buisness]]["pos"] = vector4(c.x, c.y, c.z, 0.0)
    end
end

function Housing.func.findClosestProperty()
    local playerCoords = GetEntityCoords(PlayerPedId())

    local zone = GetZoneAtCoords(playerCoords)
    local zoneName = GetNameOfZone(playerCoords)

    if Housing.zone[zoneName] == nil then
        return false, "Zone not found", nil
    end

    local closest = nil
    local closestDist = 9999

    for k,v in pairs(Housing.zone[zoneName].locations) do
        local distance = #(playerCoords - v)
        if distance <= closestDist then
            closestDist = distance
            closest = k
        end
    end

    return true, closest, closestDist, zoneName
end

function getCurrentKeys()
    Housing.currentKeys = STR.execute("currentKeys")
    return Housing.currentKeys
end

function Housing.func.enterBuilding(propertyID,enterOverride,counterPart)
    Housing.currentlyInsideBuilding = true
    DoScreenFadeOut(1)

    TriggerEvent("insideShell", true)

    local finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess = STR.execute("getCurrentSelected", propertyID)

    if type(housingLockdown) == "table" then
        Housing.currentHousingLockdown = housingLockdown
    end

    if type(currentHousingLocks) == "table" then
        Housing.currentHousingLocks = currentHousingLocks
    end

    if type(housingRobbed) == "table" then
        Housing.housingBeingRobbedClient = housingRobbed
    end

    if type(robTargets) == "table" then
        Housing.housingRobTargets = robTargets
    end

    if type(robLocations) == "table" then
        Housing.robPosLocations = robLocations
    end

    if type(housingInformation) == "table" then
        Housing.currentHousingInteractions = housingInformation
        Housing.currentHousingInteractions.id = propertyID
    end

    if type(currentAccess) == "table" then
        Housing.currentAccess = currentAccess
    end

    if counterPart then
        Housing.alarm = alarm

        local finished, destroyedTable = STR.execute("getDestroyedTable", propertyID)
        if type(destroyedTable) == "table" then
            Housing.destroyedObjects = destroyedTable
        end
    end

    local model = Housing.info[propertyID].model
    local oldModel = nil
    if counterPart then
        local info = Housing.typeInfo[model]
        if info.robberyCounterpart == nil then return end
        oldModel = model
        model = info.robberyCounterpart
    end

    local spawnBuildingLocation = vector3(Housing.info[propertyID]["pos"].x,Housing.info[propertyID]["pos"].y,Housing.info[propertyID]["pos"].z-60.0)
    if not counterPart then
        if Housing.currentHousingInteractions ~= nil and Housing.currentHousingInteractions.origin_offset ~= vector3(0.0,0.0,0.0) and type(Housing.currentHousingInteractions.origin_offset) == "vector3" then
            local off = Housing.currentHousingInteractions.origin_offset
            spawnBuildingLocation =  vector3(Housing.info[propertyID]["pos"].x+off.x,Housing.info[propertyID]["pos"].y+off.y,Housing.info[propertyID]["pos"].z-60.0)
        end
    end

    local isBuiltCoords, objects = exports["rd-build"]:getModule("func").buildRoom(model,spawnBuildingLocation,false,Housing.destroyedObjects,enterOverride,true)
    if counterPart and Housing.staticObjectRobPoints == nil then
        Housing.staticObjectRobPoints = exports["rd-build"]:getModule("func").getRobLocationsForObjects(model,spawnBuildingLocation,Housing.housingRobTargets.static)
        buildRobLocations(model,propertyID)
    end

    if isBuiltCoords then
        --DoScreenFadeIn(100)
        SetEntityInvincible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(),false)

        TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorClose', 0.7)
        DoScreenFadeIn(500)

        Housing.currentlyInsideBuilding = true

        if counterPart then
            model = oldModel

            if model == "v_int_16_low" then
                model = "v_int_49_empty"
            elseif model == "v_int_61" then
                model = "v_int_16_mid_empty"
            end
        end

        Housing.func.loadInteractions(model,counterPart,counterPart)

        TriggerServerEvent("rd-housing:enterHouse", propertyID)

        if not counterPart then
            TriggerEvent("rd-editor:buildName", propertyID, objects)
        end
    else
        Housing.currentHousingInteractions = nil
        Housing.currentlyInsideBuilding = false
        Housing.currentAccess = nil
    end
end

function Housing.func.getPropertyIdFromName(propertyName, isSpawn)
    local housingID = 0
    for k, v in pairs(Housing.info) do
        local street = v.street

        if isSpawn then
            street = street .. " House"
        end

        if propertyName == street then
            housingID = k
            break
        end
    end
    return housingID
end

function Housing.func.getPropertyZoneFromID(propertyID)
    local zoneName = GetNameOfZone(Housing.info[propertyID]["pos"])
    return zoneName
end

function unlock(propertyID)
    if not isPropertyActive(propertyID) then
        TriggerEvent("DoLongHudText", "inactive property", 2)
        return
    end

    if not playerInRangeOfProperty(propertyID) then
        TriggerEvent("DoLongHudText", "Property not in range", 2)
        return
    end

    if Housing.currentKeys == nil and Housing.currentOwned == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentKeys[propertyID] == nil and Housing.currentOwned[propertyID] == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentHousingLocks[propertyID] == nil then
        if not lockdownCheck(propertyID) then
            TriggerEvent("DoLongHudText","The property is locked, you cannot change the locks.",2)
            return
        end

        local passed, currentHousingLocks = STR.execute("unlockProperty", propertyID)

        if type(currentHousingLocks) == "table" then
            Housing.currentHousingLocks = currentHousingLocks
        end

        TriggerEvent("DoLongHudText","Unlocked property.")
    else
        TriggerEvent("DoLongHudText", "The property is already unlocked.", 2)
    end
end

function lock(propertyID)
    if not isPropertyActive(propertyID) then
        TriggerEvent("DoLongHudText", "Property inactive", 2)
        return
    end

    if not playerInRangeOfProperty(propertyID) then
        TriggerEvent("DoLongHudText", "Property not in range", 2)
        return
    end

    if Housing.currentKeys == nil and Housing.currentOwned == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentKeys[propertyID] == nil and Housing.currentOwned[propertyID] == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentHousingLocks[propertyID] == false then
        if not lockdownCheck(propertyID) then
            TriggerEvent("DoLongHudText", "The property is locked, you cannot change the locks.", 2)
            return
        end

        local passed, currentHousingLocks = STR.execute("lockProperty", propertyID)

        if type(currentHousingLocks) == "table" then
            Housing.currentHousingLocks = currentHousingLocks
        end

        TriggerEvent("DoLongHudText", "Property locked.")
    else
        TriggerEvent("DoLongHudText", "The property is already locked.", 2)
    end
end

function taxCheck(propertyId)
    local taxCheck = STR.execute("housing:isOverdueOnTaxes", propertyId)
    return taxCheck
end

--[[

    Events

]]

RegisterNetEvent("rd-housing:loadHousingClient")
AddEventHandler("rd-housing:loadHousingClient", function()
    gatherPlayerInfo()
end)

RegisterNetEvent("rd-housing:reset")
AddEventHandler("rd-housing:reset", function()
    -- cl_housing
    Housing.currentOwned = {}
    Housing.currentKeys = {}
    Housing.currentlyEditing = false
    Housing.currentHousingInteractions = nil
    Housing.currentlyInsideBuilding = false

    Housing.currentHousingLocks = {}
    Housing.currentHousingLockdown = {}
    Housing.currentAccess = nil

    Housing.hasEditedOrigin = false

    -- cL_houseRobberies
    Housing.housingBeingRobbedClient = {}
    Housing.housingRobTargets = {}
    Housing.currentlyRobInside = false

    Housing.staticObjectRobPoints = nil
    Housing.robPosLocations = nil

    Housing.currentClosestSelected = nil
    Housing.currentlyDisplayingPickup = false
    Housing.destroyedObjects = {}
    Housing.alarm = {}

    Housing.attackedTarget = nil
    Housing.lockpicking = false

    Housing.lockout = false

    -- cl_realtor
    Housing.positions = {}
    Housing.EditOptions = {}

    -- cl_util
    Housing.ClosestObject = {}
    Housing.plyCoords = nil
end)

RegisterNetEvent("rd-housing:refresh")
AddEventHandler("rd-housing:refresh", function()
    gatherPlayerInfo()
end)

RegisterNetEvent("housing:playerSpawned")
AddEventHandler("housing:playerSpawned", function(housingName)
    local propertyID = Housing.func.getPropertyIdFromName(housingName, true)
    if propertyID == 0 then return end

    Housing.currentHousingLockdown = STR.execute("getCurrentLockdown")

    if not Housing.currentHousingLockdown[propertyID] then
        Housing.func.enterBuilding(propertyID)
    end

    local cid = exports["isPed"]:isPed("cid")
    
    TriggerEvent("rd-spawn:characterSpawned", cid)
end)

function findClosetedPerson() 
    local isComplete, _propertyId, dist, zone = Housing.func.findClosestProperty()
    return isComplete, _propertyId, dist, zone
end

exports('findClosetedPerson', findClosetedPerson)

function ownsThisHouseHmm()
    local isComplete, _propertyId, dist, zone = Housing.func.findClosestProperty()
    if not isComplete then
      --  TriggerEvent("DoLongHudText", "too far from the property.", 2)
        return false
    end
    if Housing.currentOwned[propertyId] == nil and Housing.currentKeys[propertyId] == nil then
        return false
    end
    return true
end

exports('ownsThisHouseHmm',ownsThisHouseHmm)
RegisterNetEvent('housing:toggleClosestLock')
AddEventHandler('housing:toggleClosestLock', function()
    local propertyId = "penis"

    if Housing.currentHousingInteractions ~= nil and Housing.currentHousingInteractions.id ~= nil then
        propertyId = Housing.currentHousingInteractions.id
    else
        local isComplete, _propertyId, dist, zone = Housing.func.findClosestProperty()

        if not isComplete then
            TriggerEvent("DoLongHudText", "Too far from the property.", 2)
            return
        end

        propertyId = _propertyId
    end

    if Housing.currentOwned[propertyId] == nil and Housing.currentKeys[propertyId] == nil then
        TriggerEvent("DoLongHudText", "You do not own this property.", 2)
        return
    end

    if isLocked(propertyId, true) then
        unlock(propertyId)
    else
        lock(propertyId)
    end
end)

function isNearHousingClothing()

    if Housing.currentlyInsideBuilding and Housing.currentHousingInteractions ~= nil then
        if Housing.currentOwned[Housing.currentHousingInteractions.id] == nil and Housing.currentKeys[Housing.currentHousingInteractions.id] == nil then return false end
        if Housing.currentHousingInteractions.charChanger_offset == nil then return false end
        if Housing.currentHousingInteractions.charChanger_offset == vector3(0.0,0.0,0.0) then return false end
        
        local playerCoords = GetEntityCoords(PlayerPedId())

        local buildingVector = exports["rd-build"]:getModule("func").currentBuildingVector()
        local vector = (Housing.currentHousingInteractions.charChanger_offset + buildingVector)

        local distance = #(playerCoords - vector)
        if distance < 2.0 then
            return true
        end
    end

    return false
end

RegisterNetEvent('hotel:outfit')
AddEventHandler('hotel:outfit', function(args,sentType)

    if isNearHousingClothing() then
		if sentType == 1 then
			local id = args[2]
			table.remove(args, 1)
			table.remove(args, 1)
			strng = ""
			for i = 1, #args do
				strng = strng .. " " .. args[i]
			end
			TriggerEvent("raid_clothes:outfits", sentType, id, strng)
		elseif sentType == 2 then
			local id = args[2]
			TriggerEvent("raid_clothes:outfits", sentType, id)
		elseif sentType == 3 then
			local id = args[2]
			TriggerEvent('item:deleteClothesDna')
			TriggerEvent('InteractSound_CL:PlayOnOne','Clothes1', 0.6)
			TriggerEvent("raid_clothes:outfits", sentType, id)
		else
			TriggerServerEvent("raid_clothes:list_outfits")
		end
	end
end)