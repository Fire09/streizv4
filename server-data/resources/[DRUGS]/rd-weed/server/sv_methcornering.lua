RPC.register("rd-meth:startCorner", function(pSource, pCoords)
    return true, "Started Cornering!"
end)

RPC.register("rd-meth:cornerPed", function(pSource, pCoords, pPed, pVehicle)
    TriggerClientEvent("rd-meth:cornerPed", pSource, pPed.param, pCoords.param, pVehicle.param)
    return true
end)

RPC.register("rd-meth:cornerSyncHandoff", function(pSource, pCoords, pPed)
    TriggerClientEvent("rd-meth:cornerSyncHandoff", -1, pPed.param, pCoords.param)
    return true
end)

RPC.register("rd-meth:cornerSale", function(pSource, pCoords, pPed, pZone)
    TriggerClientEvent("rd-meth:addCorneredPed", pSource, pPed.param)
    return true
end)