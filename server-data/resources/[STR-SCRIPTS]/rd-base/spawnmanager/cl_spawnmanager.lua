STX.SpawnManager = {}

function STX.SpawnManager.Initialize(self)
    Citizen.CreateThread(function()

        FreezeEntityPosition(PlayerPedId(), true)

        DoScreenFadeOut(500)

        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)

        SetCamRot(cam, 0.0, 0.0, -45.0, 2)
        SetCamCoord(cam, -682.0, -1092.0, 226.0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)

        local ped = PlayerPedId()

        SetEntityCoordsNoOffset(ped, -682.0, -1092.0, 200.0, false, false, false, true)

        DoScreenFadeIn(2000)

        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end

        Citizen.Wait(5000)

        TriggerEvent("rd-base:spawnInitialized")
        TriggerServerEvent("rd-base:spawnInitialized")
        TriggerServerEvent('rd-playerlist:updatePlayerCount')
    end)
end

function STX.SpawnManager.InitialSpawn(self)
    Citizen.CreateThread(function()
        DisableAllControlActions(0)
      
        DoScreenFadeOut(10)

        while IsScreenFadingOut() do
            Citizen.Wait(0)
        end

        local character = STX.LocalPlayer:getCurrentCharacter()

        local ped = PlayerPedId()

        SetEntityVisible(ped, true)
        FreezeEntityPosition(PlayerPedId(), false)
        
        ClearPedTasksImmediately(ped)
        RemoveAllPedWeapons(ped)
        --ClearPlayerWantedLevel(PlayerId())

        EnableAllControlActions(0)

        TriggerEvent("character:finishedLoadingChar")
    end)
end

AddEventHandler("rd-base:firstSpawn", function()
    STX.SpawnManager:InitialSpawn()
end)

RegisterNetEvent('rd-base:clearStates')
AddEventHandler('rd-base:clearStates', function()
    TriggerEvent("isJudgeOff")
    TriggerServerEvent("reset:blips")
    TriggerEvent("nowEMSDeathOff")
    TriggerEvent("police:noLongerCop")
    TriggerEvent("nowCopDeathOff")
    TriggerEvent("stopSpeedo")
    TriggerServerEvent("TokoVoip:removePlayerFromAllRadio",GetPlayerServerId(PlayerId()))
    TriggerEvent("wk:disableRadar")
end)
