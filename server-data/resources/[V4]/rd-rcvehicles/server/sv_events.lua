RPC.register("rd-rcvehicles:pickupCar", function(pSource, pCarId)
end)

RPC.register("rd-rcvehicles:pickupDrone", function(pSource, pDroneId)
    print("pickup", pDroneId)
    local src = pSource
    local pEntity = NetworkGetEntityFromNetworkId(pDroneId)

    if DoesEntityExist(pEntity) then
        placeDrone = false
        DeleteEntity(pEntity)
    end

    TriggerClientEvent("rd-rcvehicles:drone:destroy", src, pEntity)
    TriggerClientEvent("player:receiveItem", src, "drone_civ", 1)  ---- Need check first , if is lspd must change to lspd ==
    return true
end)

RPC.register("rd-rcvehicles:placeCar", function(pSource, pSettings)
    local src = pSource

    if not placeCar then
        placeCar = true
        local tempCar = CreateVehicle(pSettings.model, vector4(pSettings.position.x, pSettings.position.y, pSettings.position.z, pSettings.rotation.z), true, false)
        Citizen.Wait(100)
        local rData = {
            id = pSettings.id,
            name = pSettings.name,
            netId = NetworkGetNetworkIdFromEntity(tempCar),
            position = pSettings.position,
            rotation = pSettings.rotation,
            camOffset = pSettings.camOffset,
            maxDistance = pSettings.maxDistance,
            lifeTime = pSettings.lifeTime,
            start = os.time(),
        }

        TriggerClientEvent("rd-rcvehicles:car:setup", src, rData)
        TriggerClientEvent("rd-rcvehicles:car:spawn", src, rData)
        TriggerClientEvent("inventory:removeItem", src, pSettings.item, 1)
        return true
    end

    return false
end)

RPC.register("rd-rcvehicles:pilotCar", function(pSource, pCarId)
    local src = pSource
    TriggerClientEvent("rd-rcvehicles:car:pilot", src, pCarId)
    return true
end)

RPC.register("rd-rcvehicles:leaveCar", function(pSource, pCarId)
    local src = pSource
    TriggerClientEvent("rd-rcvehicles:car:destroy", src, pCarId)
    return true
end)

RPC.register("rd-rcvehicles:crashCar", function(pSource, pCarId)
    local src = pSource
    TriggerClientEvent("rd-rcvehicles:car:destroy", src, pCarId)
    return true
end)

RPC.register("rd-rcvehicles:placeDrone", function(pSource, pSettings)
    local src = pSource

    if not placeDrone then
        placeDrone = true
        local tempDrone = CreateObjectNoOffset(pSettings.model, pSettings.position.x, pSettings.position.y, pSettings.position.z, true, true, true)
        Citizen.Wait(100)
        local rData = {
            id = pSettings.id,
            name = pSettings.name,
            netId = NetworkGetNetworkIdFromEntity(tempDrone),
            position = pSettings.position,
            rotation = pSettings.rotation,
            camOffset = pSettings.camOffset,
            maxDistance = pSettings.maxDistance,
            lifeTime = pSettings.lifeTime,
            start = os.time(),
        }
    
        TriggerClientEvent("rd-rcvehicles:drone:spawn", src, rData)
        TriggerClientEvent("inventory:removeItem", src, pSettings.item, 1)
        return true
    end

    return false
end)

RPC.register("rd-rcvehicles:pilotDrone", function(pSource, pDroneId)
    local src = pSource
    TriggerClientEvent("rd-rcvehicles:drone:pilot", src, pDroneId)
    return true
end)

RPC.register("rd-rcvehicles:leaveDrone", function(pSource, pDroneId)
    local src = pSource
    TriggerClientEvent("rd-rcvehicles:drone:destroy", src, pDroneId)
    return true
end)

RPC.register("rd-rcvehicles:crashDrone", function(pSource, pDroneId)
    local src = pSource
    TriggerClientEvent("rd-rcvehicles:drone:destroy", src, pDroneId)
    return true
end)