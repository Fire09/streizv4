--[[

	Variables

]]

inmenus = false

--[[

	Functions

]]

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local closestPed = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)

    if not IsPedInAnyVehicle(PlayerPedId(), false) then
		for index,value in ipairs(players) do
			local target = GetPlayerPed(value)
			if(target ~= ply) then
				local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
				local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
				if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
					closestPlayer = value
					closestPed = target
					closestDistance = distance
				end
			end
		end

		return closestPlayer, closestDistance, closestPed

	else
		TriggerEvent("DoLongHudText","Inside the vehicle.",2)
	end
end

--[[

	Events

]]

RegisterNetEvent("inmenu")
AddEventHandler("inmenu", function(change)
	inmenus = change
end)

local SimezCheck = false

AddEventHandler("rd-inventory:itemUsed", function(item, info, information)
	if item ~= "panicbutton" then return end
	local playerCid = exports["isPed"]:isPed("cid")
	local dispatchCode = "10-11"
	local panicInformation  = {
		cid = playerCid.. "is down"
	  }
	SimezCheck = true
	if not SimezCheck then
	  TriggerEvent("DoLongHudText", "OROSPUCOCU", 2)
	  return
	end
	local finished = exports["rd-taskbar"]:taskBar(4000, "Sending Distress Signal")	
	if finished == 100 then
		exports["rd-dispatch"]:policedead(dispatchCode, "Officer Distress Signal URGENT", panicInformation.cid) 

	end
  end)

AddEventHandler("rd-inventory:itemUsed222", function(item)
    if item ~= "panicbutton" then return end
	local playerCid = exports["isPed"]:isPed("cid")
	local panicInformation  = {
		cid = playerCid.. "is down"
	  }

    if finished == 100 then
		local finished = exports["rd-taskbar"]:taskBar(4000, "Sending Distress Signal")	
	end
end)

local function flipVehicle(pVehicle, pPitch, pVRoll, pVYaw)
	SetEntityRotation(pVehicle, pPitch, pVRoll, pVYaw, 1, true)
	Wait(10)
	SetVehicleOnGroundProperly(pVehicle)
end

RegisterNetEvent("vehicle:flip")
AddEventHandler("vehicle:flip", function(pVehicle, pPitch, pVRoll, pVYaw)
	flipVehicle(NetToVeh(pVehicle), pPitch, pVRoll, pVYaw)
end)

RegisterNetEvent('FlipVehicle')
AddEventHandler('FlipVehicle', function(pDummy, pEntity)
  TriggerEvent("animation:PlayAnimation", "push")
  local finished = exports["rd-taskbar"]:taskBar(30000, "Flipping Vehicle Over", true, true, nil, false, nil, 3.5, pEntity)
  ClearPedTasks(PlayerPedId())
  if finished ~= 100 then return end
	
	local playerped = PlayerPedId()
	local coordA = GetEntityCoords(playerped, 1)
	local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
	local pPitch, pRoll, pYaw = GetEntityRotation(playerped)
	local vPitch, vRoll, vYaw = GetEntityRotation(pEntity)
	
	if targetVehicle == 0 then return end

	if not NetworkHasControlOfEntity(pEntity) then
		local vehicleOwnerId = NetworkGetEntityOwner(pEntity)
		TriggerServerEvent("vehicle:flip", GetPlayerServerId(vehicleOwnerId), VehToNet(pEntity), pPitch, vRoll, vYaw)
	else
		flipVehicle(pEntity, pPitch, vRoll, vYaw)
	end
end)

RegisterNetEvent('rd-police:GetHeli')
AddEventHandler('rd-police:GetHeli', function()
    local PDHeliGarage = {
        {
            title = "Helicopter Garage",
            description = "Pull out a PD Heli",
            children = {
                title = "Polas 350",
                description = "Police Issued Helicopter",
                children = {
                    title = "Take Out",
                    action = "rd-police:spawnPolas"
                }
            }
        },
    }
    exports["rd-ui"]:showContextMenu(PDHeliGarage)
end)

RegisterUICallback('rd-police:spawnPolas', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })

    local vehicle = GetHashKey('polas350')
	RequestModel(vehicle)
	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = "PDK " .. GetRandomIntInRange(1000, 9000)
	local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 2.0, 0)

	local veh = CreateVehicle(vehicle, 449.31, -981.07, 44.06, 87.21, true, false)

	SetModelAsNoLongerNeeded(vehicle)
	SetVehicleOnGroundProperly(veh)
	SetVehicleNumberPlateText(veh, plate)
	TriggerEvent("vehicle:keys:addNew",veh,plate)
end)

RegisterNetEvent('rd-police:GetHeliEms')
AddEventHandler('rd-police:GetHeliEms', function()
    local EMSHeliGarage = {
        {
            title = "Helicopter Garage",
            description = "Pull out a EMS Heli",
            children = {
                title = "Polas 350",
                description = "EMS Issued Helicopter",
                children = {
                    title = "Take Out",
                    action = "rd-police:spawnPolasEMs"
                }
            }
        },
    }
    exports["rd-ui"]:showContextMenu(EMSHeliGarage)
end)

RegisterUICallback('rd-police:spawnPolasEMs', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })

    local vehicle = GetHashKey('polas350')
	RequestModel(vehicle)
	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = "EMS " .. GetRandomIntInRange(1000, 9000)
	local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 2.0, 0)

	local veh = CreateVehicle(vehicle, 351.4024, -588.1263, 74.1657, 87.21, true, false)

	SetModelAsNoLongerNeeded(vehicle)
	SetVehicleOnGroundProperly(veh)
	SetVehicleNumberPlateText(veh, plate)
	TriggerEvent("vehicle:keys:addNew",veh,plate)
end)


--[[

    Events

]]

RegisterNetEvent("rd-police:vehicle:getInTrunk")
AddEventHandler("rd-police:vehicle:getInTrunk", function(pArgs, pEntity)
    PutInTrunk(pEntity)
end)

local canBeTackled = true
local inTackleCooldown = false
TimerEnabled = false

function TryTackle()
    if not TimerEnabled then
        target, distance = GetClosestPlayer()
        if (target ~= nil and distance ~= -1 and distance < 2) then

            local playerPed = PlayerPedId()
            local playerHeading = GetEntityHeading(playerPed)
            local playerCoords = GetEntityCoords(playerPed, true)

            local targetPed = GetPlayerPed(target)
            local targetCoords = GetEntityCoords(targetPed, true)

            -- angle between current player and target player
            local headingToTarget =
                (math.atan2(targetCoords.y - playerCoords.y, targetCoords.x - playerCoords.x) * 180 / math.pi) - 90

            -- grab the difference between the angle we're facing and the angle to the other player
            local diff = math.abs(((playerHeading - headingToTarget) + 180) % 360 - 180)

            -- 40 degrees leeway, so 80 deg total cone
            if diff < 40 then
                TriggerServerEvent('CrashTackle', GetPlayerServerId(target))
                TriggerEvent("animation:tacklelol")
                TimerEnabled = true
                Citizen.Wait(6000)
                TimerEnabled = false
                return
            end
        end

        SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
        TimerEnabled = true
        Citizen.Wait(1000)
        TimerEnabled = false
    end
end

function vehCruise()
	if GetLastInputMethod(2) then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if isInVeh then
			TriggerEvent("toggle:cruisecontrol")
		end
	end
end

cruisecontrol = false

RegisterNetEvent('toggle:cruisecontrol')
AddEventHandler('toggle:cruisecontrol', function()

    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local driverPed = GetPedInVehicleSeat(currentVehicle, -1)

    if driverPed == PlayerPedId() then

        if cruisecontrol then
            SetEntityMaxSpeed(currentVehicle, 999.0)
            cruisecontrol = false
            TriggerEvent("DoLongHudText", "Speed Limiter Inactive", 5)
            TriggerEvent('speedmeter:info',false)
        else
            speed = GetEntitySpeed(currentVehicle)
            if speed > 15.0 then
                SetEntityMaxSpeed(currentVehicle, speed)
                cruisecontrol = true
                TriggerEvent("DoLongHudText", "Speed Limiter Active", 5)
                TriggerEvent('speedmeter:info',true)
            else
                TriggerEvent("DoLongHudText", "Speed Limiter can only activate over 35mph", 2)
            end
        end

    end
end)

RegisterNetEvent('animation:tacklelol')
AddEventHandler('animation:tacklelol', function()
    if not handCuffed and not IsPedRagdoll(PlayerPedId()) then
        local lPed = PlayerPedId()

        RequestAnimDict("swimming@first_person@diving")
        while not HasAnimDictLoaded("swimming@first_person@diving") do
            Citizen.Wait(1)
        end

        if IsEntityPlayingAnim(lPed, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 3) then
            ClearPedSecondaryTask(lPed)

        else
            TaskPlayAnim(lPed, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 8.0, -8, -1, 49, 0, 0, 0, 0)
            seccount = 3
            while seccount > 0 do
                Citizen.Wait(100)
                seccount = seccount - 1
            end
            ClearPedSecondaryTask(lPed)
            SetPedToRagdoll(PlayerPedId(), 150, 150, 0, 0, 0, 0)
        end

    end

end)

RegisterNetEvent('playerTackled')
AddEventHandler('playerTackled', function()
    if not canBeTackled or inTackleCooldown then
        return
    end

    SetPedToRagdoll(PlayerPedId(), math.random(3500, 5000), math.random(3500, 5000), 0, 0, 0, 0)
    TimerEnabled = true
    inTackleCooldown = true
    Citizen.Wait(10000)
    TimerEnabled = false
    inTackleCooldown = false
end)

function plyTackel()

	if GetLastInputMethod(2) then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if not isInVeh and GetEntitySpeed(PlayerPedId()) > 2.5 then
			TryTackle()
		end
	end
end

Citizen.CreateThread(function()
  exports["rd-keybinds"]:registerKeyMapping("", "Vehicle", "Cruise Control", "+vehCruise", "-vehCruise", "X")
  RegisterCommand('+vehCruise', vehCruise, false)
  RegisterCommand('-vehCruise', function() end, false)

  exports["rd-keybinds"]:registerKeyMapping("", "Player", "Tackle", "+plyTackel", "-plyTackel")
  RegisterCommand('+plyTackel', plyTackel, false)
  RegisterCommand('-plyTackel', function() end, false)
end)

local fixedLocation = vector3(448.23, -996.44, 30.69)
local refreshed = false

function isOppositeDir(a, b)
    local result = 0
    if a < 90 then
        a = 360 + a
    end
    if b < 90 then
        b = 360 + b
    end
    if a > b then
        result = a - b
    else
        result = b - a
    end
    if result > 110 then
        return true
    else
        return false
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(1000)  -- wait 1 second before checking player position

        local playerPos = GetEntityCoords(PlayerPedId())
        local dist = #(fixedLocation - playerPos)
        if dist < 100 and not refreshed then
            DisableInterior(137473, false)
            if not IsInteriorReady(137473) then
                LoadInterior(137473)
            else
                RefreshInterior(137473)
            end
            refreshed = true
        end
        if refreshed and dist > 100 then
            DisableInterior(137473, true)
            refreshed = false
        end
    end
end)

RegisterNetEvent('rd-police:fingerPrintPlayer')
AddEventHandler('rd-police:fingerPrintPlayer', function()
    local finished = exports["rd-taskbar"]:taskBar(8000,"DNA Testing")
    if finished == 100 then
        t, distance = GetClosestPlayer()
        if(distance ~= -1 and distance < 5) then
            TriggerServerEvent("rd-police:dnaAsk", GetPlayerServerId(t))
        end
    end
end)

RegisterNetEvent('rd-police:remmaskAccepted')
AddEventHandler('rd-police:remmaskAccepted', function()
    TriggerEvent("facewear:adjust", 1, true)
    TriggerEvent("facewear:adjust", 3, true)
    TriggerEvent("facewear:adjust", 4, true)
    -- TriggerEvent("facewear:adjust", 5, true)
    TriggerEvent("facewear:adjust", 2, true)
end)

RegisterNetEvent('rd-police:remmask')
AddEventHandler('rd-police:remmask', function(t)
    t, distance = GetClosestPlayer()
    if (distance ~= -1 and distance < 5) then
        if isOppositeDir(GetEntityHeading(t), GetEntityHeading(PlayerPedId())) and
            not IsPedInVehicle(t, GetVehiclePedIsIn(t, false), false) then
            TriggerServerEvent("rd-police:remmaskGranted", GetPlayerServerId(t))
            AnimSet = "mp_missheist_ornatebank"
            AnimationOn = "stand_cash_in_bag_intro"
            AnimationOff = "stand_cash_in_bag_intro"
            loadAnimDict(AnimSet)
            TaskPlayAnim(PlayerPedId(), AnimSet, AnimationOn, 8.0, -8, -1, 49, 0, 0, 0, 0)
            Citizen.Wait(500)
            ClearPedTasks(PlayerPedId())
        end
    else
        TriggerEvent("DoLongHudText", "No player near you (maybe get closer)!", 2)
    end
end)

RegisterCommand("evidence", function(source, args)
    local job = exports["isPed"]:isPed("myjob")
    if job == 'police' then
        TriggerEvent("server-inventory-open", "1", "CASE ID: " .. args[1])
    end
end)

AddEventHandler("rd-police:CommandCabin", function()
    local job = exports["isPed"]:isPed("myjob")
    local cid = exports["isPed"]:isPed("cid")
    if job == 'police' then
        TriggerEvent("server-inventory-open", "1", "High Command Cabin: " .. cid)
    end
end)

Citizen.CreateThread(function()
        exports["rd-polytarget"]:AddCircleZone("riddlev_police_hire",  vector3(463.28, -984.29, 30.72), 0.55, {
            useZ = true
        })

        exports["rd-interact"]:AddPeekEntryByPolyTarget("riddlev_police_hire", {{
            event = "rd-police:CommandCabin",
            id = "riddlev_police_CommandCabin",
            icon = "warehouse",
            label = "High Command Cabin",
            parameters = {},
        }}, {
            distance = { radius = 1.5 },
        });

        exports["rd-interact"]:AddPeekEntryByPolyTarget("riddlev_police_hire", {{
            event = "rd-police:hire",
            id = "riddlev_police_hire",
            icon = "id-badge",
            label = "Hire Personel!",
            parameters = {},
        }}, {
            distance = { radius = 1.5 },
        });

        exports["rd-interact"]:AddPeekEntryByPolyTarget("riddlev_police_hire", {{
            event = "rd-police:purchaseVehicle",
            id = "riddlev_police_Car",
            icon = "car",
            label = "Purchase Vehicle",
            parameters = {},
        }}, {
            distance = { radius = 1.5 },
        });

        exports["rd-interact"]:AddPeekEntryByPolyTarget("riddlev_police_hire", {{
            event = "rd-police:getbadge",
            id = "riddlev_police_getbadge",
            icon = "address-book",
            label = "Create Badge",
            parameters = {},
        }}, {
            distance = { radius = 1.5 },
        });

    while true do
        Citizen.Wait(600000)
        if isJudge and exports["isPed"]:isPed("myjob") == "judge" then
            TriggerServerEvent("server:givepayJob", "Judge Payment", 100)
        end

        if isDoctor and exports["isPed"]:isPed("myjob") == "doctor" then
            TriggerServerEvent("server:givepayJob", "Doctor Payment", 150)
        end

        if isTher and exports["isPed"]:isPed("myjob") == "therapist" then
            TriggerServerEvent("server:givepayJob", "Therapist Payment", 125)
        end
    end
end)

function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle
    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z,
                                        coordTo.x, coordTo.y,
                                        coordTo.z + offset, 10, PlayerPedId(), 0)
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        offset = offset - 1
        if vehicle ~= 0 then break end
    end
    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
    if distance > 25 then vehicle = nil end
    return vehicle ~= nil and vehicle or 0
end

RegisterNetEvent('clientcheckLicensePlate')
AddEventHandler('clientcheckLicensePlate', function()
    if isCop then
        playerped = PlayerPedId()
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        targetspeed = GetEntitySpeed(targetVehicle) * 3.6
        herSpeedMph = GetEntitySpeed(targetVehicle) * 2.236936
        licensePlate = GetVehicleNumberPlateText(targetVehicle)
        local vehicleClass = GetVehicleClass(targetVehicle)

        if licensePlate == nil then

            TriggerEvent("DoLongHudText", 'Can not target vehicle', 2)

        else
            TriggerServerEvent('checkLicensePlate', licensePlate)
        end
    end
end)

-- Hire --

RegisterNetEvent('rd-police:hireNewPerson')
AddEventHandler('rd-police:hireNewPerson', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-police:hireNewPersonel',
        key = 1,
        items = {
          {
            icon = "id-card",
            label = "CID",
            name = "cid",
          },
          {
            icon = "clipboard",
            label = "Callsign",
            name = "callsign",
          },
          {
            _type = "select",
            options = {
              {
                id = 1,
                name = "Cadet",
              },
              {
                id = 2,
                name = "Officer",
              },
              {
                id = 3,
                name = "Senior Officer",
              },
              {
                id = 4,
                name = "Corporal",
              },
              {
                id = 5,
                name = "Sergeant",
              },
              {
                id = 6,
                name = "Lieutenant",
              },
              {
                id = 7,
                name = "Captain",
              },
              {
                id = 8,
                name = "Assistant Chief",
              },
              {
                id = 9,
                name = "Chief Of Police",
              },
            },
            label = "Rank",
            name = "rank",
          },
          {
            _type = "select",
            options = {
              {
                id = 1,
                name = "Los Santos Police Department",
              },
              {
                id = 2,
                name = "Blaine County Sheriffs Office",
              },
              {
                id = 3,
                name = "San Andreas State Police",
              },
            },
            label = "Department",
            name = "department",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-police:hireNewPersonel', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local dept = data.values.department

    if dept == 1 then
        TriggerServerEvent('rd-rd-police:hire_pd', data.values.cid, data.values.rank, data.values.callsign, 'police')
    elseif dept == 2 then
        TriggerServerEvent('rd-rd-police:hire_pd', data.values.cid, data.values.rank, data.values.callsign, 'sheriff')
    elseif dept == 3 then
        TriggerServerEvent('rd-rd-police:hire_pd', data.values.cid, data.values.rank, data.values.callsign, 'state')
    end
end)

-- Polyzone --

RegisterNetEvent('rd-police:hire')
AddEventHandler('rd-police:hire', function()
    TriggerServerEvent('rd-rd-police:sv:open_hire_menu')
end)

RegisterCommand('runplatet', function(source, args)
    if isCop then
        TriggerEvent('clientcheckLicensePlate')
    end
end)

RegisterCommand('runplate', function(source, args)
    if isCop then
        TriggerServerEvent('checkLicensePlate', args[1])
    end
end)

RegisterCommand('911', function(source, args)
    TriggerServerEvent('911', args, GetStreetAndZone())
end)

RegisterCommand("911a", function(src, args)
    TriggerServerEvent("911a", args)
end)

RegisterCommand('911r', function(source, args)
    TriggerServerEvent('911r', args)
end)

RegisterCommand('311', function(source, args)
    TriggerServerEvent('311', args)
end)

RegisterCommand('311r', function(source, args)
    TriggerServerEvent('311r', args)
end)

RegisterNetEvent('callsound')
AddEventHandler('callsound', function()
    PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
end)

function GetStreetAndZone()
    local plyPos = GetEntityCoords(PlayerPedId(), true)
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(),
        Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    zone = tostring(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
    local playerStreetsLocation = GetLabelText(zone)
    local street = street1 .. ", " .. playerStreetsLocation
    return street
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players + 1] = i
        end
    end

    return players
end

inanimation = false
RegisterNetEvent('animation:phonecall')
AddEventHandler('animation:phonecall', function()
    inanimation = true
    if not handCuffed then

        local lPed = PlayerPedId()

        RequestAnimDict("random@arrests")
        while not HasAnimDictLoaded("random@arrests") do
            Citizen.Wait(0)
        end

        if IsEntityPlayingAnim(lPed, "random@arrests", "idle_c", 3) then
            ClearPedSecondaryTask(lPed)

        else
            TaskPlayAnim(lPed, "random@arrests", "idle_c", 8.0, -8, -1, 49, 0, 0, 0, 0)
            seccount = 10
            while seccount > 0 do
                Citizen.Wait(1000)
                seccount = seccount - 1

            end
            ClearPedSecondaryTask(lPed)
        end
    else
        ClearPedSecondaryTask(lPed)
    end
    inanimation = false
end)

RegisterNetEvent('police:jailing')
AddEventHandler('police:jailing', function(args)
    Citizen.Trace("Jailing in process.")
    TriggerServerEvent('rd-police:jailGranted', args)
    TriggerServerEvent('updateJailTime', tonumber(args[2]))
    TriggerServerEvent('rd-jail:pJailedLog', tonumber(args[2]), tonumber(args[1]))
end)

RegisterNetEvent('rd-police:payFines')
AddEventHandler('rd-police:payFines', function(amount)
    TriggerServerEvent('bank:withdrawAmende', amount)

    TriggerEvent('chatMessage', "BILL ", {255, 140, 0}, "You were billed for ^2" .. tonumber(amount) .. " ^0dollar(s).")

end)

intrunk = false
local frontTrunk = {

}

local disabledTrunk = {
    [1] = "penetrator",
    [2] = "vacca",
    [3] = "monroe",
    [4] = "turismor",
    [5] = "osiris",
    [6] = "comet",
    [7] = "ardent",
    [8] = "jester",
    [9] = "nero",
    [10] = "nero2",
    [11] = "vagner",
    [12] = "infernus",
    [13] = "zentorno",
    [14] = "comet2",
    [15] = "comet3",
    [16] = "comet4",
    [17] = "lp700r",
    [18] = "r8ppi",
    [19] = "911turbos",
    [20] = "rx7rb",
    [21] = "fnfrx7",
    [22] = "delsoleg",
    [23] = "s15rb",
    [24] = "gtr",
    [25] = "fnf4r34",
    [26] = "ap2",
    [27] = "bullet",
}

local trunkOffsets = {
  [`taxi`] = { y = 0.0, z = -0.5 },
  [`buccaneer`] = { y = 0.5, z = 0.0 },
  [`peyote`] = { y = 0.35, z = -0.15 },
  [`regina`] = { y = 0.2, z = -0.35 },
  [`pigalle`] = { y = 0.2, z = -0.15 },
  [`glendale`] = { y = 0.0, z = -0.35 },
}

local cam = 0
function CamTrunk()
    if(not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
        SetCamRot(cam, 0.0, 0.0, 0.0)
        SetCamActive(cam,  true)
        RenderScriptCams(true,  false,  0,  true,  true)
        SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
    end
  --  local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,-2.5,1.0))
    AttachCamToEntity(cam, PlayerPedId(), 0.0,-2.5,1.0, true)
 --   SetCamCoord(cam, x, y, z)
    SetCamRot(cam, -30.0, 0.0, GetEntityHeading(PlayerPedId()) )
end

function CamDisable()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
end

function disabledCarCheck(veh)
    for i=1,#disabledTrunk do
        if GetEntityModel(veh) == GetHashKey(disabledTrunk[i]) then
            return true
        end
    end
    return false
end

function frontTrunkCheck(veh)
    for i=1,#frontTrunk do
        if GetEntityModel(veh) == GetHashKey(frontTrunk[i]) then
            return true
        end
    end
    return false
end

local TrunkedPlate = 0
local trunkveh = 0
function PutInTrunk(veh)
    local disabledCar = disabledCarCheck(veh)
    if disabledCar then
        return
    end
    if not DoesVehicleHaveDoor(veh, 6) and DoesVehicleHaveDoor(veh, 5) and IsThisModelACar(GetEntityModel(veh)) then
    	SetVehicleDoorOpen(veh, 5, 1, 1)
        local Player = PlayerPedId()

        local d1, d2 = GetModelDimensions(GetEntityModel(veh))

        local trunkZ = d2["z"]
        if trunkZ > 1.4 then
          trunkZ =  1.4 - (d2.z -  1.4)
        end

        TrunkedPlate = GetVehicleNumberPlateText(veh)
        intrunk = true
        TriggerEvent("ped:intrunk",intrunk)
        local testdic = "mp_common_miss"
        local testanim = "dead_ped_idle"
        RequestAnimDict(testdic)
        while not HasAnimDictLoaded(testdic) do
            Citizen.Wait(0)
        end

        SetBlockingOfNonTemporaryEvents(Player, true)
        SetPedSeeingRange(Player, 0.0)
        SetPedHearingRange(Player, 0.0)
        SetPedFleeAttributes(Player, 0, false)
        SetPedKeepTask(Player, true)
        DetachEntity(Player)
        ClearPedTasks(Player)
        TaskPlayAnim(Player, testdic, testanim, 8.0, 8.0, -1, 2, 999.0, 0, 0, 0)
        local vehicleName = GetEntityModel(veh)
        local vehicleTrunkOffset = trunkOffsets[vehicleName] or { y = 0.0, z = 0.0 }

        AttachEntityToEntity(Player, veh, 0, -0.1, (d1["y"] + 0.85) + vehicleTrunkOffset.y, ( trunkZ - 0.87) + vehicleTrunkOffset.z, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
        trunkveh = veh

        while intrunk do

            HandCuffed = exports["isPed"]:isPed("HandCuffed")
            CamTrunk()
            if HandCuffed then
                Citizen.Wait(1)
            else

                Citizen.Wait(1)
                local DropPosition = GetOffsetFromEntityInWorldCoords(veh, 0.0,d1["y"]-0.2,0.0)

                --DrawText3DTest(DropPosition["x"],DropPosition["y"],DropPosition["z"],"[G] Open/Close | [F] Climb Out")

                if IsControlJustReleased(0,47) then

                    if GetVehicleDoorAngleRatio(veh, 5) > 0.0 then
                        SetVehicleDoorShut(veh, 5, 1, 0)
                    else
                        SetVehicleDoorOpen(veh, 5, 1, 0)
                    end

                end
                if IsControlJustReleased(0,23) then
                    TriggerEvent("ped:intrunk",false)
                end
            end

            intrunk = exports["isPed"]:isPed("intrunk")
			if GetVehicleEngineHealth(veh) < 100.0 or not DoesEntityExist(veh) then
		        TriggerEvent("ped:intrunk",false)
		        SetVehicleDoorOpen(trunkveh, 5, 1, 1)
		        trunkveh = 0
		        TrunkedPlate = 0
			end

			if not IsEntityPlayingAnim(Player, testdic, testanim, 3) then
				TaskPlayAnim(Player, testdic, testanim, 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			end

        end
        DoScreenFadeOut(10)
        Citizen.Wait(1000)
        CamDisable()

        DetachEntity(Player)

        if DoesEntityExist(veh) then
        	local DropPosition = GetOffsetFromEntityInWorldCoords(veh, 0.0,d1["y"]-0.5,0.0)
	        SetEntityCoords(Player,DropPosition["x"],DropPosition["y"],DropPosition["z"])
	    end
        DoScreenFadeIn(2000)
    end
end
RegisterNetEvent('vehicle:getInTrunk')
AddEventHandler('vehicle:getInTrunk', function(pArgs, pEntity)

    local lockStatus = GetVehicleDoorLockStatus(pEntity)
    local hasTrunk = DoesVehicleHaveDoor(pEntity, 5)

    if lockStatus ~= 1 and lockStatus ~= 0 then
        TriggerEvent("DoLongHudText","The vehicle is locked!",2)
        return
    elseif not hasTrunk then
        TriggerEvent("DoLongHudText","Vehicle does not have a trunk!",2)
        return
    elseif GetVehicleDoorAngleRatio(pEntity, 5) == 0.0 then
        TriggerEvent("DoLongHudText","The trunk is closed!",2)
        return
    end

  PutInTrunk(pEntity)
end)

RegisterNetEvent('ped:forceTrunk')
AddEventHandler('ped:forceTrunk', function()
	t, distance = GetClosestPlayer()
	if (distance ~= -1 and distance < 7) then
		playerped = PlayerPedId()
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 10.0, 0.0)
        v = getVehicleInDirection(coordA, coordB, true)
        if DoesEntityExist(v) then

            local Player = PlayerPedId()
            local d1,d2 = GetModelDimensions(GetEntityModel(v))
            local back = GetOffsetFromEntityInWorldCoords(v, 0.0,d1["y"]-0.5,0.0)
            if #(back - GetEntityCoords(Player))> 1.0 then
                TriggerEvent("DoLongHudText","You must be near the trunk to do this!",2)
                return
            end
            local Driver = GetPedInVehicleSeat(v, -1)
            if DoesEntityExist(Driver) and not IsPedAPlayer(Driver) then
                TriggerEvent("DoLongHudText","The vehicle is locked!",2)
                return
            end
            local lockStatus = GetVehicleDoorLockStatus(v)
            if lockStatus ~= 1 and lockStatus ~= 0 then
                TriggerEvent("DoLongHudText","The vehicle is locked!",2)
                return
            end
            if GetVehicleDoorAngleRatio(v, 5) == 0.0 then
                TriggerEvent("DoLongHudText","The trunk is closed?!",2)
                return
            end


			--SetEntityAsMissionEntity(v,false,true)
			local netid = NetworkGetNetworkIdFromEntity(v)
			TriggerServerEvent("ped:forceTrunkAsk", GetPlayerServerId(t), netid)
		else
			TriggerEvent("DoLongHudText", "Face the vehicle from the trunk!",2)
		end
	else
		TriggerEvent("DoLongHudText", "No player near you (maybe get closer)!",2)
	end
end)

RegisterNetEvent('ped:forcedEnteringVeh')
AddEventHandler('ped:forcedEnteringVeh', function(sender)
	local vehicleHandle = NetworkGetEntityFromNetworkId(sender)
    if vehicleHandle ~= nil then
      	PutInTrunk(vehicleHandle)
    end
end)

RegisterNetEvent('ped:releaseTrunkCheck')
AddEventHandler('ped:releaseTrunkCheck', function()

    playerped = PlayerPedId()


    local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)

    local curplate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))

    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    targetVehicle = getVehicleInDirection(coordA, coordB, true)
    if not isInVeh and GetVehicleDoorAngleRatio(targetVehicle, 5) > 0.0 then

        curplate = GetVehicleNumberPlateText(targetVehicle, false)
    else
        TriggerEvent("DoLongHudText","No vehicle found or trunk is closed",2)
        return
    end

    if curplate then
        TriggerServerEvent("ped:trunkAccepted",curplate)
    end

end)

RegisterNetEvent('ped:releaseTrunkCheckSelf')
AddEventHandler('ped:releaseTrunkCheckSelf', function()
	local HandCuffed = exports["isPed"]:isPed("HandCuffed")
	local dead = exports["isPed"]:isPed("dead")
	local intrunk = exports["isPed"]:isPed("intrunk")
    if not HandCuffed and not dead and intrunk then
	    TriggerServerEvent("ped:trunkAccepted",TrunkedPlate)
	end
end)

RegisterNetEvent('ped:releaseTrunk')
AddEventHandler('ped:releaseTrunk', function(licensePlate)
    if licensePlate == TrunkedPlate then
        TriggerEvent("ped:intrunk",false)
        SetVehicleDoorOpen(trunkveh, 5, 1, 1)
        trunkveh = 0
        TrunkedPlate = 0
    end
end)

RegisterNetEvent('police:tenThirteenA')
AddEventHandler('police:tenThirteenA', function()
    exports["rd-dispatch"]:policedead('10-13A', "Officer Down URGENT", "630", true)
end)

RegisterNetEvent('police:tenThirteenB')
AddEventHandler('police:tenThirteenB', function()
    exports["rd-dispatch"]:policedead('10-13B', "Officer Down", "630", false)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', '10-1314', 0.2)
end)

RegisterNetEvent("police:tenForteenA")
AddEventHandler("police:tenForteenA", function()
    exports["rd-dispatch"]:policedead('10-14A', "Medic Down URGENT", "630", true)
end)

RegisterNetEvent("police:tenForteenB")
AddEventHandler("police:tenForteenB", function()
    local pos = GetEntityCoords(PlayerPedId(), true)
    exports["rd-dispatch"]:policedead('10-14B', "Medic Down", "630", false)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', '10-1314', 0.2)
end)

RegisterNetEvent('binoculars:Activate')
AddEventHandler('binoculars:Activate', function()
	TriggerEvent("binoculars:Activate2")
end)

RegisterNetEvent('camera:Activate')
AddEventHandler('camera:Activate', function()
	TriggerEvent("camera:Activate2")
end)