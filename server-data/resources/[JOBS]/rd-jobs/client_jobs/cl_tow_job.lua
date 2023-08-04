RegisterNetEvent('rd-jobs:impound:openImpoundRequestMenu')
AddEventHandler('rd-jobs:impound:openImpoundRequestMenu', function()
	local data = {
		{
			title = "Vehicle Scuff",
			description = "Vehicle in an unrecoverable state.",
			action = 'rd-jobs:vehiclescuff',
		},
		{
			title = "Parking Violation",
			description = "Vehicle parked in an restricted or unauthorized place.",
			action = 'rd-jobs:parkingviolation',
		},
	}
	exports["rd-ui"]:showContextMenu(data)
end)

RegisterNetEvent('rd-jobs:impound:openImpoundMenu')
AddEventHandler('rd-jobs:impound:openImpoundMenu', function()
	local data = {
		{
			title = "Normal Impound",
			description = "Vehicle in an unrecoverable state.",
			action = 'rd-jobs:normalimpound',
		},
		{
			title = "Full Impound",
			description = "Vehicle parked in an restricted or unauthorized place.",
			action = 'rd-jobs:fullimpound',
		},
	}
	exports["rd-ui"]:showContextMenu(data)
end)

RegisterUICallback('rd-jobs:vehiclescuff', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('rd-jobs:vehicle:scuff')
end)

RegisterUICallback('rd-jobs:parkingviolation', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('rd-jobs:parking:violation')
end)

RegisterUICallback('rd-jobs:normalimpound', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('rd-jobs:impoundVehicle')
end)


RegisterUICallback('rd-jobs:fullimpound', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('rd-jobs:fullimpoundVehicle')
end)


function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function deleteVeh(ent)
	SetVehicleHasBeenOwnedByPlayer(ent, true)
	NetworkRequestControlOfEntity(ent)	
	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(ent))
	DeleteEntity(ent)
	DeleteVehicle(ent)
	SetEntityAsNoLongerNeeded(ent)
	TriggerEvent('DoLongHudText', 'Impound Request Accepted.', 1)
end

RegisterNetEvent('rd-jobs:vehicle:scuff')
AddEventHandler('rd-jobs:vehicle:scuff', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
   	targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	Wait(1000)
	local finished = exports["rd-taskbar"]:taskBar(10000,"Requesting Impound",false,true)
	if (finished == 100) then
	Wait(1500)
	deleteVeh(targetVehicle)
	else
	end
end)

RegisterNetEvent('rd-jobs:parking:violation')
AddEventHandler('rd-jobs:parking:violation', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
   	targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	Wait(1000)
	local finished = exports["rd-taskbar"]:taskBar(10000,"Requesting Impound",false,true)
	if (finished == 100) then
	Wait(1500)
	deleteVeh(targetVehicle)
	else
	end
end)

function deleteVehicle(ent)
	SetVehicleHasBeenOwnedByPlayer(ent, true)
	NetworkRequestControlOfEntity(ent)
	local finished = exports["rd-taskbar"]:taskBar(1000,"Impounding",false,true)	
	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(ent))
	DeleteEntity(ent)
	DeleteVehicle(ent)
	SetEntityAsNoLongerNeeded(ent)
end

RegisterNetEvent('rd-jobs:impoundVehicle')
AddEventHandler('rd-jobs:impoundVehicle', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
   	targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	TriggerServerEvent("rd-imp:NormalImpound",licensePlate)
	TriggerEvent('DoLongHudText', 'Impounded with retrieval price of $100', 1)
	deleteVehicle(targetVehicle)
end)

RegisterNetEvent('rd-jobs:fullimpoundVehicle')
AddEventHandler('rd-jobs:fullimpoundVehicle', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
   	targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	TriggerServerEvent("rd-imp:FullImpound",licensePlate)
	TriggerEvent('DoLongHudText', 'Impounded with retrieval price of $1500', 1)
	deleteVehicle(targetVehicle)
end)