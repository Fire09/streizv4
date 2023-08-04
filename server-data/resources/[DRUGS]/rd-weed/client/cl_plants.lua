local WeedPlants = {}
local ActivePlants = {}

local inZone = 0
local setDeleteAll = false

--Creates da weed
--TODO: cache close plants
Citizen.CreateThread(function()
    while true do
        local plyCoords = GetEntityCoords(PlayerPedId())
        if WeedPlants == nil then WeedPlants = {} end
        for idx,plant in ipairs(WeedPlants) do
            coords = { x = plant.x, y = plant.y, z= plant.z }
            local compareCoords = vector3(tonumber(coords.x), tonumber(coords.y), tonumber(coords.z))
            if idx % 100 == 0 then
                Wait(0) --Process 100 per frame
            end
            --convert timestamp -> growth percent
            local plantGrowth = getPlantGrowthPercent(plant)
            local dist = #(plyCoords - compareCoords)

            if #(plyCoords - compareCoords) < (50.0 + plantGrowth) and not setDeleteAll then
                local curStage = getStageFromPercent(plantGrowth)
                local isChanged = (ActivePlants[plant.id] and ActivePlants[plant.id].stage ~= curStage)

                if isChanged then
                    removeWeed(plant.id)
                end

                if not ActivePlants[plant.id] or isChanged then
                    local weedPlant = createWeedStageAtCoords(curStage, coords)
                    ActivePlants[plant.id] = {
                        object = weedPlant,
                        stage = curStage
                    }
                end
            else
                removeWeed(plant.id)
            end
        end
        if setDeleteAll then
            WeedPlants = {}
            setDeleteAll = false
        end
        Wait(inZone > 0 and 5000 or 10000)
    end
end)

AddEventHandler("rd-inventory:itemUsed", function(item)
    if item == "femaleseed" then
        if inZone > 0 then
            local plyCoords = GetEntityCoords(PlayerPedId())
            local offsetCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.7, 0)
            local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(offsetCoords.x, offsetCoords.y, offsetCoords.z, offsetCoords.x, offsetCoords.y, offsetCoords.z - 2, 1, 0, 4)
            local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
            if hit then
                local foundHash = false
                for matHash,matType in pairs(MaterialHashes) do
                    if materialHash == matHash then
                        local typeMod = PlantConfig.TypeModifiers[matType]
                        foundHash = true
                        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                        FreezeEntityPosition(PlayerPedId(), true)
                        local finished = exports["rd-taskbar"]:taskBar(15000, 'Planting Seed', false, true, false, false, nil, 5.0, PlayerPedId())
                        ClearPedTasks(PlayerPedId())
                        if finished == 100 then
                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                            RPC.execute("rd-weed:plantSeed", endCoords, typeMod)
                            TriggerEvent("inventory:removeItem", item, 1)
                        else
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    end
                end
                if not foundHash then
                    TriggerEvent("DoLongHudText", 'I should find better soil to plant this')
                end
            end
        else
            TriggerEvent("DoLongHudText",'I should find a better area to plant this')
        end
    end
end)

AddEventHandler("rd-weed:checkPlant", function(pContext, pEntity)
    local plantId = getPlantId(pEntity)
    if not plantId then return end
    showPlantMenu(plantId)
end)

RegisterUICallback('rd-weed:addWater', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['rd-inventory']:hasEnoughOfItem('water', 1) then
        playPourAnimation()
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports["rd-taskbar"]:taskBar(5000,'Adding Water', false, true, false, false, nil, 5.0, PlayerPedId())
        ClearPedTasks(PlayerPedId())
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            local success = RPC.execute("rd-weed:addWater", data.key)
            if not success then
                TriggerEvent("DoLongHudText", "[ERR]: Could not add water.")
            else
                TriggerEvent("inventory:removeItem", "water", 1)
            end
        else
            FreezeEntityPosition(PlayerPedId(), false)
        end
        showPlantMenu(data.key.id)
    else
        TriggerEvent('DoLongHudText', 'You do not have any water to water the plant.', 2)
    end
end)

RegisterUICallback('rd-weed:addFertilizer', function (data, cb)
    if exports['rd-inventory']:hasEnoughOfItem('fertilizer', 1) then
        cb({ data = {}, meta = { ok = true, message = '' } })
        playPourAnimation()
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports["rd-taskbar"]:taskBar(5000, 'Adding Fertilizer', false, true, false, false, nil, 5.0, PlayerPedId())
        ClearPedTasks(PlayerPedId())
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            local success = RPC.execute("rd-weed:addFertilizer", data.key)
            if not success then
                TriggerEvent("DoLongHudText", "[ERR]: Could not add fertilizer")
            else
                TriggerEvent("inventory:removeItem", "fertilizer", 1)
            end
        else
            FreezeEntityPosition(PlayerPedId(), false)
        end
        showPlantMenu(data.key.id)
    else
        TriggerEvent('DoLongHudText', 'You dont have fertilizer to add', 2)
    end
end)

RegisterUICallback('rd-weed:addMaleSeed', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports["rd-taskbar"]:taskBar(15000, 'Adding Male Seed', false, true, false, false, nil, 5.0, PlayerPedId())
    ClearPedTasks(PlayerPedId())
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        RPC.execute("rd-weed:addMaleSeed", data.key)
        TriggerEvent("inventory:removeItem", "maleseed", 1)
    else
        FreezeEntityPosition(PlayerPedId(), false)
    end
    showPlantMenu(data.key.id)
end)

RegisterUICallback('rd-weed:removePlant', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent("animation:PlayAnimation","layspike")
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports["rd-taskbar"]:taskBar(15000, 'Removing', false, true, false, false, nil, 5.0, PlayerPedId())
    ClearPedTasks(PlayerPedId())
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        local getFertilizer = getPlantGrowthPercent(getPlantById(data.key.id)) > 20.0
        local success = RPC.execute("rd-weed:removePlant", data.key, getFertilizer)
        if not success then
            print("[ERR]: Could not remove. pid:", data.key.id)
        end
    else
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

AddEventHandler("rd-weed:pickPlant", function(pContext, pEntity)
    local plantId = getPlantId(pEntity)
    if not plantId then return end

    local plant = getPlantById(plantId)
    local timeSinceHarvest = GetCloudTimeAsInt() - plant.last_harvest
    if getPlantGrowthPercent(plant) < PlantConfig.HarvestPercent or timeSinceHarvest <= (PlantConfig.TimeBetweenHarvest * 60) then
        TriggerEvent("DoLongHudText", 'Not ready for harvesting', 2)
        return
    end

    local plyWeight = exports["rd-inventory"]:getCurrentWeight()
    if plyWeight + 100.0 > 250.0 and plant.gender == 0 then
        TriggerEvent("DoLongHudText", 'You do not have enough room to hold the bud.', 2)
        return
    end

    TriggerEvent("animation:PlayAnimation","layspike")
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports["rd-taskbar"]:taskBar(5000, 'Harvesting', false, true, false, false, nil, 5.0, PlayerPedId())
    ClearPedTasks(PlayerPedId())
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        local strainquality = getStrainQuality(plant.strain)
        local strain = getStrainNameFromQuality(strainquality)
        local pStrain = {
            strain = strain,
            quality = strainquality
        }
        RPC.execute("rd-weed:harvestPlant", plantId, pStrain)
    else
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

AddEventHandler("rd-polyzone:enter", function(zone, data)
    if zone == "rd-weed:weed_zone" then
        inZone = inZone + 1
        if inZone == 1 then
            setDeleteAll = false -- remove
            RPC.execute("rd-weed:getPlants")
        end
    end
end)

AddEventHandler("rd-polyzone:exit", function(zone, data)
    if zone == "rd-weed:weed_zone" then
        inZone = inZone - 1
        if inZone < 0 then inZone = 0 end
        if inZone == 0 then
            setDeleteAll = true
        end
    end
end)

RegisterNetEvent('rd-weed:trigger_zone')
AddEventHandler("rd-weed:trigger_zone", function (type, pData)
    --Update all plants
    if type == 1 then
        for _,plant in ipairs(WeedPlants) do
            local keep = false
            for _,newPlant in ipairs(pData) do
                if plant.id == newPlant.id then
                    keep = true
                    break
                end
            end

            if not keep then
                removeWeed(plant.id)
            end
        end
        WeedPlants = pData
    end
    --New plant being added
    if type == 2 then
        WeedPlants[#WeedPlants+1] = pData
    end
    --Plant being harvested/updated
    if type == 3 then
        for idx,plant in ipairs(WeedPlants) do
            if plant.id == pData.id then
                WeedPlants[idx] = pData
                break
            end
        end
    end
    --Plant being removed
    if type == 4 then
        for idx,plant in ipairs(WeedPlants) do
            if plant.id == pData.id then
                table.remove(WeedPlants, idx)
                removeWeed(plant.id)
                break
            end
        end
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for idx,plant in pairs(ActivePlants) do
        DeleteObject(plant.object)
    end
end)

function createWeedStageAtCoords(pStage, pCoords)
    local model = PlantConfig.GrowthObjects[pStage].hash
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local x = tonumber(math.floor(tonumber(pCoords.x)) .. ".00")
    local y = tonumber(math.floor(tonumber(pCoords.y)) .. ".00")
    local z = tonumber(math.floor(tonumber(pCoords.z)) .. ".00")

    local plantObject = CreateObject(model, x, y, z + PlantConfig.GrowthObjects[pStage].zOffset, 0, 0, 0)
    FreezeEntityPosition(plantObject, true)
    SetEntityHeading(plantObject, math.random(0, 360) + 0.0)
    return plantObject
end

function removeWeed(pPlantId)
    if ActivePlants[pPlantId] then
        DeleteObject(ActivePlants[pPlantId].object)
        ActivePlants[pPlantId] = nil
    end
end

function getStageFromPercent(pPercent)
    local growthObjects = #PlantConfig.GrowthObjects - 1
    local percentPerStage = 100 / growthObjects
    return math.floor((pPercent / percentPerStage) + 1.5)
end

function getPlantGrowthPercent(pPlant)
    local timeDiff = (GetCloudTimeAsInt() - pPlant.timestamp) / 60
    local strain = 0.9
    local genderFactor = (pPlant.gender == 1 and PlantConfig.MaleFactor or 1)
    local fertilizerFactor = pPlant.strain.n >= 0.9 and PlantConfig.FertilizerFactor or 1.0
    local growthFactors = (PlantConfig.GrowthTime * genderFactor * fertilizerFactor)
    return math.min((timeDiff / growthFactors) * 100, 100.0)
end

function getPlantId(pEntity)
    for plantId,plant in pairs(ActivePlants) do
        if plant.object == pEntity then
            return plantId
        end
    end
end

function getPlantById(pPlantId)
    local plants = RPC.execute("rd-weed:getPlants")
    for _,plant in pairs(plants) do
        if plant.id == pPlantId then
            return plant
        end
    end
end

function playPourAnimation()
    RequestAnimDict("weapon@w_sp_jerrycan")
    while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
end

function showPlantMenu(pPlantId)
    local plant = getPlantById(pPlantId)
    --Build context menu
    local growth = getPlantGrowthPercent(plant)
    local water = tonumber(plant.strain.water) * 100.0 -- plant.strain.water * 
    local myjob = exports["isPed"]:isPed("myjob")

    local strainquality = getStrainQuality(plant.strain)
    local strain = getStrainNameFromQuality(strainquality)

    local context = {}
    context[#context+1] = {
        title = 'Growth: ' .. string.format("%.2f", growth) .. "%",
        description = 'Gender: ' .. (plant.gender == 1 and 'Male' or 'Female'),
    }

    --Only allow adding water/fertilzier before harvest time
    if growth < PlantConfig.HarvestPercent then
        context[#context+1] = {
            title = 'Add Water',
            description = 'Water: ' .. string.format("%.2f", water) .. "%",
            key = { id = pPlantId },
            action = 'rd-weed:addWater',
            disabled = not exports["rd-inventory"]:hasEnoughOfItem("water", 1, false),
        }

        context[#context+1] = {
            title  = 'Add Fertilizer',
            disabled = not exports["rd-inventory"]:hasEnoughOfItem("fertilizer", 1, false),
            description = "",
            children = {
                {
                    title = 'Add Fertilizer' .. ' (N)',
                    key = { id = pPlantId, type = "n" },
                    action = 'rd-weed:addFertilizer',
                },
                {
                    title = 'Add Fertilizer' .. ' (P)',
                    key = { id = pPlantId, type = "p" },
                    action = 'rd-weed:addFertilizer',
                },
                {
                    title = 'Add Fertilizer' .. ' (K)',
                    key = { id = pPlantId, type = "k" },
                    action = 'rd-weed:addFertilizer',
                }
            }
        }
    end

    --Only allow changing gender in the first 2~ stages
    if getStageFromPercent(growth) < 3 and plant.gender == 0 then
        context[#context+1] = {
            title = 'Add Male Seed',
            key = { id = pPlantId },
            action = 'rd-weed:addMaleSeed',
            description = 'Make the plant preggies',
            disabled = not exports["rd-inventory"]:hasEnoughOfItem("maleseed", 1, false)
        }
    end

    if growth >= 95 or myjob == "police" or myjob == "state" or myjob == "judge" then
        context[#context+1] = {
            title = 'Destroy Plant',
            description = "",
            key = { id = pPlantId },
            action = 'rd-weed:removePlant',
        }
    end

    exports['rd-ui']:showContextMenu(context);
end