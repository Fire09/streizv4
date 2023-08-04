local active_launders = {}

RPC.register('doors:triggerCasinoLaundryDoor',function()
    local src = source

end)

RPC.register('rd-casino:hotel:canUseLaundry',function(laundryId, boolean)
    local src = source
    if active_launders[laundryId] == nil then
            active_launders[laundryId] = {boolean}
        return true
    else
        return false
    end
end)

RPC.register('rd-casino:hotel:finishup',function(id , tab)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(450,1430) or 500)
    TriggerClientEvent("inventory:removeItem",src,'casinogoldcoin', 1)
    TriggerClientEvent("inventory:removeItem",src,'markedbills', 5)
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000000 * 2) -- Lets reset all every 30 mins 
        active_launders = nil
    end
end)