RegisterNetEvent("radical_coffee:get:receipt")
AddEventHandler("radical_coffee:get:receipt", function(registerid)
    TriggerServerEvent('radical_coffee:retreive:receipt', registerid)
end)

-- Main Meals / Sides --

-- Coffee Machine

RegisterNetEvent('rd-jobs:make_coffee')
AddEventHandler('rd-jobs:make_coffee', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('coffeebeans', 1) then
            FreezeEntityPosition(GetPlayerPed(-1), true)
            TriggerEvent('animation:PlayAnimation', 'browse')
            local finished = exports['rd-taskbar']:taskBar(5000, 'Making Coffee')
            if finished == 100 then
                if exports['rd-inventory']:hasEnoughOfItem('coffeebeans', 1) then
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                    TriggerEvent('inventory:removeItem', 'coffeebeans', 1)
                    TriggerEvent('player:receiveItem', 'coffee', 1)
                else
                    FreezeEntityPosition(GetPlayerPed(-1), false)
                end
            else
                FreezeEntityPosition(GetPlayerPed(-1), false)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Coffee Beans')
        end
    end
end)

-- Deserts --

RegisterNetEvent('radical-coffee:strawberry:shortcake')
AddEventHandler('radical-coffee:strawberry:shortcake', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('flour', 1) and exports['rd-inventory']:hasEnoughOfItem('sugar', 1) and exports['rd-inventory']:hasEnoughOfItem('butter', 1) and exports['rd-inventory']:hasEnoughOfItem('milk', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 272.1259765625)
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Shortcake')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('inventory:removeItem', 'sugar', 1)
                TriggerEvent('inventory:removeItem', 'butter', 1)
                TriggerEvent('inventory:removeItem', 'milk', 1)
                Citizen.Wait(4000)
                TriggerEvent('player:receiveItem', 'shortcake')
            end
        else
            TriggerEvent('DoLongHudText', 'Aint got the right shit', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'Get a job', 2)
    end
end)

RegisterNetEvent('rd-radical-coffee:chocolate-cake')
AddEventHandler('rd-radical-coffee:chocolate-cake', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('butter', 1) and exports['rd-inventory']:hasEnoughOfItem('flour', 1) and exports['rd-inventory']:hasEnoughOfItem('chocolate_chips', 1) and exports['rd-inventory']:hasEnoughOfItem('milk', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 272.1259765625)
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Cake')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'butter', 1)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                 TriggerEvent('inventory:removeItem', 'milk', 1)
                 TriggerEvent('inventory:removeItem', 'chocolate_chips', 1)
                Citizen.Wait(4000)
                TriggerEvent('player:receiveItem', 'chocolate_cake')
            end
        else
            TriggerEvent('DoLongHudText', 'Aint got the right shit', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'Get a job', 2)
    end
end)

RegisterNetEvent('rd-jobs:prepare_donut_radical_coffee')
AddEventHandler('rd-jobs:prepare_donut_radical_coffee', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('flour', 1) and exports['rd-inventory']:hasEnoughOfItem('milk', 1) and exports['rd-inventory']:hasEnoughOfItem('sugar', 1) then 
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 272.1259765625)
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Donut')
            if (finished == 100) then
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('inventory:removeItem', 'milk', 1)
                TriggerEvent('inventory:removeItem', 'sugar', 1)
                TriggerEvent('player:receiveItem', 'donut', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'Required Ingridients: 1x Flour | 1x Milk | 1x Sugar', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('rd-radical_coffee-make:cola')
AddEventHandler('rd-radical_coffee-make:cola', function()
    if exports['rd-inventory']:hasEnoughOfIteim('empty_cup', 1) and exports['rd-inventory']:hasEnoughOfItem('sugar', 1) and exports['rd-inventory']:hasEnoughOfItem('water') then
        local finished = exports['rd-taskbar']:taskBar(4000, 'Pouring Cola')
        if (finished == 100) then
            TriggerEvent('inventory:removeItem', 'empty_cup', 1)
            TriggerEvent('inventory:removeItem', 'sugar', 1)
            TriggerEvent('inventory:removeItem', 'water', 1)
            TriggerEvent('player:receiveItem', 'cola', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'Required Ingridients: 1x Empty Cup | 1x Sugar | 1x Water', 2)
    end
end)

-- Fridge --

RegisterNetEvent('rd-radical-coffee:fridge')
AddEventHandler('rd-radical-coffee:fridge', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        TriggerEvent("server-inventory-open", "54", "Shop")
    end
end)

-- Context Menus --

RegisterNetEvent('rd-radical-coffee:deserts')
AddEventHandler('rd-radical-coffee:deserts', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        local MakeP = {
            {
                title = "Radical Coffee Deserts",
            },
            {
                title = "Prepare Strawberry Shortcake",
                description = "Required: 1x Flour | 1x Sugar | 1x Butter | 1x Milk",
                key = "SS",
                action = 'rd-jobs:ss',
            },
            {
                title = "Prepare Chocolate Cake",
                description = "Required: 1x Chocolate Chips | 1x Flour | 1x Butter | 1x Milk",
                key = "CC",
                action = 'rd-jobs:cc',
            },
            {
                title = "Prepare Donut",
                description = "Required: 1x Flour | 1x Sugar | 1x Milk",
                key = "PD",
                action = 'rd-jobs:pd',
            },
        }
        exports["rd-ui"]:showContextMenu(MakeP)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-jobs:bb_1', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('player:receiveItem', 'bento_box_1', 1)
end)

RegisterUICallback('rd-jobs:bb_2', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('player:receiveItem', 'bento_box_2', 1)
end)

RegisterUICallback('rd-jobs:bb_3', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('player:receiveItem', 'bento_box_3', 1)
end)

RegisterUICallback('rd-jobs:ss', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('radical-coffee:strawberry:shortcake')
end)

RegisterUICallback('rd-jobs:cc', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-radical-coffee:chocolate-cake')
end)

RegisterUICallback('rd-jobs:pd', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:prepare_donut_radical_coffee')
end)

RegisterNetEvent('rd-jobs:radical_coffee:coffee_machine')
AddEventHandler('rd-jobs:radical_coffee:coffee_machine', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("uwu_cafe")
    if isEmployed then
        local MakeC = {
            {
                title = "Radical Coffee Coffee Machine",
            },
            {
                title = "Make Coffee",
                description = "Required: 1x Coffee Beans",
                key = "SS",
                action = 'rd-jobs:make_cof',
            },
        }
        exports["rd-ui"]:showContextMenu(MakeC)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-jobs:make_cof', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:make_coffee')
end)

-- Radical Coffee Seats | Table On Right

RegisterNetEvent('rd-radical-coffeeSeats_front_1_middle')
AddEventHandler('rd-radical-coffeeSeats_front_1_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.80988769531,-1063.0153808594,21.478393554688)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_back_1_middle')
AddEventHandler('rd-radical-coffeeSeats_back_1_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.05932617188,-1063.0153808594,21.478393554688)
    TriggerEvent('animation:Chair2')
end)


RegisterNetEvent('rd-radical-coffeeSeats_front_2_middle')
AddEventHandler('rd-radical-coffeeSeats_front_2_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.80988769531,-1063.6614990234,21.512084960938)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_back_2_middle')
AddEventHandler('rd-radical-coffeeSeats_back_2_middle', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.00659179688,-1063.6614990234,21.512084960938)
    TriggerEvent('animation:Chair2')
end)

-- Radical Coffee Seats | Table On Left

RegisterNetEvent('rd-radical-coffeeSeats_front_1_left_table')
AddEventHandler('rd-radical-coffeeSeats_front_1_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.87689208984,-1060.0016845703,21.455776367188)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_front_2_left_table')
AddEventHandler('rd-radical-coffeeSeats_front_2_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.89013671875,-1059.3231201172,21.454359179688)
    TriggerEvent('animation:Chair2')
end)


RegisterNetEvent('rd-radical-coffeeSeats_front_3_left_table')
AddEventHandler('rd-radical-coffeeSeats_front_3_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -572.96704101562,-1059.4549560547,21.495239257812)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_back_4_left_table')
AddEventHandler('rd-radical-coffeeSeats_back_4_left_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.05932617188,-1060.0747070312,21.5444776367188)
    TriggerEvent('animation:Chair2')
end)

-- Radical Coffee Seats | Table On right

RegisterNetEvent('rd-radical-coffeeSeats_front_1_right_table') -- Front Right
AddEventHandler('rd-radical-coffeeSeats_front_1_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.85052490234,-1067.4066162109,21.513159179688)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_front_3_right_table') -- Front Left
AddEventHandler('rd-radical-coffeeSeats_front_3_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -573.89013671875,-1066.8395996094,21.525850585938)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_back_2_right_table') -- Back Left
AddEventHandler('rd-radical-coffeeSeats_back_2_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 175.74803161621)
    SetEntityCoords(PlayerPedId(), -572.96704101562,-1066.8395996094,21.504313476562)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('rd-radical-coffeeSeats_back_4_right_table') -- Back Right
AddEventHandler('rd-radical-coffeeSeats_back_4_right_table', function()
    SetEntityHeading(GetPlayerPed(-1), 0.0)
    SetEntityCoords(PlayerPedId(), -573.11206054688,-1067.5120849609,21.452622070312)
    TriggerEvent('animation:Chair2')
end)
  
RegisterNetEvent('rd-jobs:uwu_toys')
AddEventHandler('rd-jobs:uwu_toys', function()
    local uwu_toys = math.random(1, 14)
    if uwu_toys == 1 then
        TriggerEvent('player:receiveItem', 'uwu_toy_biker', 1)
    elseif uwu_toys == 2 then
        TriggerEvent('player:receiveItem', 'uwu_toy_burglar', 1)
    elseif uwu_toys == 3 then
        TriggerEvent('player:receiveItem', 'uwu_toy_bsk', 1)
    elseif uwu_toys == 4 then
        TriggerEvent('player:receiveItem', 'uwu_toy_doctor', 1)
    elseif uwu_toys == 5 then
        TriggerEvent('player:receiveItem', 'uwu_toy_business', 1)
    elseif uwu_toys == 6 then
        TriggerEvent('player:receiveItem', 'uwu_toy_esv', 1)
    elseif uwu_toys == 7 then
        TriggerEvent('player:receiveItem', 'uwu_toy_esb', 1)
    elseif uwu_toys == 8 then
        TriggerEvent('player:receiveItem', 'uwu_toy_maid', 1)
    elseif uwu_toys == 9 then
        TriggerEvent('player:receiveItem', 'uwu_toy_gsf', 1)
    elseif uwu_toys == 10 then
        TriggerEvent('player:receiveItem', 'uwu_toy_fisher', 1)
    elseif uwu_toys == 11 then
        TriggerEvent('player:receiveItem', 'uwu_toy_wizard', 1)
    elseif uwu_toys == 12 then
        TriggerEvent('player:receiveItem', 'uwu_toy_package', 1)
    elseif uwu_toys == 13 then
        TriggerEvent('player:receiveItem', 'uwu_toy_police_officer', 1)
    elseif uwu_toys == 14 then
        TriggerEvent('player:receiveItem', 'uwu_toy_wokrer', 1)
    end
end)