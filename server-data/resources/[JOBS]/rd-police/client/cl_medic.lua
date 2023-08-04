
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('requestWounds')
AddEventHandler('requestWounds', function(pArgs, pEntity)
	local targetPed = nil
	if not pEntity then
		targetPed = exports['rd-target']:GetCurrentEntity()
	else
		targetPed = pEntity
	end 

	if not targetPed and not IsPedAPlayer(targetPed) then
		return
	end

	local plySrvId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(targetPed))

	TriggerServerEvent("Evidence:GetWounds", plySrvId)
end)

Citizen.CreateThread(function()
	RegisterCommand("+emsRevive", emsRevive, false)
	RegisterCommand("-emsRevive", function() end, false)
	exports["rd-keybinds"]:registerKeyMapping("", "EMS", "Revive", "+emsRevive", "-emsRevive")

	RegisterCommand("+emsHeal", emsHeal, false)
	RegisterCommand("-emsHeal", function() end, false)
	exports["rd-keybinds"]:registerKeyMapping("", "EMS", "Heal", "+emsHeal", "-emsHeal")

	RegisterCommand("+examineTarget", function()
		TriggerEvent("requestWounds")
	end, false)
	RegisterCommand("-examineTarget", function() end, false)
	exports["rd-keybinds"]:registerKeyMapping("", "EMS", "Examine Target", "+examineTarget", "-examineTarget")
end)

function emsRevive()
	if not inmenus and (isMedic or isDoctor or isDoc) and not IsPauseMenuActive() then
		TriggerEvent("revive")
	end
end

function emsHeal()
	if not inmenus and (isMedic or isDoctor or isDoc) and not IsPauseMenuActive() then
		TriggerEvent("ems:heal")
	end
end

function KneelMedic()
	loadAnimDict("amb@medic@standing@tendtodead@enter")
	loadAnimDict("amb@medic@standing@timeofdeath@enter")
	loadAnimDict("amb@medic@standing@tendtodead@idle_a")
	loadAnimDict("random@crash_rescue@help_victim_up")

	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@tendtodead@enter", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
	Citizen.Wait (1000)
	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@tendtodead@idle_a", "idle_b", 8.0, 1.0, -1, 9, 0, 0, 0, 0)
	Citizen.Wait (3000)
	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@tendtodead@exit", "exit_flee", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
	Citizen.Wait (1000)
	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@timeofdeath@enter", "enter", 8.0, 1.0, -1, 128, 0, 0, 0, 0)
	Citizen.Wait (500)
	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@timeofdeath@enter", "helping_victim_to_feet_player", 8.0, 1.0, -1, 128, 0, 0, 0, 0)
end

RegisterNetEvent("revive")
AddEventHandler("revive", function(t)
	local target, distance = GetClosestPlayer()

	if target and (distance ~= -1 and distance < 5) then
		KneelMedic()
		TriggerServerEvent("reviveGranted", GetPlayerServerId(target))
	else
		TriggerEvent("DoLongHudText", "No player near you (maybe get closer)!", 2)
	end
end)

RegisterNetEvent("ems:heal")
AddEventHandler("ems:heal", function()
	local target, distance = GetClosestPlayer()

	if target and (distance ~= -1 and distance < 5) then
		local myjob = exports["isPed"]:isPed("myjob")
		if myjob ~= "ems" and myjob ~= "doctor" and myjob ~= "doc" then
			local bandages = exports["rd-inventory"]:getQuantity("bandage")

			if bandages == 0 then
				return
			else
				TriggerEvent("inventory:removeItem", "bandage", 1)
			end
		end

		TriggerEvent("animation:PlayAnimation","layspike")
		TriggerServerEvent("ems:healplayer", GetPlayerServerId(target))
	end
end)

RegisterNetEvent("ems:stomachpump")
AddEventHandler("ems:stomachpump", function()
	local target, distance = GetClosestPlayer()

	if target and (distance ~= -1 and distance < 5) then
		local finished = exports["rd-taskbar"]:taskBar(10000, "Inserting stomach pump 🤢", false, true)
		TriggerEvent("animation:PlayAnimation", "cpr")
		if finished == 100 then
			TriggerServerEvent("fx:puke", GetPlayerServerId(target))
		end
		TriggerEvent("animation:cancel")
	end
end)

function InVeh()
	local ply = PlayerPedId()
	local intrunk = exports["isPed"]:isPed("intrunk")
	if IsPedSittingInAnyVehicle(ply) or intrunk then
	  return true
	else
	  return false
	end
  end

  function IsDeadAnimPlaying()
    if IsEntityPlayingAnim(PlayerPedId(), "random@dealgonewrong", "idle_a", 1) or IsEntityPlayingAnim(PlayerPedId(), "mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", 1) or IsEntityPlayingAnim(PlayerPedId(), "dead", "dead_d", 1) then
        return true
    else
        return false
    end
end

function IsDeadVehAnimPlaying()
    if IsEntityPlayingAnim(PlayerPedId(), "random@crash_rescue@car_death@std_car", "loop", 1) then
        return true
    else
        return false
    end
end

function attemptRevive()
    if InVeh() then return end

    if imDead or IsDeadAnimPlaying() or IsDeadVehAnimPlaying() then
        imDead = false
        thecount = 300

        local ped = PlayerPedId()

        TriggerEvent("resurrect:relationships")
        TriggerEvent("Evidence:isAlive")

        SetEntityInvincible(ped, false)
        SetPedMaxHealth(ped, 200)
        SetEntityHealth(ped, 120)
        SetPlayerMaxArmour(PlayerId(), 60)
        ClearPedBloodDamage(ped)
        RemoveAllPedWeapons(ped, true)

        ClearPedTasksImmediately(ped)

        local wasBeatdown = exports["rd-police"]:getBeatmodeDebuff()
        if wasBeatdown then
            TriggerEvent("police:startBeatdownDebuff")
        end

        local plyPos = GetEntityCoords(ped,  true)
        local heading = GetEntityHeading(ped)
        NetworkResurrectLocalPlayer(plyPos, heading, false, false, false)

        Citizen.Wait(500)

        SetPedMaxHealth(PlayerPedId(), 200)
        SetEntityHealth(PlayerPedId(), 120)
        getup()
    end
end

function getup()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict("random@crash_rescue@help_victim_up")
    TaskPlayAnim(PlayerPedId(), "random@crash_rescue@help_victim_up", "helping_victim_to_feet_victim", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    SetCurrentPedWeapon(PlayerPedId(),2725352035,true)
    Citizen.Wait(3000)
    ClearPedSecondaryTask(PlayerPedId())
end

RegisterNetEvent("heal")
AddEventHandler("heal", function()
	local ped = PlayerPedId()
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		SetEntityHealth(ped, GetEntityMaxHealth(ped))
	end
end)

RegisterNetEvent("trycpr")
AddEventHandler("trycpr", function()
    local curDist = #(GetEntityCoords(PlayerPedId(), 0) - vector3(2438.32, 4960.30, 47.27))
    local curDist2 = #(GetEntityCoords(PlayerPedId(), 0) - vector3(-1001.18, 4850.52, 274.61))

    if curDist < 5 or curDist2 < 5 then
        local penis = 0
        while penis < 10 do
            penis = penis + 1
            local finished = exports["rd-ui"]:taskBarSkill(math.random(2000, 6000),math.random(5, 15))
            if finished ~= 100 then
                return
            end
            Wait(100)
        end
        TriggerServerEvent("serverCPR")
    else
        TriggerEvent("DoLongHudText","You're not near the rest house",2)
    end
end)

RegisterNetEvent("reviveFunction")
AddEventHandler("reviveFunction", attemptRevive)