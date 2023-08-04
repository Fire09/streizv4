RegisterNetEvent('rd-jobs:make_pizza_base')
AddEventHandler('rd-jobs:make_pizza_base', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('dough', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 87.765464)
            FreezeEntityPosition(PlayerPedId(), true)
            local RollingDough = exports['rd-taskbar']:taskBar(5000, 'Rolling Dough into Pizza Base')
            if RollingDough == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'dough', 1)
                TriggerEvent('player:receiveItem', 'pizzabase', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work at maldinis.', 2)
    end
end)

RegisterNetEvent('rd-jobs:make_pepperoni')
AddEventHandler('rd-jobs:make_pepperoni', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('pizzabase', 1) and exports['rd-inventory']:hasEnoughOfItem('pizzasauce', 1) and exports['rd-inventory']:hasEnoughOfItem('pepperoni', 10) and exports['rd-inventory']:hasEnoughOfItem('cheese', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 3.2849636)
            FreezeEntityPosition(PlayerPedId(), true)
            local PepperoniPizza1 = exports['rd-taskbar']:taskBar(7500, 'Preparing Pepperoni Pizza.')
            if PepperoniPizza1 == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'pizzabase', 1)
                TriggerEvent('inventory:removeItem', 'pizzasauce', 1)
                TriggerEvent('inventory:removeItem', 'pepperoni', 10)
                TriggerEvent('player:receiveItem', 'pepperonipizza', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You do not have the required ingridients.', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work at Maldinis.', 2)
    end
end)

RegisterNetEvent('rd-jobs:make_plain_pizza')
AddEventHandler('rd-jobs:make_plain_pizza', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('pizzabase', 1) and exports['rd-inventory']:hasEnoughOfItem('pizzasauce', 1) and exports['rd-inventory']:hasEnoughOfItem('cheese', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 3.2849636)
            FreezeEntityPosition(PlayerPedId(), true)
            local PepperoniPizza1 = exports['rd-taskbar']:taskBar(7500, 'Preparing Margherita Pizza.')
            if PepperoniPizza1 == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'pizzabase', 1)
                TriggerEvent('inventory:removeItem', 'pizzasauce', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'margheritapizza', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work at Maldinis.', 2)
    end
end)

RegisterNetEvent('rd-jobs:make_bbq_pizza')
AddEventHandler('rd-jobs:make_bbq_pizza', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('pizzabase', 1) and exports['rd-inventory']:hasEnoughOfItem('bbqsauce', 1) and exports['rd-inventory']:hasEnoughOfItem('cheese', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 3.2849636)
            FreezeEntityPosition(PlayerPedId(), true)
            local PepperoniPizza1 = exports['rd-taskbar']:taskBar(7500, 'Preparing BBQ Pizza.')
            if PepperoniPizza1 == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'pizzabase', 1)
                TriggerEvent('inventory:removeItem', 'bbqsauce', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'bbqpizza', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work at Maldinis.', 2)
    end
end)

RegisterNetEvent('rd-jobs:make_pizzas')
AddEventHandler('rd-jobs:make_pizzas', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        local MakeP = {
            {
                title = "Make Maldini Pizzas",
            },
            {
                title = "Peperoni Pizza",
                description = "Required Ingridients: 10x Pepperonis | 1x Pizza Base | 1x Pizza Sauce | 1x Cheese",
                key = "PP",
                action = 'rd-jobs:make_pp',
            },
            {
                title = "Margherita Pizza",
                description = "Required Ingridients: 1x Pizza Base | 1x Pizza Sauce | 1x Cheese",
                key = "MP",
                action = 'rd-jobs:make_mp',
            },
            {
                title = "BBQ Pizza",
                description = "Required Ingridients: 1x BBQ Sauce | 1x Pizza Base | 1x Cheese",
                key = "BBQ",
                action = 'rd-jobs:make_bbq',
            },
        }
        exports["rd-ui"]:showContextMenu(MakeP)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-jobs:make_pp', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:make_pepperoni')
end)

RegisterUICallback('rd-jobs:make_mp', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:make_plain_pizza')
end)

RegisterUICallback('rd-jobs:make_bbq', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:make_bbq_pizza')
end)
 
-- // Fridge

RegisterNetEvent('rd-jobs:maldinis_fridge')
AddEventHandler('rd-jobs:maldinis_fridge', function()
    local Maldini = exports['rd-business']:IsEmployedAt('maldinis')
    if Maldini then
        TriggerEvent("server-inventory-open", "222", "Shop")
    else
        TriggerEvent('DoLongHudText', 'You do not work here.', 2)
    end
end)



----------------------------------------

RegisterNetEvent('rd-jobs:maldinis-drinks')
AddEventHandler('rd-jobs:maldinis-drinks', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        local BurgershotDrinks = {
            {
                title = 'Maldinis Drinks',
            },
            {
                title = "Pour Cola",
                description = "Pour a nice refreshing Cola",
                key = "Pour.Cola",
                action = 'rd-maldinis:cola',
            },
            {
                title = "Pour Cup Of Water",
                description = "Pour a Cup Of Water",
                key = "Pour.Water",
                action = 'rd-maldinis:water',
            },
        }
        exports["rd-ui"]:showContextMenu(BurgershotDrinks)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)



RegisterNetEvent("rd-maldinis:getcola")
AddEventHandler("rd-maldinis:getcola", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then  
        if exports['rd-inventory']:hasEnoughOfItem('sugarbs', 1) then  
        SetEntityHeading(GetPlayerPed(-1), 249.88976287842)
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['rd-taskbar']:taskBar(10000, 'Pouring Cola')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'cola', 1)
            TriggerEvent('inventory:removeItem', 'sugarbs', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"You need more sugar (Required Amount: x1)",2)
    end
else
    TriggerEvent('DoLongHudText', 'You dont work here', 2)
end
end)

RegisterNetEvent('rd-maldinis:get_water')
AddEventHandler('rd-maldinis:get_water', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        SetEntityHeading(GetPlayerPed(-1), 249.88976287842)
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['rd-taskbar']:taskBar(10000, 'Pouring Water')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'water', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

RegisterUICallback('rd-maldinis:cola', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-maldinis:getcola')
end)

RegisterUICallback('rd-maldinis:water', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-maldinis:get_water')
end)