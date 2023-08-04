-- ingredients

local docksAvailableStock = {}
local docksAvailableStockSpare = {}

RegisterServerEvent("docksAvailableStock")
AddEventHandler("docksAvailableStock", function(s)
    docksAvailableStock = s
end)

RegisterServerEvent("docksAvailableStockSpare")
AddEventHandler("docksAvailableStockSpare", function(t)
    docksAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectdocks",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if docksAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqsugar", 40)
        local raggsyy = docksAvailableStock - tonumber(downStock)
        TriggerClientEvent("docksAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasedocks",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if docksAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqsugar", 200)
        local raggsyy = docksAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("docksAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  