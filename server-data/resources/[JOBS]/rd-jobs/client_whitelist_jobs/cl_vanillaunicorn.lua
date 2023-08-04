

RegisterNetEvent('rd-jobs:VanillaUnicorn:Shop')
AddEventHandler('rd-jobs:VanillaUnicorn:Shop', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
        TriggerEvent('server-inventory-open', "50", "Shop")
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)


RegisterNetEvent('rd-jobs:VanillaUnicorn:Fridge')
AddEventHandler('rd-jobs:VanillaUnicorn:Fridge', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
            TriggerEvent("server-inventory-open", "1", "vanilla-fridge")
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

-- Creating drinks

RegisterNetEvent('jobs:vanilla:BrewDrinks')
AddEventHandler('jobs:vanilla:BrewDrinks', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
        local VUShibiz = {
            {
                title = "VU Bar",
            },
            {
                title = "Martini",
                description = "Required: 1x Vodka | 1x Watermelon | 1x Lime",
                key = "MARTINI",
                action = 'rd-jobs:make_martini',
            },
            {
                title = "Glass Of Whiskey",
                description = "Required: 1x Vodka | 1x Coconut | 1x Cherry",
                key = "WHISKEY",
                action = 'rd-jobs:make_whiskey',
            },
            {
                title = "Margarita",
                description = "Required: 1x Vodka | 1x Peach | 1x Kiwi",
                key = "Margarita",
                action = 'rd-jobs:make_margarita',
            },
            {
                title = "Kamikaze",
                description = "Required: 1x Vodka | 1x Apple | 1x Lime",
                key = "Kamikaze",
                action = 'rd-jobs:make_kamikaze',
            },
        }
        exports["rd-ui"]:showContextMenu(VUShibiz)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('rd-jobs:make_martini', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('lime', 1) and exports['rd-inventory']:hasEnoughOfItem('watermelon', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Martini')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'lime', 1)
                TriggerEvent('inventory:removeItem', 'watermelon', 1)
                TriggerEvent('player:receiveItem', 'martini', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Watermelon | 1x Lime', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

RegisterUICallback('rd-jobs:make_whiskey', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('cherry', 1) and exports['rd-inventory']:hasEnoughOfItem('coconut', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Glass Of Whiskey')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'cherry', 1)
                TriggerEvent('inventory:removeItem', 'coconut', 1)
                TriggerEvent('player:receiveItem', 'GlassOfWhiskey', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Coconut | 1x Cherry', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

RegisterUICallback('rd-jobs:make_margarita', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('vodka', 1) and exports['rd-inventory']:hasEnoughOfItem('peach', 1) and exports['rd-inventory']:hasEnoughOfItem('kiwi', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Margarita')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('inventory:removeItem', 'vodka', 1)
                TriggerEvent('inventory:removeItem', 'peach', 1)
                TriggerEvent('inventory:removeItem', 'kiwi', 1)
                TriggerEvent('player:receiveItem', 'margarita', 1)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Vodka | 1x Peach | 1x Kiwi', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

RegisterUICallback('rd-jobs:make_kamikaze', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
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
        TriggerEvent('DoLongHudText', 'They Do Not Recognise You', 2)
    end
end)

NearStash = false

Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("stash_vanilla", vector3(93.7, -1290.55, 29.26), 1.2, 1.6, {
        name="stash_vanilla",
        heading=296,
    })
    
end)

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "stash_vanilla" then
        local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
        local hasPerm = exports["rd-business"]:HasPermission("vanilla_unicorn", "stash_access")
        if isEmployed and hasPerm then
            NearStash = true
            StashSpot()
			exports['rd-ui']:showInteraction(("[E] %s"):format("Open Stash"))
        end
        
    end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "stash_vanilla" then
        NearStash = false
    end
    exports['rd-ui']:hideInteraction()
end)

function StashSpot()
	Citizen.CreateThread(function()
        while NearStash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
                local hasPerm = exports["rd-business"]:HasPermission("vanilla_unicorn", "stash_access")
                if isEmployed and hasPerm then
                    TriggerEvent("server-inventory-open", "1", "vanilla-unicorn-stash")
                end
			end
		end
	end)
end




RegisterNetEvent("vanillUnicorn-table-1")
AddEventHandler("vanillUnicorn-table-1", function()
    TriggerEvent("server-inventory-open", "1", "Vanilla-Bar-Table");
end)

RegisterNetEvent("vanillUnicorn-table-2")
AddEventHandler("vanillUnicorn-table-2", function()
    TriggerEvent("server-inventory-open", "1", "Vanilla-Bar-Table");
end)

RegisterNetEvent("vanilla:get:receipt")
AddEventHandler("vanilla:get:receipt", function(registerid)
    TriggerServerEvent('vanilla:retreive:receipt', registerid)
end)

RegisterNetEvent('vanilla:cash:in')
AddEventHandler('vanilla:cash:in', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("vanilla_unicorn")
    if isEmployed then
        local cid = exports["isPed"]:isPed("cid")
        TriggerServerEvent("vanilla:update:pay", cid)
    else
        print('not employed here')
    end
end)


RegisterNetEvent('vanilla-sitchair:1')
AddEventHandler('vanilla-sitchair:1', function()
    SetEntityHeading(GetPlayerPed(-1), 99.991180)
    SetEntityCoords(PlayerPedId(), 111.3251, -1288.633, 27.21908)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('vanilla-sitchair:2')
AddEventHandler('vanilla-sitchair:2', function()
    SetEntityHeading(GetPlayerPed(-1), 142.6449)
    SetEntityCoords(PlayerPedId(), 110.2726, -1287.19, 27.21908)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('vanilla-sitchair:3')
AddEventHandler('vanilla-sitchair:3', function()
    SetEntityHeading(GetPlayerPed(-1), 183.13546)
    SetEntityCoords(PlayerPedId(), 108.4513, -1286.742, 27.21908)
    TriggerEvent('animation:Chair2')
end)

RegisterNetEvent('vanilla-sitchair:4')
AddEventHandler('vanilla-sitchair:4', function()
    SetEntityHeading(GetPlayerPed(-1), 67.85624)
    SetEntityCoords(PlayerPedId(), 111.0651, -1290.64, 27.21908)
    TriggerEvent('animation:Chair2')
end)



-- Chairs below cuz too messy 

Citizen.CreateThread(function()

    exports["rd-polytarget"]:AddCircleZone("vanillaCHAIR1",  vector3(111.72, -1288.52, 28.26), 0.6, {
        useZ = true
    })

    exports["rd-polytarget"]:AddCircleZone("vanillaCHAIR2",  vector3(110.56, -1286.96, 28.26), 0.58, {
        useZ = true
    })

    exports["rd-polytarget"]:AddCircleZone("vanillaCHAIR3",  vector3(108.48, -1286.37, 28.26), 0.56, {
        useZ = true
    })

    exports["rd-polytarget"]:AddCircleZone("vanillaCHAIR4",  vector3(111.45, -1290.75, 28.26), 0.55, {
        useZ = true
    })

end)


Citizen.CreateThread(function()
exports["rd-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR1", {{
    event = "vanilla-sitchair:1",
    id = "sitchair_vanilla1",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.1 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR2", {{
    event = "vanilla-sitchair:2",
    id = "vanillaNOCHAIR2",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR3", {{
    event = "vanilla-sitchair:3",
    id = "vanillaNOCHAIR3",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("vanillaCHAIR4", {{
    event = "vanilla-sitchair:4",
    id = "vanillaNOCHAIR4",
    icon = "chair",
    label = "Sit down",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});
end)