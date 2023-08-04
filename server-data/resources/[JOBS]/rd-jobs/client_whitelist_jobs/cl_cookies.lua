--- harversting start

local nearPicking = false

Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("cookies_picking", vector3(-918.12, -1190.75, -0.88), 5, 5, {
		name="cookies_picking",
        heading=305,
        minZ=-1.88,
        maxZ=2.12
    }) 
end)

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "cookies_picking" then
        local isEmployed = exports["rd-business"]:IsEmployedAt("cookies")
        local HasPermission = exports["rd-business"]:HasPermission('cookies',"craft_access")
        if isEmployed and HasPermission then
            nearPicking = true
            StartHarvistingcookies()
			exports['rd-ui']:showInteraction(("[E] %s"):format("Start Harvisting"))
        end
    end
end)


RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "cookies_picking" then
        nearPicking = false
    end
    exports['rd-ui']:hideInteraction()
end)

function StartHarvistingcookies()
	Citizen.CreateThread(function()
        while nearPicking do
            Citizen.Wait(5)
            local isEmployed = exports["rd-business"]:IsEmployedAt("cookies")
            local HasPermission = exports["rd-business"]:HasPermission('cookies',"craft_access")
            if isEmployed and HasPermission then
                if IsControlJustReleased(0, 38) then
                    local lPed = PlayerPedId()
                    LoadAnim('amb@world_human_gardener_plant@male@base')
                    FreezeEntityPosition(lPed,true)
                    Citizen.Wait(500)
                    ClearPedTasksImmediately(lPed)
                    TaskPlayAnim(lPed, "amb@world_human_gardener_plant@male@base", "base", 8.0, -8, -1, 49, 0, 0, 0, 0)
                    local finished = exports['rd-taskbar']:taskBar(math.random(45000, 60000), 'Picking Weed')
                    if (finished == 100) then
                        local pWeed = math.random(5, 10)
                        TriggerEvent('player:receiveItem', 'weedq', pWeed)
                        FreezeEntityPosition(lPed,false)
                    else
                        FreezeEntityPosition(GetPlayerPed(-1),false)
                    end
                end
            end
        end
    end)
end


function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

--- harversting done

-- joints

RegisterNetEvent('rd-jobs:CraftJointsMenu')
AddEventHandler('rd-jobs:CraftJointsMenu', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("cookies")
    local HasPermission = exports["rd-business"]:HasPermission('cookies',"craft_access")
    if isEmployed and HasPermission then
        local CCJoint = {
            {
                title = "Blue Moon Cookie Joint",
                description = "Roll 2g Blue Moon Cookie Joint",
                action = 'rd-jobs:BlueMoonJoint',
            },
            {
                title = "Pink Noscar Joint",
                description = "Roll 2g  Pink Noscar Cookie Joint",
                action = 'rd-jobs:PinkJoint',
            },
            {
                title = "Grape Soda Joint",
                description = "Roll 2g Grape Soda Cookie Joint",
                action = 'rd-jobs:GrapeSoda',
            },
            {
                title = "WonKeRZ Joint",
                description = "Roll 2g WonKeRZ Cookie Joint",
                action = 'rd-jobs:WonKeRZ',
            },
            {
                title = "Blunt",
                description = "Roll a blunt",
                action = 'rd-jobs:blunt',
            },
        }
        exports["rd-ui"]:showContextMenu(CCJoint)
    else
        TriggerEvent('DoLongHudText', 'You are Not Employed Here.', 2)
    end
end)

RegisterUICallback('rd-jobs:BlueMoonJoint', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['rd-inventory']:hasEnoughOfItem('weedq', 1) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(math.random(20000, 30000), 'Crafting Blue Moon Cookie Joint')
        if (finished == 100) then
            TriggerEvent("inventory:removeItem","weedq", 1)
            Wait(1000)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            TriggerEvent('player:receiveItem', 'bluejoint', 1)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

RegisterUICallback('rd-jobs:PinkJoint', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['rd-inventory']:hasEnoughOfItem('weedq', 4) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(math.random(20000, 30000), 'Crafting Pink Noscar')
        if (finished == 100) then
            TriggerEvent("inventory:removeItem","weedq", 4)
            Wait(1000)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            TriggerEvent('player:receiveItem', 'pinkjoint', 1)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

RegisterUICallback('rd-jobs:GrapeSoda', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['rd-inventory']:hasEnoughOfItem('weedq', 2) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(math.random(20000, 30000), 'Crafting Grape Soda Joint')
        if (finished == 100) then
            TriggerEvent("inventory:removeItem","weedq", 2)
            Wait(1000)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            TriggerEvent('player:receiveItem', 'grapejoint', 1)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

RegisterUICallback('rd-jobs:WonKeRZ', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['rd-inventory']:hasEnoughOfItem('weedq', 3) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(math.random(20000, 30000), 'Crafting WonKeRZ Joint')
        if (finished == 100) then
            TriggerEvent("inventory:removeItem","weedq", 3)
            Wait(1000)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            TriggerEvent('player:receiveItem', 'yellowjoint', 1)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

RegisterUICallback('rd-jobs:blunt', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['rd-inventory']:hasEnoughOfItem('weedq', 5) then
        FreezeEntityPosition(GetPlayerPed(-1),true)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(math.random(20000, 30000), 'Crafting a blunt')
        if (finished == 100) then
            TriggerEvent("inventory:removeItem","weedq", 5)
            Wait(1000)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            TriggerEvent('player:receiveItem', 'blunt', 1)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

--- joints finished

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent("cookies:pay")
AddEventHandler("cookies:pay", function(amount)
    TriggerServerEvent("server:GroupPayment","cookies", amount)
end)

RegisterNetEvent("cookies:get:receipt")
AddEventHandler("cookies:get:receipt", function(registerid)
    TriggerServerEvent('cookies:retreive:receipt', registerid)
end)

RegisterNetEvent('cookies:openCounter')
AddEventHandler('cookies:openCounter', function()
    TriggerEvent("server-inventory-open", "1", "cosmic_counter")
end)


