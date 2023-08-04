local trailer = nil

Citizen.CreateThread(function()
  local entry = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "miscscripts_vehicletrailer_set",
            label = "Set Trailer",
            icon = "circle",
            event = "rd-miscscripts:vehicletrailer:set",
            parameters = {},
        },
				{
					id = "miscscripts_vehicletrailer_open",
					label = "Open Trailer",
					icon = "circle",
					event = "rd-miscscripts:vehicletrailer:openDoor",
					parameters = {},
				},
				{
					id = "miscscripts_vehicletrailer_close",
					label = "Close Trailer",
					icon = "circle",
					event = "rd-miscscripts:vehicletrailer:closeDoor",
					parameters = {},
				},
				{
					id = "miscscripts_vehicletrailer_lower_ramp",
					label = "Lower Top Ramp",
					icon = "circle",
					event = "rd-miscscripts:vehicletrailer:lowerTop",
					parameters = {},
				},
				{
					id = "miscscripts_vehicletrailer_up_ramp",
					label = "Reset Top Ramp",
					icon = "circle",
					event = "rd-miscscripts:vehicletrailer:toggleTop",
					parameters = {},
				}
    },
    options = {
        distance = { radius = 5.5 },
        isEnabled = function(pEntity)
          local ValidModel = {
            [`tr2`] = true,
            [`cargoplane`] = true,
          }

          local model = GetEntityModel(pEntity)

          return ValidModel[model]
        end,
    }
  }
  exports["rd-interact"]:AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
end)


local topDown = false
RegisterCommand("toggletop", function()

	if topDown then
		Sync.SetVehicleDoorShut(trailer, 4, false, false)
		topDown = false
	else
		topDown = true
		Sync.SetVehicleDoorOpen(trailer, 4, false, false)
	end

end, false)

RegisterCommand("setcar", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

	local targetCoords = GetEntityCoords(vehicle, false)
	local offset = GetOffsetFromEntityGivenWorldCoords(trailer, targetCoords.x, targetCoords.y, targetCoords.z)
	local entityRotation = GetEntityRotation(vehicle, 2)
	print(entityRotation)
	AttachEntityToEntity(vehicle, trailer, 0.0, offset.x, offset.y, offset.z, entityRotation.x, entityRotation.y, 0.0, false, false, true, false, 0, true)
end, false)

RegisterCommand("unsetcar", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

	DetachEntity(vehicle, true, true)
end, false)

RegisterNetEvent("rd-miscscripts:vehicletrailer:set")
AddEventHandler("rd-miscscripts:vehicletrailer:set", function(pContext, pEntity)
	trailer = pEntity
	TriggerEvent("DoLongHudText", "Successfully set trailer", 1, 12000, { i18n = { "Successfully set trailer" } })
end)

RegisterNetEvent("rd-miscscripts:vehicletrailer:openDoor")
AddEventHandler("rd-miscscripts:vehicletrailer:openDoor", function(pContext, pEntity)
	Sync.SetVehicleDoorOpen(pEntity, 5, false, false)
	TriggerEvent("DoLongHudText", "Successfully opened trailer", 1, 12000, { i18n = { "Successfully opened trailer" } })
end)

RegisterNetEvent("rd-miscscripts:vehicletrailer:closeDoor")
AddEventHandler("rd-miscscripts:vehicletrailer:closeDoor", function(pContext, pEntity)
	Sync.SetVehicleDoorShut(pEntity, 5, true, true)
	TriggerEvent("DoLongHudText", "Successfully closed trailer", 1, 12000, { i18n = { "Successfully closed trailer" } })
end)

RegisterNetEvent("rd-miscscripts:vehicletrailer:toggleTop")
AddEventHandler("rd-miscscripts:vehicletrailer:toggleTop", function(pContext, pEntity)
	Sync.SetVehicleDoorShut(pEntity, 4, 0, 1)
end)

RegisterNetEvent("rd-miscscripts:vehicletrailer:lowerTop")
AddEventHandler("rd-miscscripts:vehicletrailer:lowerTop", function(pContext, pEntity)
	Sync.SetVehicleDoorOpen(pEntity, 4, 0, 1)
end)

function isVehicleDoorOpen(pEntity, pDoor)
	return GetVehicleDoorAngleRatio(pEntity, pDoor) >= 0.1
end
