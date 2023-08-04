RegisterNetEvent("drp:flags:get")
AddEventHandler("drp:flags:get", function(callID, netID, entityType, flagType)
    local flags, entity = 0

    if entityType == "player" then
        entity = GetPlayerPed(GetPlayerFromServerId(netID))
    else
        entity = NetworkGetEntityFromNetworkId(netID)
    end

    if DoesEntityExist(entity) then
        flags = DecorGetInt(entity, flagType)
    end

    TriggerServerEvent("drp:flags:set", callID, netID, flagType, flags)
end)

RegisterNetEvent("drp:flags:set")
AddEventHandler("drp:flags:set", function(netID, entityType, flagType, flags)
    local entity = nil

    if entityType == "player" then
        entity = GetPlayerPed(GetPlayerFromServerId(netID))
    else
        entity = NetworkGetEntityFromNetworkId(netID)
    end

    if DoesEntityExist(entity) then
        DecorSetInt(entity, flagType, flags)
    end
end)

function NotifyChange(pType, pEntity, pFlag, pState)
    local event = ('drp:flags:%s:stateChanged'):format(pType)
    local netId = NetworkGetNetworkIdFromEntity(pEntity)

    -- fml... Maybe we should move player flags to its own category?
    if pType == 'ped' and IsPedAPlayer(pEntity) then
        netId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(pEntity))
    end

    TriggerEvent(event, pEntity, pFlag, pState)
    TriggerServerEvent(event, netId, pFlag, pState)
end