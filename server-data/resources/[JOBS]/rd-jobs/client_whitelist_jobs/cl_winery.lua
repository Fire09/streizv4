local nearPicking = false

Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("winery_picking", vector3(-1887.05, 2108.06, 139.52), 18.8, 46.6,  {
		name="winery_picking",
		heading=177,
    }) 
end)

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "winery_picking" then
        local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
        if isEmployed then
            nearPicking = true
            AtPoliceBuy()
			exports['rd-ui']:showInteraction(("[E] %s"):format("Start Picking"))
        end
    end
end)


RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "winery_picking" then
        nearPicking = false
    end
    exports['rd-ui']:hideInteraction()
end)

function AtPoliceBuy()
	Citizen.CreateThread(function()
        while nearPicking do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
                if IsControlJustReleased(0, 38) then
                    local ped = PlayerPedId()
                    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
                    if isEmployed then
                        LoadAnim('mp_common_heist')
                        FreezeEntityPosition(ped,true)
                        Citizen.Wait(500)
                        ClearPedTasksImmediately(ped)
                        TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
                        local finished = exports['rd-taskbar']:taskBar(math.random(5000, 10000), 'Picking Grapes')
                        if (finished == 100) then
                            local chance = math.random(0, 1)
                            FreezeEntityPosition(ped,false)
                            if chance == 0 then
                                TriggerEvent('player:receiveItem', 'green_grapes')
                            elseif chance == 1 then 
                                TriggerEvent('player:receiveItem', 'purple_grapes')
                            end
                        else
                            FreezeEntityPosition(ped,false)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'You cant do that', 2)
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

RegisterNetEvent('rd-jobs:break-grapes-green:winery')
AddEventHandler('rd-jobs:break-grapes-green:winery', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('green_grapes', 10) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 3.5432)
            local cooking = exports['rd-taskbar']:taskBar(5000, 'Chopping Purple Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","green_grapes", 10)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'clunckyg', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 10x Green Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('rd-jobs:break-grapes-purple:winery')
AddEventHandler('rd-jobs:break-grapes-purple:winery', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('purple_grapes', 10) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 3.5432)
            local cooking = exports['rd-taskbar']:taskBar(5000, 'Chopping Green Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","purple_grapes", 10)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'clunckyp', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 10x Purple Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)


RegisterNetEvent('rd-jobs:cook-grapes-purple:winery')
AddEventHandler('rd-jobs:cook-grapes-purple:winery', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('clunckyp', 3) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 274.96063232422)
            local cooking = exports['rd-taskbar']:taskBar(5000, 'Cooking Cluncky Purple Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","clunckyp", 3)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'redwine', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 3x Clunky Purple Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)


RegisterNetEvent('rd-jobs:cook-grapes-green:winery')
AddEventHandler('rd-jobs:cook-grapes-green:winery', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('clunckyg', 3) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 274.96063232422)
            local cooking = exports['rd-taskbar']:taskBar(5000, 'Cooking Cluncky Green Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","clunckyg", 3)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'whitewine', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 3x Clunky Green Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('rd-jobs:grabGlass')
AddEventHandler('rd-jobs:grabGlass', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then
        TriggerEvent("player:receiveItem","emptywineg", 1)
		Wait(1000)
	end
end)


RegisterNetEvent('rd-jobs:pourWhiteWine')
AddEventHandler('rd-jobs:pourWhiteWine', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['rd-inventory']:hasEnoughOfItem('whitewine', 1) and exports['rd-inventory']:hasEnoughOfItem('emptywineg', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local cooking = exports['rd-taskbar']:taskBar(5000, 'Pouring White Wine')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","whitewine", 1)
                TriggerEvent("inventory:removeItem","emptywineg", 1)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'glasswhitew', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x White Wine | x1 Empty Wine Glass')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('rd-jobs:pourRedWine')
AddEventHandler('rd-jobs:pourRedWine', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("winery")
    if isEmployed then 
        if exports['rd-inventory']:hasEnoughOfItem('redwine', 1) and exports['rd-inventory']:hasEnoughOfItem('emptywineg', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local cooking = exports['rd-taskbar']:taskBar(5000, 'Pouring White Wine')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","redwine", 1)
                TriggerEvent("inventory:removeItem","emptywineg", 1)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'glassredw', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Red Wine | x1 Empty Wine Glass')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

function playerAnim()
	loadAnimDict( "mp_safehouselost@" )
    TaskPlayAnim( PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

RegisterNetEvent("rd-jobs:SellRedWine")
AddEventHandler("rd-jobs:SellRedWine", function()
	if exports["rd-inventory"]:getQuantity("redwine") >= 5 then
		playerAnim()
		local finished = exports["rd-taskbar"]:taskBar(4000,"Selling Red Wine",true,false,playerVeh)
		if finished == 100 then
			if exports["rd-inventory"]:getQuantity("redwine") >= 5 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', 'redwine', 5)
				TriggerServerEvent('rd-banking:addMoney', 35)
			else
                TriggerEvent('DoLongHudText', 'Required: 5x Red Wine', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'Required: 5x Red Wine', 2)
	end
end)

RegisterNetEvent("rd-jobs:SellWhiteWine")
AddEventHandler("rd-jobs:SellWhiteWine", function()
	if exports["rd-inventory"]:getQuantity("whitewine") >= 5 then
		playerAnim()
		local finished = exports["rd-taskbar"]:taskBar(4000,"Selling White Wine",true,false,playerVeh)
		if finished == 100 then
			if exports["rd-inventory"]:getQuantity("whitewine") >= 5 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', 'whitewine', 5)
				TriggerServerEvent('rd-banking:addMoney', 35)
			else
                TriggerEvent('DoLongHudText', 'Required: 5x White Wine', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'Required: 5x White Wine', 2)
	end
end)

-- made by sk1c2

local carryingBackInProgress = false
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0

RegisterCommand("carry",function(source, args)
	if not carryingBackInProgress then
		local player = PlayerPedId()	
		lib = 'missfinale_c2mcs_1'
		anim1 = 'fin_c2_mcs_1_camman'
		lib2 = 'nm'
		anim2 = 'firemans_carry'
		distans = 0.15
		distans2 = 0.27
		height = 0.63
		spin = 0.0		
		length = 100000
		controlFlagMe = 49
		controlFlagTarget = 33
		animFlagTarget = 1
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		if closestPlayer ~= -1 and closestPlayer ~= nil then
			if not IsEntityInWater(player) then
				carryingBackInProgress = true
				TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
			else
				TriggerEvent("DoLongHudText","You can't carry while in water.",2)
			end
		else
			TriggerEvent("DoLongHudText","There is no one close to you to carry.",2)
		end
	else
		carryingBackInProgress = false
		ClearPedSecondaryTask(GetPlayerPed(-1))
		DetachEntity(GetPlayerPed(-1), true, false)
		local closestPlayer = GetClosestPlayer(3)
		target = GetPlayerServerId(closestPlayer)
		if target ~= 0 then 
			TriggerServerEvent("CarryPeople:stop",target)
		end
	end
end,false)

RegisterNetEvent('CarryPeople:syncTarget')
AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation2
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

----------------------

Citizen.CreateThread(function()
	while true do
		if carryingBackInProgress then 
			while not IsEntityPlayingAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 3) do
				TaskPlayAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
				Citizen.Wait(0)
			end
			local playerPed = GetPlayerPed(-1)
			local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
			while IsEntityInWater(player) do
				carryingBackInProgress = false
				ClearPedSecondaryTask(GetPlayerPed(-1))
				DetachEntity(GetPlayerPed(-1), true, false)
				local closestPlayer = GetClosestPlayer(3)
				target = GetPlayerServerId(closestPlayer)
				if target ~= 0 then 
					TriggerServerEvent("CarryPeople:stop",target)
				end
			end
		end
		Wait(0)
	end
end)

----------------------

RegisterNetEvent('CarryPeople:syncMe')
AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:cl_stop')
AddEventHandler('CarryPeople:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if carryingBackInProgress then 
			while not IsEntityPlayingAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 3) do
				TaskPlayAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
				Citizen.Wait(0)
			end
		end
		Wait(0)
	end
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end