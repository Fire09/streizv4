local ownerCid = {}

RegisterNetEvent("housing:OwnerSee")
AddEventHandler("housing:OwnerSee", function(result)
ownerCid = result
STR.execute("property:getOwner", result)
end)

--[[
    Functions below: Housing App
    Description: All connections to the Housing App
]]

function currentLocation()
    -- print("currentLocation")
    local isComplete, propertyId, dist, zone = Housing.func.findClosestProperty()
    -- print(isComplete, propertyId, dist, zone)
    if Housing.currentHousingInteractions then
        -- print("in house")
        Housing.currentHousing = {
            ["housingName"] = Housing.info[Housing.currentHousingInteractions.id].street
        }
        return true, Housing.currentHousing 
    end

    if isComplete and dist <= 3.0 then
        local owner = STR.execute("property:getOwnerRaw", propertyId)
        -- print("owner", owner)
        -- print("isComplete and dist less than 3")
        Wait(100)
        Housing.currentHousing = {
            ["housingName"] = Housing.info[propertyId].street,
            ["housingCat"] = Housing.typeInfo[Housing.info[propertyId].model] and Housing.typeInfo[Housing.info[propertyId].model].cat or "Unknown",
            ["housingPrice"] = Housing.info[propertyId].price,
            ["isOwned"] = ownerCid
        }
    else
        return false,"No property Found"
    end
    return isComplete, Housing.currentHousing
end

function buyProperty()
    local isComplete, propertyId, dist, zone = Housing.func.findClosestProperty()
    if not isPropertyActive(propertyId) then return false,"property is not for sale" end

    if zone == nil then return false,"failed to find property" end

    local total = Housing.info[propertyId].price
    local housingName = Housing.info[propertyId].street
    local complete, info, owned = STR.execute("AttemptHousingContract", propertyId, total, housingName, zone)
    -- print("buyProperty")
    if type(info) == "table" then
        -- print("type table, return the info")
        Housing.currentOwned = info
        getCurrentKeys()
        return true, owned
    end

    if type(info) == "string" then
        return complete, info
    end
    return complete,{}
end

function setGps(propertyID)
    local propertyID = tonumber(propertyID)
    if propertyID == 0 and housingName ~= nil and housingName ~= "" then
        exports["rd-apartments"]:getModule("func").gpsApartment(housingName)
    end
    if propertyID == 0 then return false,"failed to find property" end

    local pos = Housing.info[propertyID][1]
    
    SetNewWaypoint(pos.x, pos.y)

    TriggerEvent("DoLongHudText", "Updated GPS.", 1)

    return true,pos
end
