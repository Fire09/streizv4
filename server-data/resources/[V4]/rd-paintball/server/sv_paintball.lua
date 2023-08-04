RegisterServerEvent("rd-paintball:getArenaType")
AddEventHandler("rd-paintball:getArenaType", function()
    local src = source
    TriggerClientEvent("rd-paintball:changeArenaType", src, "wasteland")
end)

RPC.register("rd-paintball:setArenaType", function(pSource, pArgs)
    TriggerClientEvent("rd-paintball:changeArenaType", pSource, pArgs)
end)