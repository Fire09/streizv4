-- ingredients

local vegetableAvailableStock = {}
local vegetableAvailableStockSpare = {}

RegisterServerEvent("vegetableAvailableStock")
AddEventHandler("vegetableAvailableStock", function(s)
    vegetableAvailableStock = s
end)

RegisterServerEvent("vegetableAvailableStockSpare")
AddEventHandler("vegetableAvailableStockSpare", function(t)
    vegetableAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectvegetable",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if vegetableAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqvegetables", 40)
        local raggsyy = vegetableAvailableStock - tonumber(downStock)
        TriggerClientEvent("vegetableAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasevegetable",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if vegetableAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqvegetables", 200)
        local raggsyy = vegetableAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("vegetableAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  