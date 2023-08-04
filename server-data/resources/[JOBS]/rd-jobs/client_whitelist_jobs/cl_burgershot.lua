RegisterNetEvent("rd-burgershot:pay")
AddEventHandler("rd-burgershot:pay", function(amount)
    TriggerServerEvent("server:GroupPayment","burger_shot", amount)
end)

RegisterNetEvent('rd-jobs:burgershot-warmer')
AddEventHandler('rd-jobs:burgershot-warmer', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        TriggerEvent("server-inventory-open", "1", "storage-burger_warmer")
        Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
    end
end)

RegisterNetEvent("rd-burgershot:startjob")
AddEventHandler("rd-burgershot:startjob", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    local vehicle = GetHashKey('panto')
    if isEmployed then     
        RequestModel(vehicle)
    
        while not HasModelLoaded(vehicle) do
            Wait(1)
        end
    
        local plate = "BURGER" .. math.random(1, 100)
        local spawned_car = CreateVehicle(vehicle, -1168.9582519531, -895.20001220703, 13.9296875, 34.015747070312, true, false)
        SetVehicleEngineTorqueMultiplier(spawned_car, 0.2)
        SetVehicleOnGroundProperly(spawned_car)
        SetVehicleNumberPlateText(spawned_car, plate)
        SetPedIntoVehicle(GetPlayerPed(-1), spawned_car, - 1)
        SetModelAsNoLongerNeeded(vehicle)
        TriggerEvent("vehicle:keys:addNew",spawned_car)
        Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

--- Burger >> Beef

RegisterNetEvent("rd-burgershot:startprocess")
AddEventHandler("rd-burgershot:startprocess", function()
    local finished = exports['rd-taskbar']:taskBar(5000, 'Grabbing Cow')
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then     
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'cow', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
            Citizen.Wait(1000)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)


RegisterNetEvent("rd-burgershot:startprocess2")
AddEventHandler("rd-burgershot:startprocess2", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports["rd-inventory"]:hasEnoughOfItem("cow", 1) then 
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 82.204727172852)
            local finished = exports['rd-taskbar']:taskBar(5000, 'Cutting Up Cow')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "cow", 1)
                TriggerEvent('player:receiveItem', 'beef', math.random(10, 20))
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation","layspike")
            end
        else
            TriggerEvent('DoLongHudText', 'You need more cow to process! (Required Amount: 1)', 2)
        end
    else
            TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("rd-burgershot:startprocess3")
AddEventHandler("rd-burgershot:startprocess3", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports["rd-inventory"]:hasEnoughOfItem("beef", 5) then 
            local finished = exports['rd-taskbar']:taskBar(5000, 'Processing Beef')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "beef", 5)
                TriggerEvent('player:receiveItem', 'groundbeef', math.random(3, 4))
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation","layspike")
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more beef to process! (Required Amount: 5)', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("rd-burgershot:startfryer")
AddEventHandler("rd-burgershot:startfryer", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('potato', 1) then
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['rd-taskbar']:taskBar(10000, 'Dropping Fries')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'fries', 1)
                TriggerEvent('inventory:removeItem', 'potato', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', "You need more patato's (Required Amount: x1)", 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("rd-burgershot:makeshake")
AddEventHandler("rd-burgershot:makeshake", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('milk', 1) then
        SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['rd-taskbar']:taskBar(10000, 'Making Shake')
        if (finished == 100) then
            TriggerEvent('inventory:removeItem', 'milk', 1)
            TriggerEvent('player:receiveItem', 'mshake', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"You need milk (Required Amount: x1)",2)
    end
else
    TriggerEvent('DoLongHudText', 'You dont work here', 2)
end
end)


RegisterNetEvent("rd-burgershot:soft-drink")
AddEventHandler("rd-burgershot:soft-drink", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then   
        if exports['rd-inventory']:hasEnoughOfItem('burgershot_cup', 1) then
        SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['rd-taskbar']:taskBar(10000, 'Making Soft Drink')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'softdrink', 1)
            TriggerEvent('inventory:removeItem', 'burgershot_cup', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"Required Ingridients: 1x Sugar | 1x Empty Burgershot Cup",2)
    end
else
    TriggerEvent('DoLongHudText', 'You dont work here', 2)
end
end)

RegisterNetEvent("rd-burgershot:getcola")
AddEventHandler("rd-burgershot:getcola", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then  
        if exports['rd-inventory']:hasEnoughOfItem('sugarbs', 1) then  
        SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
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

RegisterNetEvent('rd-burgershot:get_water')
AddEventHandler('rd-burgershot:get_water', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        SetEntityHeading(GetPlayerPed(-1), 121.88976287842)
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

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

--// Counter

RegisterNetEvent('rd-burgershot:counter')
AddEventHandler('rd-burgershot:counter', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
		TriggerEvent("server-inventory-open", "1", "counter-burger_shot")
		Wait(1000)
else
    TriggerEvent('DoLongHudText', 'You do not work here !',2)
    end
end)

--// Store

RegisterNetEvent('rd-burgershot:store')
AddEventHandler('rd-burgershot:store', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        TriggerEvent("server-inventory-open", "45", "Shop")
		Wait(1000)
    else
        TriggerEvent('DoLongHudText', 'You do not work here !',2)
        end
    end)

--// Make Burgers

RegisterNetEvent('rd-civjobs:burgershot-heartstopper')
AddEventHandler('rd-civjobs:burgershot-heartstopper', function()
    local ped = PlayerPedId()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('burgershotpatty', 2) and exports['rd-inventory']:hasEnoughOfItem('lettuce', 1) and exports['rd-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and exports['rd-inventory']:hasEnoughOfItem('tomato', 1) and exports['rd-inventory']:hasEnoughOfItem('cheese', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local heartstopper = exports['rd-taskbar']:taskBar(5000, 'Cooking Heartstopper')
            if (heartstopper == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1) 
                TriggerEvent('inventory:removeItem', 'burgershotpatty', 2) 
                TriggerEvent('inventory:removeItem', 'lettuce', 1) 
                TriggerEvent('inventory:removeItem', 'tomato', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'heartstopper', 1)
                TriggerEvent('DoLongHudText', 'Cooked Heartstopper', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'Requires: 1x Burger Buns | 2x Cooked Burger Pattys | 1x Lettuce | 1x Tomato | 1x Cheese', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('rd-civjobs:burgershot-moneyshot')
AddEventHandler('rd-civjobs:burgershot-moneyshot', function()
    local ped = PlayerPedId()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and exports['rd-inventory']:hasEnoughOfItem('burgershotpatty', 1) and exports['rd-inventory']:hasEnoughOfItem('lettuce', 1) and exports['rd-inventory']:hasEnoughOfItem('tomato', 1) and exports['rd-inventory']:hasEnoughOfItem('cheese', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local moneyshot = exports['rd-taskbar']:taskBar(5000, 'Cooking Moneyshot')
            if (moneyshot == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('inventory:removeItem', 'burgershotpatty', 1)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'tomato', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'moneyshot', 1)
                TriggerEvent('DoLongHudText', 'Cooked Moneyshot', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'Requires: 1x Burger Buns | 1x Cooked Burger Patty | 1x Cheese | 1x Lettuce | 1x Tomato', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('rd-civjobs:burgershot-meatfree')
AddEventHandler('rd-civjobs:burgershot-meatfree', function()
    local ped = PlayerPedId()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('burgershotpatty2', 1) and exports['rd-inventory']:hasEnoughOfItem('lettuce', 1) and exports['rd-inventory']:hasEnoughOfItem('hamburgerbuns', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local meatfree = exports['rd-taskbar']:taskBar(5000, 'Cooking Meat Free')
            if (meatfree == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('inventory:removeItem', 'burgershotpatty2', 1)
                TriggerEvent('player:receiveItem', 'meatfree', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'Requires: 1x Burger Buns | 1x Lettuce | 1x Cooked Meat Free Patty', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)  

RegisterNetEvent('rd-civjobs:burgershot-bleeder')
AddEventHandler('rd-civjobs:burgershot-bleeder', function()
    local ped = PlayerPedId()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('hamburgerbuns', 1) and exports['rd-inventory']:hasEnoughOfItem('lettuce', 1) and exports['rd-inventory']:hasEnoughOfItem('burgershotpatty', 1) and exports['rd-inventory']:hasEnoughOfItem('cheese', 1) and exports['rd-inventory']:hasEnoughOfItem('tomato', 1) then
            FreezeEntityPosition(ped, true)
            ExecuteCommand('e cokecut')
            local meatfree = exports['rd-taskbar']:taskBar(5000, 'Cooking Bleeder Burger')
            if (meatfree == 100) then
                FreezeEntityPosition(ped, false)
                TriggerEvent('inventory:removeItem', 'lettuce', 1)
                TriggerEvent('inventory:removeItem', 'hamburgerbuns', 1)
                TriggerEvent('inventory:removeItem', 'burgershotpatty', 1)
                TriggerEvent('inventory:removeItem', 'tomato', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'bleederburger', 1)
            else
                FreezeEntityPosition(ped, false)
            end
        else
            TriggerEvent('DoLongHudText', 'Requires: 1x Lettuce | 1x Patty | 1x Burger Buns', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)  

-- // Drink Machine Start // --

RegisterNetEvent('rd-jobs:burgershot-drinks')
AddEventHandler('rd-jobs:burgershot-drinks', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        local BurgershotDrinks = {
            {
                title = 'Burger Shot Drinks',
                icon = "glass-whiskey"
            },
            {
                title = "Pour Cola",
                description = "Pour a nice refreshing Cola",
                icon = "beer",
                action = 'rd-burgershot:cola',
            },
            {
                title = "Pour Milkshake",
                description = "Pour a Ice Cold Milkshake",
                icon = "beer",
                action = 'rd-burgershot:shake',
            },
            {
                title = "Pour Soft Drink",
                description = "Pour a monsterous sweet Soft Drink",
                icon = "beer",
                action = 'rd-burgershot:drink',
            },
            {
                title = "Pour Cup Of Water",
                description = "Pour a Cup Of Water",
                icon = "beer",
                action = 'rd-burgershot:water',
            },
        }
        exports["rd-ui"]:showContextMenu(BurgershotDrinks)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-burgershot:cola', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-burgershot:getcola')
end)

RegisterUICallback('rd-burgershot:shake', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-burgershot:makeshake')
end)

RegisterUICallback('rd-burgershot:drink', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-burgershot:soft-drink')
end)

RegisterUICallback('rd-burgershot:water', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-burgershot:get_water')
end)

-- // Drink Machine End // --

-- // Start Of Burgers // --

RegisterNetEvent('rd-civjobs:burgershot-make-burgers')
AddEventHandler('rd-civjobs:burgershot-make-burgers', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        local BurgershotBurgers = {
            {
                title = 'Burger Shot Burgers',
                icon = "utensils"
            },
            {
                title = "Assemble Heartstopper",
                icon = "hamburger", 
                action = 'rd-burgershot:hs',
            },
            {
                title = "Assemble Moneyshot",
                icon = "hamburger", 
                action = 'rd-burgershot:ms',
            },
            {
                title = "Assemble Meat Free Burger",
                icon = "hamburger", 
                action = 'rd-burgershot:mf',
            },
            {
                title = "Assemble Bleeder Burger",
                icon = "hamburger", 
                action = 'rd-burgershot:bb',
            },
        }
        exports["rd-ui"]:showContextMenu(BurgershotBurgers)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-burgershot:hs', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-civjobs:burgershot-heartstopper')
end)

RegisterUICallback('rd-burgershot:ms', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-civjobs:burgershot-moneyshot')
end)

RegisterUICallback('rd-burgershot:mf', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-civjobs:burgershot-meatfree')
end)

RegisterUICallback('rd-burgershot:bb', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-civjobs:burgershot-bleeder')
end)

--// Meat No Meat?

RegisterNetEvent('rd-civjobs:burgershot-make-pattys')
AddEventHandler('rd-civjobs:burgershot-make-pattys', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        local BurgershotPattys = {
            {
                title = 'Burger Shot Pattys',
            },
            {
                title = "Cook Patty (Contains Meat)",
                description = "Requires: 1x Raw Patty (Contains Meat)",
                key = "CP.M",
                action = 'rd-burgershot:cm',
            },
            {
                title = "Cook Patty (Doesnt Contain Meat)",
                description = "Requires: 1x Raw Patty (Doesnt Contain Meat)",
                key = "CP.NM",
                action = 'rd-burgershot:dcm',
            },
        }
        exports["rd-ui"]:showContextMenu(BurgershotPattys)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-burgershot:cm', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-burgershot:contains-meat')
end)

RegisterUICallback('rd-burgershot:dcm', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-burgershot:doesnt-contains-meat')
end)

RegisterNetEvent("rd-burgershot:contains-meat")
AddEventHandler("rd-burgershot:contains-meat", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports["rd-inventory"]:hasEnoughOfItem("rawpatty", 1) then 
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['rd-taskbar']:taskBar(7500, 'Cooking Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "rawpatty", 1)
                TriggerEvent('player:receiveItem', 'burgershotpatty', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more Raw Pattys to cook! (Required Amount: 1)', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent("rd-burgershot:doesnt-contains-meat")
AddEventHandler("rd-burgershot:doesnt-contains-meat", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then   
        if exports["rd-inventory"]:hasEnoughOfItem("rawpatty2", 1) then 
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['rd-taskbar']:taskBar(7500, 'Cooking Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "rawpatty2", 1)
                TriggerEvent('player:receiveItem', 'burgershotpatty2', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more Raw Pattys to cook! (Required Amount: 1)', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

--// Registers

RegisterNetEvent("burgershot:get:receipt")
AddEventHandler("burgershot:get:receipt", function(registerid)
    TriggerServerEvent('burgershot:retreive:receipt', registerid)
end)

RegisterNetEvent('burgershot:cash:in')
AddEventHandler('burgershot:cash:in', function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("burgershot:update:pay", cid)
end)

RegisterNetEvent('nicx-burgershot:gettoy')
AddEventHandler('nicx-burgershot:gettoy', function()
    local BurgershotToy = math.random(10)
    if BurgershotToy == 1 then
        TriggerEvent('player:receiveItem', 'larrybirdtoy', 1)
    elseif BurgershotToy == 2 then
        TriggerEvent('player:receiveItem', 'tatumtoy', 1)
    elseif BurgershotToy == 3 then
        TriggerEvent('player:receiveItem', 'klaytoy', 1)
    elseif BurgershotToy == 4 then
        TriggerEvent('player:receiveItem', 'currytoy', 1)
    elseif BurgershotToy == 5 then
        TriggerEvent('player:receiveItem', 'strangetoy', 1)
    elseif BurgershotToy == 6 then
        TriggerEvent('player:receiveItem', 'woodytoy', 1)
    elseif BurgershotToy == 7 then
        TriggerEvent('player:receiveItem', 'joinwicktoy', 1)
    elseif BurgershotToy == 8 then
        TriggerEvent('player:receiveItem', 'eletoy', 1)
    elseif BurgershotToy == 9 then
        TriggerEvent('player:receiveItem', 'captoy', 1)
    elseif BurgershotToy == 10 then
        TriggerEvent('player:receiveItem', 'supermantoy', 1)
    end
end)

RegisterNetEvent("nicx-icecream")
AddEventHandler("nicx-icecream", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("burger_shot")
    if isEmployed then
        if exports["rd-inventory"]:hasEnoughOfItem("icecreamcone", 1) then 
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 302.72439575195)
            local finished = exports['rd-taskbar']:taskBar(7500, 'Scooping')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "icecreamcone", 1)
                TriggerEvent('player:receiveItem', 'vanillaicecream', 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            end
        else
            TriggerEvent('DoLongHudText', 'You need more Ice Cream Cone!', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work here', 2)
    end
end)

RegisterNetEvent('grabtoybs')
AddEventHandler('grabtoybs', function()
    TriggerEvent('player:receiveItem', 'bstoy', 1)
end)
    