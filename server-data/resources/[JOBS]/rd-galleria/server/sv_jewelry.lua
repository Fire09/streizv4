RegisterServerEvent("rd-gallery:craftJewelryItem")
AddEventHandler("rd-gallery:craftJewelryItem", function(pType, pCost)
    local pSrc = source
    if pType == "ring" then
        TriggerClientEvent("player:receiveItem", pSrc, "jewelry_ring", pCost)
    else
        TriggerClientEvent("player:receiveItem", pSrc, "jewelry_necklace", pCost)
    end
end)