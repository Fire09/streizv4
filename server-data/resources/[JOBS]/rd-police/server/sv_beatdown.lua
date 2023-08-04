RegisterNetEvent("police:sendBeatMode")
AddEventHandler("police:sendBeatMode", function(pTarget)
    TriggerClientEvent("police:recieveBeatMode", pTarget)
end)