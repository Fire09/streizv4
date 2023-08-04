-- ingredients

local meatAvailableStock = {}
local meatAvailableStockSpare = {}

RegisterServerEvent("meatAvailableStock")
AddEventHandler("meatAvailableStock", function(s)
    meatAvailableStock = s
end)

RegisterServerEvent("meatAvailableStockSpare")
AddEventHandler("meatAvailableStockSpare", function(t)
    meatAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectmeat",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if meatAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqprotein", 40)
        local raggsyy = meatAvailableStock - tonumber(downStock)
        TriggerClientEvent("meatAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasemeat",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if meatAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqprotein", 200)
        local raggsyy = meatAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("meatAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  