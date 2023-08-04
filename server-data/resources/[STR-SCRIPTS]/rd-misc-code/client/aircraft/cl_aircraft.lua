local currentVehicle, currentModel = nil
local isRunning = false

local bombCamera = 0
local bombModel = 0

local flareModel = `weapon_flaregun`

local flareReleaseSound = "flares_released"
local flareEmptySound = "flares_empty"
local flareSoundDict = "DLC_SM_Countermeasures_Sounds"

local supportedModels = {
    [`akula`] = {
        hasBombs = true,
        camOffset = vector3(0.0, 0.0, 0.8),
        unkOffset = 0.4
    },
    [`alphaz1`] = {
        hasFlares = true
    },
    [`avenger`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.0, 0.5),
        unkOffset = 0.36,
        hasVTOL = true
    },
    [`bombushka`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.3, 0.8),
        unkOffset = 0.43
    },
    [`cuban800`] = {
        hasBombs = true,
        camOffset = vector3(0.0, 0.2, 1.0),
        unkOffset = 0.5
    },
    [`havok`] = {
        hasFlares = true
    },
    [`howard`] = {
        hasFlares = true
    },
    [`hunter`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.0, 1.0),
        unkOffset = 0.5
    },
    [`mogul`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.2, 0.97),
        unkOffset = 0.45
    },
    [`molotok`] = {
        hasFlares = true
    },
    [`nokota`] = {
        hasFlares = true
    },
    [`pyro`] = {
        hasFlares = true
    },
    [`rogue`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.3, 1.10),
        unkOffset = 0.46
    },
    [`seabreeze`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.2, 0.4),
        unkOffset = 0.5
    },
    [`starling`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.25, 0.55),
        unkOffset = 0.55
    },
    [`thruster`] = {
        hasFlares = true
    },
    [`tula`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.0, 1.0),
        unkOffset = 0.6,
        hasVTOL = true
    },
    [`volatol`] = {
        hasFlares = true,
        hasBombs = true,
        camOffset = vector3(0.0, 0.0, 2.0),
        unkOffset = 0.54
    }
}

local bombModels = {
    [1] = 1794615063, -- fire explosion
    [2] = 1430300958, -- gas explosion
    [3] = 220773539, -- cluster explosion
}

local function canDropBombs(pModelInfo)
    if DoesEntityExist(currentVehicle) and IsEntityAVehicle(currentVehicle) and not IsEntityDead(currentVehicle) then
        if pModelInfo.hasBombs and GetVehicleMod(currentVehicle, 9) > -1 then
            if pModelInfo.hasVTOL and GetVehicleFlightNozzlePosition(currentVehicle) == 1.0 then return false end
            return true
        end
    end
    return false
end

local function canShootFlares(pModelInfo)
    if DoesEntityExist(currentVehicle) and IsEntityAVehicle(currentVehicle) and not IsEntityDead(currentVehicle) then
        if pModelInfo.hasFlares and GetVehicleMod(currentVehicle, 1) == 1 then
            return true
        end
    end
    return false
end

local function func_5791(fParam0, fParam1, fParam2, fParam3, fParam4)
    return ((((fParam1 - fParam0) / (fParam3 - fParam2)) * (fParam4 - fParam2)) + fParam0)
end

local function func_5790(vParam0, vParam1, fParam2, fParam3, fParam4)
    return vector3(func_5791(vParam0.x, vParam1.x, fParam2, fParam3, fParam4),
        func_5791(vParam0.y, vParam1.y, fParam2, fParam3, fParam4),
        func_5791(vParam0.z, vParam1.z, fParam2, fParam3, fParam4))
end

local function getBombPosition(pModelInfo)
    local dimensionPos1, dimensionPos2 = GetModelDimensions(currentModel)
    local vVar0 = GetOffsetFromEntityInWorldCoords(currentVehicle, dimensionPos1.x, dimensionPos2.y, dimensionPos1.z)
    local vVar1 = GetOffsetFromEntityInWorldCoords(currentVehicle, dimensionPos2.x, dimensionPos2.y, dimensionPos1.z)
    local vVar2 = GetOffsetFromEntityInWorldCoords(currentVehicle, dimensionPos1.x, dimensionPos1.y, dimensionPos1.z)
    local vVar3 = GetOffsetFromEntityInWorldCoords(currentVehicle, dimensionPos2.x, dimensionPos1.y, dimensionPos1.z)

    local vVar4 = func_5790(vVar0, vVar1, 0.0, 1.0, 0.5)
    local vVar5 = func_5790(vVar2, vVar3, 0.0, 1.0, 0.5)

    vVar4 = vVar4 + vector3(0.0, 0.0, 0.4)
    vVar5 = vVar5 + vector3(0.0, 0.0, 0.4)

    local vVar6 = func_5790(vVar4, vVar5, 0.0, 1.0, pModelInfo.unkOffset)

    vVar4 = vVar4 - vector3(0.0, 0.0, 0.2)
    vVar5 = vVar5 - vector3(0.0, 0.0, 0.2)

    local vVar7 = func_5790(vVar4, vVar5, 0.0, 1.0, pModelInfo.unkOffset - 0.0001)
    local pos = vVar6
    local offset = vVar7

    return pos, offset
end

local function getBombCamera()
    if not DoesCamExist(bombCamera) then
        bombCamera = CreateCameraWithParams(26379945, 0.0, 0.0, 0.0, -90.0, 0.0, GetEntityHeading(PlayerPedId()), 65.0, 1, 2)
    end
    return bombCamera
end

local function dropBomb(pModelInfo)
    local pos, offset = getBombPosition(pModelInfo)
    local bombVehicleModId = GetVehicleMod(currentVehicle, 9)
    if bombVehicleModId == 0 then
        if currentModel == `volatol` then
            bombModel = 1856325840
        else
            bombModel = -1695500020
        end
    elseif bombVehicleModId > 0 and bombVehicleModId < 4 then
        bombModel = bombModels[bombVehicleModId]
    end
    RequestModel(bombModel)
    RequestWeaponAsset(bombModel, 31, 26)
    while not HasWeaponAssetLoaded(bombModel) do
        Citizen.Wait(1)
    end
    
    ShootSingleBulletBetweenCoordsWithExtraParams(pos, offset, 0, true, bombModel, PlayerPedId(), true, true, -4.0, veh, false, false, false, true, true, false)
    PlaySoundFromEntity(-1, "bomb_deployed", veh, "DLC_SM_Bomb_Bay_Bombs_Sounds", true)
end

local function runAirplane()
    isRunning = true
    RequestScriptAudioBank(flareSoundDict)
    RequestModel(flareModel)
    RequestWeaponAsset(flareModel, 31, 26)
    CreateThread(function()
        local modelInfo = supportedModels[currentModel]
        local isInputRunning = false
        while isRunning do
            if IsControlJustReleased(0, 117) and canShootFlares(modelInfo) then
                local pos = GetEntityCoords(currentVehicle)
                local offset1 = GetOffsetFromEntityInWorldCoords(currentVehicle, -6.0, -4.0, -0.2)
                local offset2 = GetOffsetFromEntityInWorldCoords(currentVehicle, -3.0, -4.0, -0.2)
                local offset3 = GetOffsetFromEntityInWorldCoords(currentVehicle, 6.0, -4.0, -0.2)
                local offset4 = GetOffsetFromEntityInWorldCoords(currentVehicle, 3.0, -4.0, -0.2)
                PlaySoundFromEntity(-1, flareReleaseSound, entity, flareSoundDict, true)
                ShootSingleBulletBetweenCoordsIgnoreEntityNew(pos, offset1, 0, true, flareModel, PlayerPedId(),
                    true, true, speed, entity, false, false, false, true, true, false)
                ShootSingleBulletBetweenCoordsIgnoreEntityNew(pos, offset2, 0, true, flareModel, PlayerPedId(),
                    true, true, speed, entity, false, false, false, true, true, false)
                ShootSingleBulletBetweenCoordsIgnoreEntityNew(pos, offset3, 0, true, flareModel, PlayerPedId(),
                    true, true, speed, entity, false, false, false, true, true, false)
                ShootSingleBulletBetweenCoordsIgnoreEntityNew(pos, offset4, 0, true, flareModel, PlayerPedId(),
                    true, true, speed, entity, false, false, false, true, true, false)
                Wait(1)
                local timer = GetGameTimer()
                while GetGameTimer() - timer < 2000 do
                    if IsControlJustReleased(0, 117) then
                        if DoesEntityExist(currentVehicle) then
                            PlaySoundFromEntity(-1, flareEmptySound, currentVehicle, flareSoundDict, true)
                        end
                    end
                    Wait(0)
                end
            end
            if IsControlPressed(0, 118) and canDropBombs(modelInfo) then
                local toggle = false
                local timer = GetGameTimer()
                while IsControlPressed(0, 118) do
                    if GetGameTimer() - timer > 500 then
                        toggle = true
                        break
                    end
                    Wait(0)
                end
                if toggle then
                    if AreBombBayDoorsOpen(currentVehicle) then
                        CloseBombBayDoors(currentVehicle)
                        ClearPedTasks(PlayerPedId())
                        StopAudioScene("DLC_SM_Bomb_Bay_View_Scene")
                        SetCamActive(getBombCamera(), false)
                        RenderScriptCams(false, false, 0, false, false)
                        DestroyCam(getBombCamera(), false)
                        DestroyAllCams(true)
                    else
                        OpenBombBayDoors(currentVehicle)
                        SetCamActive(getBombCamera(), true)
                        local p = getBombPosition(modelInfo)
                        local pOff = GetOffsetFromEntityGivenWorldCoords(currentVehicle, p.x, p.y, p.z) + modelInfo.camOffset
                        AttachCamToEntity(getBombCamera(), currentVehicle, pOff, true)
                        RenderScriptCams(true, false, 0, false, false)
                        local targetPosition = GetOffsetFromEntityInWorldCoords(currentVehicle, 0.0, 10000.0, 0.0)
                        if IsThisModelAPlane(GetEntityModel(currentVehicle)) then
                            TaskPlaneMission(PlayerPedId(), currentVehicle, 0, 0, targetPosition, 4, 30.0, 0.1,
                                GetEntityHeading(currentVehicle), 30.0, 20.0)
                        end
                        StartAudioScene("DLC_SM_Bomb_Bay_View_Scene")
                        SetPlaneTurbulenceMultiplier(currentVehicle, 0.0)
                    end
                end
            end
            while IsControlPressed(0, 118) do
                Wait(0)
            end
            if AreBombBayDoorsOpen(currentVehicle) then
                DisableControlAction(0, 114)
                if IsControlJustReleased(0, 255) then
                    dropBomb(modelInfo)
                    local tmp_timer = GetGameTimer()
                    while GetGameTimer() - tmp_timer < 1000 do
                        Citizen.Wait(0)
                        DisableControlAction(0, 114)
                        if IsControlJustReleased(0, 255) then
                            PlaySoundFromEntity(-1, "chaff_cooldown", currentVehicle, flareSoundDict, true)
                        end
                    end
                end
            else
                if not IsGameplayCamRendering() then
                    SetCamActive(getBombCamera(), false)
                    RenderScriptCams(false, false, 0, false, false)
                    DestroyCam(getBombCamera(), false)
                    DestroyAllCams(true)
                end
            end
            Wait(0)
        end
    end)
end

local function isPermitted()
    return RPC.execute("rd-misc-code:isAllowedAirCraft") or false
end

AddEventHandler('baseevents:enteredVehicle', function(pVehicle, pSeat, pName, pClass, pModel)
    if ((pClass == 15 or pClass == 16) and supportedModels[pModel]) then
        if not isPermitted() then return end
        currentVehicle = pVehicle
        currentModel = pModel
        if not isRunning then
            runAirplane()
        end
    end
end)

AddEventHandler('baseevents:vehicleHotreload', function(pVehicle, pSeat, pEngineOn)
    local vehicleClass = GetVehicleClass(pVehicle)
    local vehicleModel = GetEntityModel(pVehicle)
    if ((vehicleClass == 15 or vehicleClass == 16) and supportedModels[vehicleModel]) then
        if not isPermitted() then return end
        currentVehicle = pVehicle
        currentModel = vehicleModel
        if not isRunning then
            runAirplane()
        end
    end
end)


AddEventHandler('baseevents:leftVehicle', function(pVehicle, pSeat, pName, pClass)
    currentVehicle = nil
    currentModel = nil
    isRunning = false
    if HasModelLoaded(flareModel) then
        SetModelAsNoLongerNeeded(flareModel)
    end
end)

