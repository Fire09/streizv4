-- ingredients

local leavenAvailableStock = {}
local leavenAvailableStockSpare = {}

RegisterServerEvent("leavenAvailableStock")
AddEventHandler("leavenAvailableStock", function(s)
    leavenAvailableStock = s
end)

RegisterServerEvent("leavenAvailableStockSpare")
AddEventHandler("leavenAvailableStockSpare", function(t)
    leavenAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectLeaven",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if leavenAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqleavening", 40)
        local raggsyy = leavenAvailableStock - tonumber(downStock)
        TriggerClientEvent("leavenAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchaseLeaven",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if leavenAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqleavening", 200)
        local raggsyy = leavenAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("leavenAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  