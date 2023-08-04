local carcasses = {
    { name = "huntingcarcass1", price = 250, illegal = false },
    { name = "huntingcarcass2", price = 500, illegal = false },
    { name = "huntingcarcass3", price = 1000, illegal = false },
    { name = "huntingcarcass4", price = 18, illegal = true },
}
local nightTime = false

local function sellAnimals()
    local totalCash = 0
    local totalBMarketCash = 0

    for _, carcass in pairs(carcasses) do
        local qty = exports["rd-inventory"]:getQuantity(carcass.name)

        if qty > 0 then
            if not carcass.illegal then
                totalCash = totalCash + (carcass.price * qty)
                TriggerEvent("inventory:removeItem", carcass.name, qty)
            elseif nightTime then
                totalBMarketCash = totalBMarketCash + (carcass.price * qty)
                TriggerEvent("inventory:removeItem", carcass.name, qty)
            end
        end
    end

    if totalCash == 0 and totalBMarketCash == 0 then
        TriggerEvent("DoLongHudText", "Nothing to sell, dummy.", 2)
    end
    
    if totalCash > 0 then
        RPC.execute("givePlayerJobPay", "hunting_sales", totalCash)
        TriggerEvent("DoLongHudText", "Added to bank!")
    end

    if totalBMarketCash > 0 then
        TriggerEvent("player:receiveItem", "band", totalBMarketCash)
    end
end

RegisterNetEvent("timeheader")
AddEventHandler("timeheader", function(pHour, pMinutes)
    if pHour > 19 or pHour < 5 then
        nightTime = true
    else
        nightTime = false
    end
end)

AddEventHandler("rd-hunting:makeSales", function()
    sellAnimals()
    Wait(0)
end)