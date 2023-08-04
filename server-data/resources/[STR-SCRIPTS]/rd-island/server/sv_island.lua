RegisterServerEvent("rd-island:checkIslandSwapping")
AddEventHandler("rd-island:checkIslandSwapping",function(pEnabled)
    TriggerClientEvent("rd-island:enableSwapping", -1, pEnabled)
end)