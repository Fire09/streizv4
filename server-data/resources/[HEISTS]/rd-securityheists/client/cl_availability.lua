RegisterNetEvent('rd-illegalactivities:check_availability')
AddEventHandler('rd-illegalactivities:check_availability', function()

	local WholeMenuKekw = {
		{
            title = "Fleeca Bank",
            description = "Check Fleeca Bank Availability",
            action = "rd-illegalactivities:avail_fleeca",
        },
        {
            title = "Jewelry Store",
            description = "Check Jewelry Store Availability",
            action = "rd-illegalactivities:avail_jewel",
        },
        {
            title = "Paleto Bank",
            description = "Check Paleto Bank Availability",
            action = "rd-illegalactivities:avail_paleto",
        },
    }
    exports["rd-ui"]:showContextMenu(WholeMenuKekw)
end)

RegisterUICallback('rd-illegalactivities:avail_fleeca', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent('riddlevrp-heists:fleeca_availability')
end)

RegisterUICallback('rd-illegalactivities:avail_jewel', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent('rd-heists:get_vangelico_availability')
end)

RegisterUICallback('rd-illegalactivities:avail_paleto', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent('rd-heists:paleto_avail_check')
end)

RegisterUICallback('rd-illegalactivities:buylaptop2', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-paletousb')
end)

RegisterUICallback('rd-illegalactivities:buylaptop1', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-fleecausb')
end)

RegisterNetEvent('rd-fleecausb')
AddEventHandler('rd-fleecausb', function()
    if exports['rd-inventory']:hasEnoughOfItem('heistdongle3', 1) then
        if exports["isPed"]:isPed("mycash") >= 20000 then
        TriggerEvent('inventory:removeItem', 'heistdongle3', 1)
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['rd-taskbar']:taskBar(5000, 'You got the stuff?')
        if finished == 100 then
            TriggerServerEvent('moneybruh2')
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', "heistlaptop3", 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont got the stuff.', 2)
    end
end
end)

RegisterNetEvent('rd-paletousb')
AddEventHandler('rd-paletousb', function()
    if exports['rd-inventory']:hasEnoughOfItem('heistusb3', 1) then
        if exports["isPed"]:isPed("mycash") >= 25000 then
        TriggerEvent('inventory:removeItem', 'heistusb3', 1)
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['rd-taskbar']:taskBar(5000, 'Progress')
        if finished == 100 then
            TriggerServerEvent('moneybruh')
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', "heistlaptop2", 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont got the stuff.', 2)
    end
end
end)

