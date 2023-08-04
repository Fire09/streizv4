RegisterServerEvent("drp:sync:player:ready")
AddEventHandler("drp:sync:player:ready",function()
    
end)

RegisterServerEvent("sync:request")
AddEventHandler("sync:request",function(native,pTargetId,NetId, ...)
    TriggerClientEvent("sync:execute", -1, native,NetId, ...)
end)

RegisterServerEvent("rd-sync:executeSyncNative")
AddEventHandler("rd-sync:executeSyncNative",function(name, netEntity, options, args)
    TriggerClientEvent("rd-sync:clientExecuteSyncNative",-1,name, netEntity, options, args)
end)