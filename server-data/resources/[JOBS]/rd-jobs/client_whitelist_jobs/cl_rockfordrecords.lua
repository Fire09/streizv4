function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent("rd-music:addBill")
AddEventHandler("rd-music:addBill", function(amount)
    TriggerServerEvent("server:GroupPayment","rockford_records", amount)
end)

RegisterNetEvent("rd-musicrecord:openFridge")
AddEventHandler("rd-musicrecord:openFridge", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("rockford_records")
    if isEmployed then
        TriggerEvent("server-inventory-open", "1", "rockford-fridge")
        Wait(100)
    else
        TriggerEvent('DoLongHudText', 'You are not a rockford records employee!', 2)
    end
end)

RegisterNetEvent('rd-music:tray1')
AddEventHandler('rd-music:tray1', function()   
	TriggerEvent("server-inventory-open", "1", "Pickup Tray 1")
end)

RegisterNetEvent('rd-music:tray2')
AddEventHandler('rd-music:tray2', function()   
	TriggerEvent("server-inventory-open", "1", "Pickup Tray 2")
end)

RegisterNetEvent('OpenSnack:StoreRockford')
AddEventHandler('OpenSnack:StoreRockford', function()
    TriggerEvent("server-inventory-open", "69421", "Shop")
end)

-- // Snack Shit Start // --

RegisterNetEvent('rd-musicrecord:snackmenu')
AddEventHandler('jobs:redcircle:snackmenu', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("rockford_records")
    if isEmployed then
        local RedCircleMakeD = {
            {
                
                title = "Open Refrigerator",
                description = "Refrigerator",
                key = "Refrigerator",
                action = 'rockford:fridge',
            },
            {
                title = "Open Snack Shop",
                description = "Get some snacks",
                key = "Snack",
                action = 'rockford:snack',
            },
        }
        exports["rd-ui"]:showContextMenu(RedCircleMakeD)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rockford:fridge', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-musicrecord:openFridge')
end)

RegisterUICallback('rockford:snack', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('OpenSnack:StoreRockford')
end)

-- // Snack Shit End // --

RegisterUICallback('rd-jobs:rock_make_whiskey', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
    LoadDict(dict)
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
    local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Cold Whiskey')
    if (finished == 100) then
        TriggerEvent("player:receiveItem",'whiskey', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
        DeleteEntity(prop)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(1000)
    end
end)

RegisterUICallback('rd-jobs:rock_make_vodka', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
    LoadDict(dict)
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
    local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Cold Vodka')
    if (finished == 100) then
        TriggerEvent("player:receiveItem",'vodka', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
        DeleteEntity(prop)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(1000)

    end
end)

RegisterUICallback('rd-jobs:rock_make_beer', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
    LoadDict(dict)
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
    local finished = exports['rd-taskbar']:taskBar(10000, 'Pouring a cold one for the boys..')
    if (finished == 100) then
        TriggerEvent("player:receiveItem",'beer', 1)
        FreezeEntityPosition(GetPlayerPed(-1),false)
        DeleteEntity(prop)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('rd-musicrecord:snackmenu')
AddEventHandler('jobs:redcircle:snackmenu', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("rockford_records")
    if isEmployed then
        local Shibiz = {
            {
                
                title = "Brew Whiskey",
                description = "Pour glass of whiskey",
                key = "Pour glass of whiskey",
                action = 'rd-jobs:rock_make_whiskey',
            },
            {
                title = "Brew Vodka",
                description = "Pour glass of vodka",
                key = "Vodka",
                action = 'rd-jobs:rock_make_vodka',
            },
            {
                title = "Brew Beer",
                description = "Pour glass of beer",
                key = "Beer",
                action = 'rd-jobs:rock_make_beer',
            },
        }
        exports["rd-ui"]:showContextMenu(Shibiz)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

local nearBar = false

Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("fridge_rockford", vector3(-993.68, -257.52, 39.04), 2.0, 1.0, {
        name="fridge_rockford",
        heading=145,
    })
end)


RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "fridge_rockford" then
            nearBar = true
            OpenDMenu()
			exports['rd-ui']:showInteraction(("[E] %s"):format("Refrigerator/Snacks"))
        end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "fridge_rockford" then
        nearBar = false
    end
    exports['rd-ui']:hideInteraction()
end)

function OpenDMenu()
	Citizen.CreateThread(function()
        while nearBar do
            Citizen.Wait(5)
            local isEmployed = exports["rd-business"]:IsEmployedAt("rockford_records")
            if isEmployed then
                    if IsControlJustReleased(0, 38) then
                    TriggerEvent('rd-musicrecord:snackmenu')
                    end
                end
            end
    end)
end
