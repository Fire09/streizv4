RPC.register("rd-bowling:purchaseItem", function(key, lane)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local money = tonumber(user:getCash())    
    if(lane == true) then
        if money >= tonumber(25) then
            user:removeMoney(25)
            info = {
                lane = key
            }
            TriggerClientEvent("player:receiveItem", src, "bowlingreceipt", 1, true, info)
            value = true
        else
            TriggerClientEvent("DoLongHudText", src, "Not Enough Money", 2)
        end
    else
        if money >= tonumber(50) then
            value = true
            user:removeMoney(50)
            TriggerClientEvent('player:receiveItem', src, 'bowlingball', 1)
        else
            TriggerClientEvent("DoLongHudText", src, "Not Enough Money", 2)
        end
    end
    return value
end)

RegisterServerEvent("rd-bowling:lanePurchase")
AddEventHandler("rd-bowling:lanePurchase", function(key, lane)
--RPC.register("rd-bowling:lanePurchase", function(key, lane)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local money = tonumber(user:getCash())   
        if money >= tonumber(25) then
            user:removeMoney(25)
            info = {
                lane = key
            }
            TriggerClientEvent("player:receiveItem", src, "bowlingreceipt", 1, true, info)
            value = true 
        else 
            TriggerClientEvent("DoLongHudText", src, "Not Enough Money", 2)
    end
    return value
end)