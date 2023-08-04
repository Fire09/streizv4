local pNetId, pData = {}

RegisterServerEvent("rd-atc:updateFlightData")
AddEventHandler("rd-atc:updateFlightData", function(NetId, Data)
    pNetId = NetId
    pData = Data
end)

STR.register("rd-atc:updateFlightData", function()
    local pSrc = source
    TriggerClientEvent("rd-atc:updateFlightData", -1, pNetId, pData)
end)