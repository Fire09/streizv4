RegisterServerEvent('rd-drifting:driftcars:attemptPurchase', function(car,price)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
     local char = user:getCurrentCharacter()
    if tonumber(char.bank) >= price then
        TriggerClientEvent('rd-drifting:driftcars:vehiclespawn', src, car)
        user:removeBank(price)
    else
        TriggerClientEvent('rd-drifting:driftcars:attemptvehiclespawnfail', src)
    end
end)
