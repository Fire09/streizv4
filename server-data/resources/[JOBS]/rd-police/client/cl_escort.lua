--[[

    Variables

]]

-- Escort
DecorRegister("escorting", 3)
DecorRegister("escorted", 3)
DecorSetInt(PlayerPedId(), "escorting", 0)
DecorSetInt(PlayerPedId(), "escorted", 0)

-- Drag
DecorRegister("dragging", 3)
DecorRegister("dragged", 3)
DecorSetInt(PlayerPedId(), "escorting", 0)
DecorSetInt(PlayerPedId(), "escorted", 0)

--[[

    Functions

]]

function policeEscort()
	if not inmenus and (isMedic or isDoctor or isCop) and not IsPauseMenuActive() then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if isInVeh and isCop then
			TriggerEvent("startSpeedo")
		else
			TriggerEvent("rd-police:escort")
		end
	end
end

function policeSeat()
	if not inmenus and (isMedic or isCop) and not IsPauseMenuActive() then
		TriggerEvent("police:forceEnter")
	end
end

function findFirstVehicleSeat(vehicle, checkFull, startAtFront, checkDriver)
	local model = GetEntityModel(vehicle)
	local numofseats = GetVehicleModelNumberOfSeats(model)
	local actualnumofseats = numofseats - 2

	local startingValue = actualnumofseats
	local iterator = -1
	local loopcount = 0

	if checkDriver then
		loopcount = -1
	end

	if startAtFront then
		iterator = 1
		loopcount = actualnumofseats

		if checkDriver then
			startingValue = -1
		else
			startingValue = 0
		end
	end

	for i=startingValue, loopcount, iterator do
		if checkFull then
			if not IsVehicleSeatFree(vehicle, i) then
				return i
			end
		else
			if IsVehicleSeatFree(vehicle, i) then
				return i
			end
		end
	end
end

--[[

    Events

]]

RegisterNetEvent("rd-police:escort")
AddEventHandler("rd-police:escort", function()
	if not isDisabled() and DecorGetInt(PlayerPedId(), "escorting") == 0 and DecorGetInt(PlayerPedId(), "escorted") == 0 and DecorGetInt(PlayerPedId(), "dragging") == 0 and DecorGetInt(PlayerPedId(), "dragged") == 0 and not IsPedRagdoll(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPlayerFreeAiming(PlayerId()) then
		local t, distance, ped = GetClosestPlayer()

		if distance ~= -1 and distance < 2.0 and GetEntitySpeed(ped) < 1.0 and not IsPedInAnyVehicle(ped, false) then
			if DecorExistOn(ped, "escorted") and DecorGetInt(ped, "escorted") == 0 then
				DecorSetInt(PlayerPedId(), "escorting", GetPlayerServerId(t))
				TriggerServerEvent("rd-police:escort", GetPlayerServerId(t), -1, false)
				TriggerEvent("rd-police:drag:escort")
			end
		end
	else
		if DecorGetInt(PlayerPedId(), "escorting") ~= 0 then
			TriggerServerEvent("rd-police:escort", DecorGetInt(PlayerPedId(), "escorting"), 0, false)
			DecorSetInt(PlayerPedId(), "escorting", 0)
			ClearPedTasksImmediately(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			TriggerEvent("rd-police:drag:releaseEscort")
		end

		if DecorGetInt(PlayerPedId(), "dragging") ~= 0 then
			TriggerServerEvent("rd-police:escort", DecorGetInt(PlayerPedId(), "dragging"), 0, true)
			DecorSetInt(PlayerPedId(), "dragging", 0)
			ClearPedTasksImmediately(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
		end
	end
end)

RegisterNetEvent("rd-police:escortReceive")
AddEventHandler("rd-police:escortReceive", function(pToggle, pDrag)
	if pDrag then
		DecorSetInt(PlayerPedId(), "dragged", pToggle)
	else
		DecorSetInt(PlayerPedId(), "escorted", pToggle)
	end

	if pToggle == 0 then
		ClearPedTasksImmediately(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
	end
end)

RegisterNetEvent("rd-police:escortingReceive")
AddEventHandler("rd-police:escortingReceive", function(pToggle, pDrag)
	if pDrag then
		DecorSetInt(PlayerPedId(), "dragging", pToggle)
	else
		DecorSetInt(PlayerPedId(), "escorting", pToggle)
	end

	if pToggle == 0 then
		ClearPedTasksImmediately(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
	end
end)

RegisterNetEvent("rd-police:unescort")
AddEventHandler("rd-police:unescort", function()
	TriggerServerEvent("rd-police:escorting", DecorGetInt(PlayerPedId(), "escorted"), 0, false)
	TriggerServerEvent("rd-police:escorting", DecorGetInt(PlayerPedId(), "dragged"), 0, true)
	TriggerEvent("rd-police:drag:releaseEscort")
	DecorSetInt(PlayerPedId(), "escorted", 0)
	DecorSetInt(PlayerPedId(), "dragged", 0)

	ClearPedTasks(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

RegisterNetEvent("rd-police:drag")
AddEventHandler("rd-police:drag", function()
	if not isDisabled() and DecorGetInt(PlayerPedId(), "escorting") == 0 and DecorGetInt(PlayerPedId(), "escorted") == 0 and DecorGetInt(PlayerPedId(), "dragging") == 0 and DecorGetInt(PlayerPedId(), "dragged") == 0 and not IsPedRagdoll(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPlayerFreeAiming(PlayerId()) then
		local t, distance, ped = GetClosestPlayer()

		if distance ~= -1 and distance < 1.0 and GetEntitySpeed(ped) < 1.0 and not IsPedInAnyVehicle(ped, false) then
			if DecorExistOn(ped, "dragged") and DecorGetInt(ped, "dragged") == 0 then
				DecorSetInt(PlayerPedId(), "dragging", GetPlayerServerId(t))
				TriggerServerEvent("rd-police:escort", GetPlayerServerId(t), -1, true)
			end
		end
	else
		if DecorGetInt(PlayerPedId(), "escorting") ~= 0 then
			TriggerServerEvent("rd-police:escort", DecorGetInt(PlayerPedId(), "escorting"), 0, false)
			DecorSetInt(PlayerPedId(), "escorting", 0)
			ClearPedTasksImmediately(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
		end

		if DecorGetInt(PlayerPedId(), "dragging") ~= 0 then
			TriggerServerEvent("rd-police:escort", DecorGetInt(PlayerPedId(), "dragging"), 0, true)
			DecorSetInt(PlayerPedId(), "dragging", 0)
			ClearPedTasksImmediately(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
		end
	end
end)

RegisterNetEvent("rd-police:resetEscort")
AddEventHandler("rd-police:resetEscort", function()
	if DecorGetInt(PlayerPedId(), "escorting") ~= 0 then
		TriggerServerEvent("rd-police:escort", DecorGetInt(PlayerPedId(), "escorting"), 0, false)
		DecorSetInt(PlayerPedId(), "escorting", 0)
		ClearPedTasksImmediately(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
	end

	if DecorGetInt(PlayerPedId(), "dragging") ~= 0 then
		TriggerServerEvent("rd-police:escort", DecorGetInt(PlayerPedId(), "dragging"), 0, true)
		DecorSetInt(PlayerPedId(), "dragging", 0)
		ClearPedTasksImmediately(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
	end

	if DecorGetInt(PlayerPedId(), "escorted") ~= 0 then
		TriggerServerEvent("rd-police:escorting", DecorGetInt(PlayerPedId(), "escorted"), 0, false)
		DecorSetInt(PlayerPedId(), "escorted", 0)
		ClearPedTasks(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
	end

	if DecorGetInt(PlayerPedId(), "dragged") ~= 0 then
		TriggerServerEvent("rd-police:escorting", DecorGetInt(PlayerPedId(), "dragged"), 0, true)
		DecorSetInt(PlayerPedId(), "dragged", 0)
		ClearPedTasks(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
	end
end)

RegisterNetEvent("police:forceEnter")
AddEventHandler("police:forceEnter", function()
	local plyPed = PlayerPedId()
	local tPed, tPly, tServerId = getClosestPlayer(GetEntityCoords(plyPed), 3.0)

	if tPed == nil or tPed < 0 then
		TriggerEvent("DoLongHudText", "No nearby player!", 2)
		return
	end

	local isInVeh = IsPedInAnyVehicle(tPed, true)

	if isInVeh then
		TriggerEvent("unseatPlayer")
		return
	else
		local veh = exports["rd-target"]:GetCurrentEntity()

		if not IsEntityAVehicle(veh) then
			TriggerEvent("DoLongHudText", "Please look at the vehicle!", 2)
			return
		end

		if GetVehicleEngineHealth(veh) < 100.0 then
			TriggerEvent("DoLongHudText", "This vehicle is badly damaged!", 2)
			return
		end

		if not AreAnyVehicleSeatsFree(veh) then
			TriggerEvent("DoLongHudText", "There are no chairs available for you!", 2)
			return
		end

		local seat = findFirstVehicleSeat(veh, false, false, false)

		if seat then
			local vehNet = NetworkGetNetworkIdFromEntity(veh)
			local finished = exports["rd-taskbar"]:taskBar(4000, "seating in vehicle")	
			if finished == 100 then
			TriggerServerEvent("police:tellSitInVehicle", tServerId, vehNet, seat)
			end
		end
	end
end)

RegisterNetEvent("police:forceSeatPlayer")
AddEventHandler("police:forceSeatPlayer", function(vehNet, seat)
	local veh = NetworkGetEntityFromNetworkId(vehNet)

	if not IsEntityAVehicle(veh) then
		return
	end

	TriggerEvent("rd-police:unescort")
	Citizen.Wait(100)
	TaskWarpPedIntoVehicle(PlayerPedId(), veh, seat)
end)

RegisterNetEvent("unseatPlayer")
AddEventHandler("unseatPlayer", function()
	local veh = exports["rd-target"]:GetCurrentEntity()

	if not IsEntityAVehicle(veh) then
		TriggerEvent("DoLongHudText", "look at the vehicle!", 2)
		return
	end

	local seat = findFirstVehicleSeat(veh, true, false, true)

	if seat then
		local tPed = GetPedInVehicleSeat(veh, seat)
		local tPly = NetworkGetPlayerIndexFromPed(tPed)

		if tPly < 0 then
			TriggerEvent("DoLongHudText", "no one was found", 1)
			return
		end

		local tServerId = GetPlayerServerId(tPly)

		local vehNet = NetworkGetNetworkIdFromEntity(veh)
		local finished = exports["rd-taskbar"]:taskBar(4000, "unseating from vehicle")	
		if finished == 100 then
		TriggerServerEvent("police:tellGetOutOfVehicle", tServerId, vehNet)

		while IsPedInAnyVehicle(tPed, false) do
			Citizen.Wait(0)
		end

		if DecorGetInt(PlayerPedId(), "escorting") == 0 then
			DecorSetInt(PlayerPedId(), "escorting", tServerId)
			TriggerServerEvent("rd-police:escort", tServerId, -1, false)
			TriggerEvent("rd-police:drag:escort")
		end
	else
		TriggerEvent("DoLongHudText", "There is no one in this vehicle", 1)
	 end
	end
end)

RegisterNetEvent("police:forceUnseatPlayer")
AddEventHandler("police:forceUnseatPlayer", function(vehNet)
	local veh = NetworkGetEntityFromNetworkId(vehNet)
	local ped = PlayerPedId()

	TaskLeaveVehicle(ped, veh, 256)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    RegisterCommand("+policeEscort", policeEscort, false)
	RegisterCommand("-policeEscort", function() end, false)
	exports["rd-keybinds"]:registerKeyMapping("", "Police", "Escort / Speedo", "+policeEscort", "-policeEscort", "LEFT")

    RegisterCommand("+policeSeat", policeSeat, false)
	RegisterCommand("-policeSeat", function() end, false)
	exports["rd-keybinds"]:registerKeyMapping("", "Police", "Force into Vehicle", "+policeSeat", "-policeSeat", "RIGHT")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if DecorGetInt(PlayerPedId(), "escorted") ~= 0 and IsEntityDead(GetPlayerPed(GetPlayerFromServerId(DecorGetInt(PlayerPedId(), "escorted")))) then
			DetachEntity(PlayerPedId(), true, false)

			local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(GetPlayerFromServerId(DecorGetInt(PlayerPedId(), "escorted"))), 0.0, 0.8, 2.8)
			SetEntityCoords(PlayerPedId(), pos)

			TriggerServerEvent("rd-police:escorting", DecorGetInt(PlayerPedId(), "escorted"), 0, false)
			DecorSetInt(PlayerPedId(), "escorted", 0)
		end

		if DecorGetInt(PlayerPedId(), "dragged") ~= 0 and IsEntityDead(GetPlayerPed(GetPlayerFromServerId(DecorGetInt(PlayerPedId(), "dragged")))) then
			DetachEntity(PlayerPedId(), true, false)

			local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(GetPlayerFromServerId(DecorGetInt(PlayerPedId(), "dragged"))), 0.0, 0.8, 2.8)
			SetEntityCoords(PlayerPedId(), pos)

			TriggerServerEvent("rd-police:escorting", DecorGetInt(PlayerPedId(), "dragged"), 0, true)
			DecorSetInt(PlayerPedId(), "dragged", 0)
		end

		if DecorGetInt(PlayerPedId(), "escorted") ~= 0 or DecorGetInt(PlayerPedId(), "dragged") ~= 0 then
			DisableControlAction(1, 23, true)  -- F
			DisableControlAction(1, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(1, 140, true) -- Disables Melee Actions
			DisableControlAction(1, 141, true) -- Disables Melee Actions
			DisableControlAction(1, 142, true) -- Disables Melee Actions
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (tab) Actions
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			DisableControlAction(2, 32, true)
			DisableControlAction(1, 33, true)
			DisableControlAction(1, 34, true)
			DisableControlAction(1, 35, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (tab) Actions
			DisableControlAction(0, 59)
			DisableControlAction(0, 60)
			DisableControlAction(2, 31, true)
			SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)

			if DecorGetInt(PlayerPedId(), "escorted") ~= 0 then
				AttachEntityToEntity(PlayerPedId(), (GetPlayerPed(GetPlayerFromServerId(DecorGetInt(PlayerPedId(), "escorted")))), 11816, 0.54, 0.44, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			else
				AttachEntityToEntity(PlayerPedId(), (GetPlayerPed(GetPlayerFromServerId(DecorGetInt(PlayerPedId(), "dragged")))), 1, -0.68, -0.2, 0.94, 180.0, 180.0, 60.0, 1, 1, 0, 1, 0, 1)

				if not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 3) then
					loadAnimDict("amb@world_human_bum_slumped@male@laying_on_left_side@base")
					TaskPlayAnim(PlayerPedId(), "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
				end
			end
		end

		if DecorGetInt(PlayerPedId(), "dragging") ~= 0 then
			if not IsEntityPlayingAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
				loadAnimDict("missfinale_c2mcs_1")
				TaskPlayAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 1.0, 1.0, -1, 50, 0, 0, 0, 0)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		if DecorGetInt(PlayerPedId(), "escorting") ~= 0 or DecorGetInt(PlayerPedId(), "dragging") ~= 0 then
			DisableControlAction(0, 21, true) -- Left Shift Sprint

            if `WEAPON_UNARMED` ~= GetSelectedPedWeapon(PlayerPedId()) then
				DisableControlAction(2, 22, true) -- disable combat roll
			end

			Citizen.Wait(1)
		else
			Citizen.Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if not DecorExistOn(PlayerPedId(), "escorting") then
			DecorSetInt(PlayerPedId(), "escorting", 0)
		end
		if not DecorExistOn(PlayerPedId(), "escorted") then
			DecorSetInt(PlayerPedId(), "escorted", 0)
		end
		if not DecorExistOn(PlayerPedId(), "dragging") then
			DecorSetInt(PlayerPedId(), "dragging", 0)
		end
		if not DecorExistOn(PlayerPedId(), "dragged") then
			DecorSetInt(PlayerPedId(), "dragged", 0)
		end
	end
end)