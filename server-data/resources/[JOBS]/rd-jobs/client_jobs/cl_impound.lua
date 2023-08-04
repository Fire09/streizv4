local pPlate = nil

RegisterCommand("impound", function()
  TriggerEvent("rd-jobs:impound")
end)

local listening = false

Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("impound_view", vector3(-191.8961, -1161.739, 23.679), 1.5, 2, {
      name="impound_view",
      heading=90,
      debugPoly=false,
      minZ=21.03,
      maxZ=24.03
  })
end)

AddEventHandler("rd-polyzone:enter", function(zone)
  if zone ~= "impound_view" then return end
 -- if not IsPedSittingInAnyVehicle(PlayerPedId()) then return end

  exports["rd-ui"]:showInteraction("[E] View Impound Vehicles")
  listenForKeypress()
end)

AddEventHandler("rd-polyzone:exit", function(zone)
  if zone ~= "impound_view" then return end

  exports["rd-ui"]:hideInteraction()
  listening = false
end)

function listenForKeypress()
  listening = true

  Citizen.CreateThread(function()
      while listening do
        if IsControlJustReleased(0, 38) then
            TriggerEvent("rd-jobs:impound")
            exports["rd-ui"]:hideInteraction()
          end
          Wait(0)
      end
  end)
end

RegisterNetEvent('rd-jobs:impound')
AddEventHandler('rd-jobs:impound', function()
    local ImpoundMenu = {
		{
      title = "Release Vehicle",
      description = "Release a vehicle from the impound lot",
      key = "ReleaseVehicle",
      children = {
          {
            title = "Browse by Plate",
            description = "Release a vehicle from impound by plate",
            action = "rd-jobs:browse_plate",
          },
        },
      }
    }
    exports["rd-ui"]:showContextMenu(ImpoundMenu)
end)

RegisterUICallback('rd-jobs:browse_plate', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:pPlateBrowse',
        key = 1,
        items = {
          {
            icon = "car",
            label = "Vehicle Plate.",
            name = "pVehPlate",
          },
        },
      show = true,
    })
end)

RegisterUICallback('rd-jobs:pPlateBrowse', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  pPlate = data.values.pVehPlate
  
  TriggerServerEvent('rd-impound:select_plate', pPlate)
end)

RegisterNetEvent('rd-impound:show_car')
AddEventHandler('rd-impound:show_car', function(pVehicleModel, pVehiclePlate, pState)
    local pVehicle = {
		  {
        title = "Vehicle Model: "..pVehicleModel,
        description = "Vehicle Plate: "..pVehiclePlate,
      },
      {
        title = "Release Vehicle",
        disabled = pState,
        action= "rd-jobs:release_vehicle",
      }
    }
    exports["rd-ui"]:showContextMenu(pVehicle)
end)

RegisterUICallback('rd-jobs:release_vehicle', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  print(pPlate)
  TriggerServerEvent('rd-impound:release_car', pPlate)
end)