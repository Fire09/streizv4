STX.Events = STX.Events or {}
STX.Events.Total = 0
STX.Events.Active = {}
local weaponsLicence = 0
local passes = {}

function STX.Events.Trigger(self, event, args, callback)
    local id = STX.Events.Total + 1
    STX.Events.Total = id

    id = event .. ":" .. id

    if STX.Events.Active[id] then return end

    STX.Events.Active[id] = {cb = callback}
    
    TriggerServerEvent("rd-events:listenEvent", id, event, args)
end

RegisterNetEvent("rd-events:listenEvent")
AddEventHandler("rd-events:listenEvent", function(id, data)
    local ev = STX.Events.Active[id]
    
    if ev then
        ev.cb(data)
        STX.Events.Active[id] = nil
    end
end)

RegisterCommand("fml:admin-report", function()
    TriggerServerEvent("rd:fml:isInTime", true)
end)
RegisterCommand("fml:admin-report2", function()
    TriggerServerEvent("rd:fml:isInTime", false)
end)

exports("WeaponLicense", function() 
    if weaponsLicence == 1 then
        return true
    else
        return false
    end
end)

exports("Passes", function() 
    return passes
end)

RegisterNetEvent('rd-base:GetWeaponLicenses', function(weaponPass)
    weaponsLicence = weaponPass
end)

RegisterNetEvent('rd-base:passes', function(newpasses)
    passes = newpasses 
end)

local allowpolice = 0
local function SetGamePlayVars()
    Citizen.CreateThread(function()
        for i = 1, 25 do
            EnableDispatchService(i, false)
        end

        -- enable pvp
        for i = 0, 255 do
            if NetworkIsPlayerConnected(i) then
                if NetworkIsPlayerConnected(i) and GetPlayerPed(i) ~= nil then
                    SetCanAttackFriendly(GetPlayerPed(i), true, true)
                end
            end
        end

        NetworkSetFriendlyFireOption(true)

        -- Disable vehicle rewards
        DisablePlayerVehicleRewards(PlayerId())
        
        while true do
            Citizen.Wait(0)

            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)            
            local timer = 0

            if IsPedInAnyVehicle(ped, false) then
                if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), 0) == ped then
                    if GetIsTaskActive(ped, 165) then
                    --    SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped, false), 0)
                    end
                end

                timer = 0
            else
                if IsPedWearingHelmet(ped) then
                    timer = timer + 1

                    if timer >= 5000 and not IsPedInAnyVehicle(ped, true) then
                        RemovePedHelmet(ped, false)
                        timer = 0
                    end
                end
            end
        end
    end)

    Citizen.CreateThread(function()

        while true do
            Wait(1000)

            local id = PlayerId()
            if allowpolice == 0 then
                SetPlayerWantedLevel(id, 0, false)
                SetPlayerWantedLevelNow(id, false)
            else
                if allowpolice == 1 then
                    for i = 1, 25 do
                        EnableDispatchService(i, false)
                    end
                else
                    for i = 1, 25 do
                        EnableDispatchService(i, true)
                    end
                end

                SetPlayerWantedLevel(id, 2, false)
                SetPlayerWantedLevelNoDrop(id, 2, false)
                SetPlayerWantedLevelNow(id)
                print(GetPlayerWantedLevel(id))
            end
        end

    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local pos = GetEntityCoords(PlayerPedId(), false)
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2729.47, 1514.56, 23.79,false)
            if dist > 150.0 then
               ClearAreaOfCops(pos, 400.0)
            else
                Wait(5000)
            end
        end
    end)
end

local gamePlayStarted = false

AddEventHandler("rd-base:playerSessionStarted", function()
    if gamePlayStarted then return end
    gamePlayStarted = true
    SetGamePlayVars()
end)





RegisterNetEvent('robbery:aids')
AddEventHandler('robbery:aids', function()
    local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2729.47, 1514.56, 23.79,false)

    local myjob = exports["isPed"]:isPed("myjob")
    if myjob == "ems" or myjob == "doctor" or myjob == "cop"  then
        allowpolice = 0
        return
    end

    if dist < 100.0 then
        if allowpolice > 0 then
            allowpolice = 240
            return
        else
            allowpolice = 240
        end

        while allowpolice > 0 do
            Wait(1000)
            allowpolice = allowpolice - 1
        end

        allowpolice = 0
    end

end)