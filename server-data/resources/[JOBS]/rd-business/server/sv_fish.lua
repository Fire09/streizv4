-- ingredients

local fishAvailableStock = {}
local fishAvailableStockSpare = {}

RegisterServerEvent("fishAvailableStock")
AddEventHandler("fishAvailableStock", function(s)
    fishAvailableStock = s
end)

RegisterServerEvent("fishAvailableStockSpare")
AddEventHandler("fishAvailableStockSpare", function(t)
    fishAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectfish",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if fishAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqoil", 40)
        local raggsyy = fishAvailableStock - tonumber(downStock)
        TriggerClientEvent("fishAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasefish",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if fishAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqoil", 200)
        local raggsyy = fishAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("fishAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  