local fishes = nil
local fishingRod = nil
local jobCallback = nil
local validFishes = {}

local function createFishes()
    fishes = RPC.execute("fishing:getAvailableFishes")
    for _, fish in pairs(fishes) do
        validFishes[fish.itemName] = true
    end
end

Citizen.CreateThread(function()
    createFishes()
end)

local blip = nil
local fishingLocation = nil
AddEventHandler("fishing:addFishingBlip", function()
    if blip ~= nil then
        RemoveBlip(blip)
    end
--[[     if fishingLocation == nil then
        local location = RPC.execute("fishing:getActiveLocation")
        fishingLocation = location
    end ]]
    local location = RPC.execute("fishing:getActiveLocation")
    fishingLocation = location
    blip = AddBlipForCoord(fishingLocation.coords)
    SetBlipSprite(blip, 304)
    SetBlipScale(blip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Fishing")
    EndTextCommandSetBlipName(blip)
end)

-- RegisterCommand("fishblip", function()
--     TriggerEvent("fishing:addFishingBlip")
-- end)

RegisterNetEvent("rd-fishing:updateLocation")
AddEventHandler("rd-fishing:updateLocation", function(location)
    fishingLocation = location
end)

Citizen.CreateThread(function()
    Citizen.Wait(60000)
    local location = RPC.execute("fishing:getActiveLocation")
    fishingLocation = location
end)

local function isValidFish(fish)
    return validFishes[fish] ~= nil
end

local function loopSkill(count)
    local loopCount = 0
    while loopCount < count do
        loopCount = loopCount + 1
        local finished = exports["rd-ui"]:taskBarSkill(math.random(2000, 2500), math.random(7, 12))
        if finished ~= 100 then
            return false
        end
        Wait(100)
    end
    TriggerEvent("client:newStress", false, 250)
    return true
end

-- RegisterCommand("updatecount", function()
--     if jobCallback ~= nil then
--         local jobCount = RPC.execute("getCurrentObjectCount", "fishing")
--         if jobCount < 30 then
--             jobCount = jobCount + 1
--             RPC.execute("updateObjectiveData", "fishing", 2, jobCount)
--             --jobCallback('updateObjectiveData', 'collect_twenty_fishes', 'count', jobCount)
            
            
--             if jobCount == 30 then
--                 -- send completion
--                 RPC.execute("completeTask", "fishing", 2)
--                 --jobCallback('updateObjectiveData', 'collect_twenty_fishes', 'status', 'completed')
--             end
--         else
--             jobCallback = nil
--         end
--     end
-- end)

local function reelInFish()
    TriggerEvent("DoLongHudText", "A little nibble...", 1)
    math.randomseed(GetCloudTimeAsInt())
    local fishChance = math.random()
    local found = false
    for _, fish in pairs(fishes) do
        if not found and fish.chance > fishChance then
            found = true

            local success = loopSkill(fish.skill)
            if success then
                TriggerEvent('rd-fishing:caught_fish')
            
                if jobCallback ~= nil then
                    print("jobcallback not nil")
                    local jobCount = RPC.execute("getCurrentObjectCount", "fishing")
                    print(jobCount)
                    if jobCount < 30 then
                        print("jobCount less than 30")
                        jobCount = jobCount + 1
                        RPC.execute("updateObjectiveData", "fishing", 2, jobCount)
                        --jobCallback('updateObjectiveData', 'collect_twenty_fishes', 'count', jobCount)
                        
                        
                        if jobCount == 30 then
                            print("jobCount is 30")
                            -- send completion
                            RPC.execute("completeTask", "fishing", 2)
                            --jobCallback('updateObjectiveData', 'collect_twenty_fishes', 'status', 'completed')
                        end
                    else
                        print("jobCount not less than 30")
                        jobCallback = nil
                    end
                end
            
            else
                TriggerEvent("DoLongHudText", "It got away!!!!!!!", 2)
            end
        end
    end
    if not found then
        TriggerEvent("DoLongHudText", "No fish was hooked...", 1)
    end

    -- local rod = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.0, `prop_fishing_rod_01`, false, false, false)
    -- SetEntityAsMissionEntity(rod, 1, 1)
    if fishingRod ~= nil then
        DeleteObject(fishingRod)
        fishingRod = nil
    end
    ClearPedTasks(GetPlayerPed(-1))
end

local fishing = false
local trackedFishing = false
local function startFishing()
    if fishing then return end
    fishing = true

    local rodModel = "prop_fishing_rod_01"
    local rodHash = `prop_fishing_rod_01`

    RequestAnimDict("amb@world_human_stand_fishing@idle_a")
    RequestModel(rodModel)

    while not HasAnimDictLoaded("amb@world_human_stand_fishing@idle_a") or not HasModelLoaded(rodModel) do
        Citizen.Wait(0)
    end

    SetCurrentPedWeapon(PlayerPedId(), 0xA2719263) 
    local bone = GetPedBoneIndex(PlayerPedId(), 60309)
    
    if fishingRod ~= nil then
        DeleteObject(fishingRod)
        fishingRod = nil
    end

    fishingRod = CreateObject(rodHash, 1.0, 1.0, 1.0, 1, 1, 0)

    ClearPedTasksImmediately(PlayerPedId())

    AttachEntityToEntity(fishingRod, PlayerPedId(), bone, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 2, 1)
    Wait(0)
    TaskPlayAnim(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", 20.0, -8, -1, 49, 0, 0, 0, 0)

    local seconds = 0
    Citizen.CreateThread(function()
        while fishing do
            Citizen.Wait(5000)
            seconds = seconds + 5
            local chance = math.random() * 100
            if chance + seconds > 100 then
                fishing = false
                reelInFish()
            end
        end
    end)
    Citizen.CreateThread(function()
        while fishing do
            if not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", 3) then
                TaskPlayAnim(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", 20.0, -8, -1, 49, 0, 0, 0, 0)
            end
            Citizen.Wait(250)
        end
    end)
end

AddEventHandler("rd-inventory:itemUsed", function(item)
    if item == "fishingrod" then
        local coords = GetEntityCoords(PlayerPedId())
        local activeLocation = RPC.execute("fishing:getActiveLocation")
        if #(activeLocation.coords - coords) < 120 and not IsEntityInWater(PlayerPedId()) then
            startFishing()
        else
            TriggerEvent('DoLongHudText', "You can't fish here...", 2)
        end
        return
    end
    if not isValidFish(item) then return end
    TriggerEvent("inventory:removeItem", item, 1)
    local anim = "anim@heists@ornate_bank@hack"
    local type = "hack_enter"
    local fishName = "a_c_fish"
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
        RequestAnimDict(anim)
        RequestModel(fishName)

        while not HasAnimDictLoaded(anim) or not HasModelLoaded(fishName) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(ped, anim, type, 1.0, 1.0, 2575, 0, 0, 0, 0, 0)

        Citizen.Wait(800)

        local boneIndex = GetPedBoneIndex(ped, 0xfa70)
        local bonePos = GetWorldPositionOfEntityBone(ped, boneIndex)
        local obj = CreatePed(28, `a_c_fish`, bonePos.x, bonePos.y, bonePos.z, true, true, true)
        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, 57005), 0.1, 0, -0.1, -45.0, 45.0, 0.0, true, true, false, true, 1, true)

        Citizen.Wait(1750)

        DetachEntity(obj)
        ClearPedTasksImmediately(ped)

        Citizen.Wait(2000)

       DeletePed(obj)
        SetModelAsNoLongerNeeded(fishName)
    end)
end)

AddEventHandler("rd-fishing:jobEvent", function(pCallback)
    jobCallback = pCallback
end)

RegisterNetEvent('rd-fishing:caught_fish')
AddEventHandler('rd-fishing:caught_fish', function()
    local Fishies = math.random(1, 8)

    if Fishies == 1 then
        TriggerEvent("DoLongHudText", "You caught a Bass" , 1)
        TriggerEvent("player:receiveItem", 'fishingbass', 1)
    elseif Fishies == 2 then
        TriggerEvent("DoLongHudText", "You caught a Bluefish" , 1)
        TriggerEvent("player:receiveItem", 'fishingbluefish', 1)
    elseif Fishies == 3 then
        TriggerEvent("DoLongHudText", "You caught a Flounder" , 1)
        TriggerEvent("player:receiveItem", 'fishingflounder', 1)
    elseif Fishies == 4 then
        TriggerEvent("DoLongHudText", "You caught a Mackerel" , 1)
        TriggerEvent("player:receiveItem", 'fishingmackerel', 1)
    elseif Fishies == 5 then
        TriggerEvent("DoLongHudText", "You caught a Cod" , 1)
        TriggerEvent("player:receiveItem", 'fishingcod', 1)
    elseif Fishies == 6 then
        TriggerEvent("DoLongHudText", "You caught a Whale" , 1)
        TriggerEvent("player:receiveItem", 'fishingwhale', 1)
    elseif Fishies == 7 then
        TriggerEvent("DoLongHudText", "You caught a Dolphin" , 1)
        TriggerEvent("player:receiveItem", 'fishingdolphin', 1)
    elseif Fishies == 8 then
        TriggerEvent("DoLongHudText", "You caught a Shark" , 1)
        TriggerEvent("player:receiveItem", 'fishingshark', 1)
    end
end)