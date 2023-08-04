-- ingredients

local chefAvailableStock = {}
local chefAvailableStockSpare = {}

RegisterServerEvent("chefAvailableStock")
AddEventHandler("chefAvailableStock", function(s)
    chefAvailableStock = s
end)

RegisterServerEvent("chefAvailableStockSpare")
AddEventHandler("chefAvailableStockSpare", function(t)
    chefAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectchef",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if chefAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqchefing", 40)
        local raggsyy = chefAvailableStock - tonumber(downStock)
        TriggerClientEvent("chefAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasechef",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if chefAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqchefing", 200)
        local raggsyy = chefAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("chefAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  