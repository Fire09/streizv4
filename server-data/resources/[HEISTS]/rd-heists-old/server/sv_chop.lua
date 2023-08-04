RegisterServerEvent("rd-chopshop:vehicle_loot")
AddEventHandler("rd-chopshop:vehicle_loot", function(string)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Reward= math.random(1500, 2000)
    if string == "tyre" then
        TriggerClientEvent("player:receiveItem", src, "recyclablematerial", math.random(8, 15), false)
    elseif string == "door" then
        TriggerClientEvent("player:receiveItem", src, "recyclablematerial", math.random(8, 15), false)
    elseif string == "remains" then
        local roll = math.random(1, 2)
        if roll == 1 then
            TriggerClientEvent('DoLongHudText', src, 'Well this one was bad wasnt it ...', 2)
            TriggerClientEvent('player:receiveItem', src, 'recyclablematerial', math.random(2, 8))
        elseif roll == 2 then
            TriggerClientEvent('DoLongHudText', src, 'Well this was good wasnt it ...', 1)
            TriggerClientEvent('player:receiveItem', src, 'recyclablematerial', math.random(20, 35))
        end
    end
end)
