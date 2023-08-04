RegisterNetEvent("rd-vehicleSync:updateSirenState")
AddEventHandler("rd-vehicleSync:updateSirenState", function(pNetId, pSirenState, pSirenPreset)
    TriggerClientEvent("rd-vehicleSync:updateSirenState", -1, pNetId, pSirenState, pSirenPreset)
end)