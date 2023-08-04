RegisterNetEvent("rd-vehicleSync:updateSyncState")
AddEventHandler("rd-vehicleSync:updateSyncState", function(pNetId, pSyncState)
    TriggerClientEvent("rd-vehicleSync:updateSyncState", -1, pNetId, pSyncState)
end)