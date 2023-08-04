RPC.register("rd-weed:startCorner", function(pSource, pCoords)
    return true, "Started Cornering!"
end)

RPC.register("rd-weed:cornerPed", function(pSource, pCoords, pPed, pVehicle)
    TriggerClientEvent("rd-weed:cornerPed", pSource, pPed.param, pCoords.param, pVehicle.param)
    return true
end)

RPC.register("rd-weed:cornerSyncHandoff", function(pSource, pCoords, pPed)
    TriggerClientEvent("rd-weed:cornerSyncHandoff", -1, pPed.param, pCoords.param)
    return true
end)

RPC.register("rd-weed:cornerSale", function(pSource, pCoords, pPed, pZone)
    TriggerClientEvent("rd-weed:addCorneredPed", pSource, pPed.param)
    return true
end)