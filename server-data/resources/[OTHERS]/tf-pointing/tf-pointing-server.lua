RegisterNetEvent("fetchPointingNatives")
AddEventHandler("fetchPointingNatives", function(pArgs)
TriggerClientEvent("receivePointingNatives", pArgs)
end)