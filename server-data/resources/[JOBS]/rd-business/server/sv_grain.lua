-- ingredients

local grainAvailableStock = {}
local grainAvailableStockSpare = {}

RegisterServerEvent("grainAvailableStock")
AddEventHandler("grainAvailableStock", function(s)
    grainAvailableStock = s
end)

RegisterServerEvent("grainAvailableStockSpare")
AddEventHandler("grainAvailableStockSpare", function(t)
    grainAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectgrain",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if grainAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqgrain", 40)
        local raggsyy = grainAvailableStock - tonumber(downStock)
        TriggerClientEvent("grainAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasegrain",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if grainAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqgrain", 200)
        local raggsyy = grainAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("grainAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  