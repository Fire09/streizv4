

RegisterNetEvent('rd-jobs:red-circle-shop')
AddEventHandler('rd-jobs:red-circle-shop', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        TriggerEvent('server-inventory-open', "50", "Shop")
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)


RegisterNetEvent('rd-jobs:red-circle-fridge')
AddEventHandler('rd-jobs:red-circle-fridge', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        TriggerEvent("server-inventory-open", "1", "redcircle-fridge")
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- Creating drinks

RegisterNetEvent('jobs:redcircle:BrewDrinks')
AddEventHandler('jobs:redcircle:BrewDrinks', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        local RedCircleMakeD = {
            {
                title = "Redcircle Alcohol",
            },
            {
                
                title = "Sex on the beach",
                description = "Required: 1x Vodka | 1x Watermelon | 1x Lime",
                key = "SEX.ON.THE.BEACH",
                action = 'rd-jobs:sob',
            },
            {
                title = "Jägermeister",
                description = "Required: 1x Vodka | 1x Coconut | 1x Cherry",
                key = "Jägermeister",
                action = 'rd-jobs:Jagermeister',
            },
            {
                title = "Becherovka",
                description = "Required: 1x Vodka | 1x Peach | 1x Kiwi",
                key = "Becherovka",
                action = 'rd-jobs:Becherovka',
            },
            {
                title = "Kamikaze",
                description = "Required: 1x Vodka | 1x Apple | 1x Lime",
                key = "Kamikaze",
                action = 'rd-jobs:Kamikaze',
            },
        }
        exports["rd-ui"]:showContextMenu(RedCircleMakeD)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-jobs:sob', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    print('1')
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('lime', 1) and exports['rd-inventory']:hasEnoughOfItem('watermelon', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Sex On The Beach')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'lime', 1)
                TriggerEvent('inventory:removeItem', 'watermelon', 1)
                TriggerEvent('player:receiveItem', 'shot10', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Watermelon | 1x Lime', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterUICallback('rd-jobs:Jagermeister', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('cherry', 1) and exports['rd-inventory']:hasEnoughOfItem('coconut', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Jägermeisterh')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'cherry', 1)
                TriggerEvent('inventory:removeItem', 'coconut', 1)
                TriggerEvent('player:receiveItem', 'shot9', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Coconut | 1x Cherry', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterUICallback('rd-jobs:Becherovka', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('peach', 1) and exports['rd-inventory']:hasEnoughOfItem('kiwi', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Becherovka')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'peach', 1)
                TriggerEvent('inventory:removeItem', 'kiwi', 1)
                TriggerEvent('player:receiveItem', 'shot8', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Peach | 1x Kiwi', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterUICallback('rd-jobs:Kamikaze', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('apple', 1) and exports['rd-inventory']:hasEnoughOfItem('lime', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Kamikaze')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'apple', 1)
                TriggerEvent('inventory:removeItem', 'lime', 1)
                TriggerEvent('player:receiveItem', 'shot7', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Apple | 1x Lime', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- Seats | Sat On Via 3rd Eye

RegisterNetEvent('rd-jobs:red-circle_seat_vip_1')
AddEventHandler('rd-jobs:red-circle_seat_vip_1', function()
    SetEntityHeading(GetPlayerPed(-1), 99.212593078613)
    SetEntityCoords(PlayerPedId(), -309.08572387695,187.10847903809,103.02000065625)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-jobs:red-circle_seat_vip_2')
AddEventHandler('rd-jobs:red-circle_seat_vip_2', function()
    SetEntityHeading(GetPlayerPed(-1), 289.13385009766)
    SetEntityCoords(PlayerPedId(), -310.9186706543,186.777777,103.02000065625)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-jobs:red-circle_seat_vip_3')
AddEventHandler('rd-jobs:red-circle_seat_vip_3', function()
    SetEntityHeading(GetPlayerPed(-1), 201.25984191895)
    SetEntityCoords(PlayerPedId(), -302.04076171875,186.70439758301,102.00366210938)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-jobs:red-circle_seat_vip_4')
AddEventHandler('rd-jobs:red-circle_seat_vip_4', function()
    SetEntityHeading(GetPlayerPed(-1), 297.63778686523)
    SetEntityCoords(PlayerPedId(), -302.80877685547,185.32746887207,101.88888888888)
    TriggerEvent('animation:Chair2')
end)

-- Tables | Open'd VIA 3rd Eye

-- VIP

RegisterNetEvent("rd-jobs:red_circle-table-1")
AddEventHandler("rd-jobs:red_circle-table-1", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_1_vip");
end)

RegisterNetEvent("rd-jobs:red_circle-table-2")
AddEventHandler("rd-jobs:red_circle-table-2", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_1_vip");
end)

-- Regular

RegisterNetEvent("rd-jobs:red_circle-table-3")
AddEventHandler("rd-jobs:red_circle-table-3", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_3");
end)

RegisterNetEvent("rd-jobs:red_circle-table-4")
AddEventHandler("rd-jobs:red_circle-table-4", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_4");
end)

RegisterNetEvent("rd-jobs:red_circle-table-5")
AddEventHandler("rd-jobs:red_circle-table-5", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_5");
end)

RegisterNetEvent("rd-jobs:red_circle-table-6")
AddEventHandler("rd-jobs:red_circle-table-6", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_6");
end)

RegisterNetEvent("rd-jobs:red_circle-table-7")
AddEventHandler("rd-jobs:red_circle-table-7", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_7");
end)

RegisterNetEvent("rd-jobs:red_circle-table-8")
AddEventHandler("rd-jobs:red_circle-table-8", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_table_8");
end)

-- Booths

-- Booth 1 Start
RegisterNetEvent("rd-jobs:red_circle-booth-1-table-1")
AddEventHandler("rd-jobs:red_circle-booth-1-table-1", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_1_table_1");
end)

RegisterNetEvent("rd-jobs:red_circle-booth-1-table-2")
AddEventHandler("rd-jobs:red_circle-booth-1-table-2", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_1_table_2");
end)
-- Booth 1 End

-- Booth 2 Start
RegisterNetEvent("rd-jobs:red_circle-booth-2-table-1")
AddEventHandler("rd-jobs:red_circle-booth-2-table-1", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_2_table_1");
end)

RegisterNetEvent("rd-jobs:red_circle-booth-2-table-2")
AddEventHandler("rd-jobs:red_circle-booth-2-table-2", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_2_table_2");
end)
-- Booth 2 End

-- Booth 3 Start
RegisterNetEvent("rd-jobs:red_circle-booth-3-table-1")
AddEventHandler("rd-jobs:red_circle-booth-3-table-1", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_3_table_1");
end)

RegisterNetEvent("rd-jobs:red_circle-booth-3-table-2")
AddEventHandler("rd-jobs:red_circle-booth-3-table-2", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_3_table_2");
end)
-- Booth 3 End

-- Booth 4 Start
RegisterNetEvent("rd-jobs:red_circle-booth-4-table-1")
AddEventHandler("rd-jobs:red_circle-booth-4-table-1", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_4_table_1");
end)

RegisterNetEvent("rd-jobs:red_circle-booth-4-table-2")
AddEventHandler("rd-jobs:red_circle-booth-4-table-2", function()
    TriggerEvent("server-inventory-open", "1", "redcircle_booth_4_table_2");
end)
-- Booth 4 End

-- Elevator

RegisterNetEvent('rd-jobs:red-circle:main-floor:elevator_go_up')
AddEventHandler('rd-jobs:red-circle:main-floor:elevator_go_up', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        local finished = exports['rd-taskbar']:taskBar(5000, 'Calling Elevator')
        if (finished == 100) then
            SetEntityHeading(GetPlayerPed(-1), 286.29919433594)
            SetEntityCoords(PlayerPedId(), -316.8923034668,217.89889526367,99.86376953125)
        end
    end
end)

RegisterUICallback("rd-elavator", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    TriggerEvent('rd-jobs:red-circle:main-floor:elevator_go_up')
    exports["rd-ui"]:hideContextMenu()
end)

RegisterNetEvent('redcircleelavatorup')
AddEventHandler('redcircleelavatorup', function()
	local menuData = {
		{
            title = "Elevator",
            description = "Red Circle",
            key = true,
			children = {
				{ title = "Main Floor", action = "rd-elavator", key = true},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)

RegisterNetEvent('rd-jobs:red-circle:main-floor:elevator_go_down')
AddEventHandler('rd-jobs:red-circle:main-floor:elevator_go_down', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("red_circle")
    if isEmployed then
        local finished = exports['rd-taskbar']:taskBar(5000, 'Calling Elevator')
        if (finished == 100) then
            SetEntityHeading(GetPlayerPed(-1), 283.4645690918)
            SetEntityCoords(PlayerPedId(), -318.35604858398,217.02856445312,87.86669921875)
        end
    end
end)

RegisterUICallback("rd-elavator2", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    TriggerEvent('rd-jobs:red-circle:main-floor:elevator_go_down')
    exports["rd-ui"]:hideContextMenu()
end)

RegisterNetEvent('redcircleelavatordown')
AddEventHandler('redcircleelavatordown', function()
	local menuData = {
		{
            title = "Elevator",
            description = "Red Circle",
            key = true,
			children = {
				{ title = "First Floor", action = "rd-elavator2", key = true},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)

-- Cash Registers

RegisterNetEvent("red_circle:get:receipt")
AddEventHandler("red_circle:get:receipt", function(registerid)
    TriggerServerEvent('red_circle:retreive:receipt', registerid)
end)

RegisterNetEvent('red_circle:cash:in')
AddEventHandler('red_circle:cash:in', function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("red_circle:update:pay", cid)
end)