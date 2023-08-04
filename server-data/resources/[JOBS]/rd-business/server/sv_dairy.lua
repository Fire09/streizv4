-- ingredients

local dairyAvailableStock = {}
local dairyAvailableStockSpare = {}

RegisterServerEvent("dairyAvailableStock")
AddEventHandler("dairyAvailableStock", function(s)
    dairyAvailableStock = s
end)

RegisterServerEvent("dairyAvailableStockSpare")
AddEventHandler("dairyAvailableStockSpare", function(t)
    dairyAvailableStockSpare = t
end)

RPC.register("rd-business:ingredients:collectdairy",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 280
    local striez = false
    local downStock = 40
    if dairyAvailableStock == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqdairying", 40)
        local raggsyy = dairyAvailableStock - tonumber(downStock)
        TriggerClientEvent("dairyAvailableStockS", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)

  RPC.register("rd-business:ingredients:purchasedairy",function(pSource,pData)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    local price = 2800
    local striez = false
    local downStock = 200
    if dairyAvailableStockSpare == 0 then 
        TriggerClientEvent("DoLongHudText", src, "You can't buy the products because the product is out of stock!", 2)
        return false end
    if user:getCash() >= price then
        user:removeMoney(price)
        TriggerClientEvent("player:receiveItem", src, "lqdairying", 200)
        local raggsyy = dairyAvailableStockSpare - tonumber(downStock)
        TriggerClientEvent("dairyAvailableStockSSpare", -1, src, raggsyy)
        striez = true
    else 
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money.", 2)
        striez = false
    end
    return striez
  end)
  