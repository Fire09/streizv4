local vehicleList = {
  { name = "Bison", model = "bison", price = 150 },
  { name = "Futo", model = "futo", price = 200 },
  { name = "Buffalo", model = "buffalo", price = 300 },
  { name = "Jackal", model = "jackal", price = 350 },
  { name = "Sultan", model = "sultan", price = 350 },
  { name = "Youga", model = "youga", price = 200 },
  { name = "Faggio", model = "faggio", price = 75 },
}

RegisterNetEvent("rd-rentals:attemptvehiclespawnfail")
AddEventHandler("rd-rentals:attemptvehiclespawnfail", function()
    TriggerEvent("DoLongHudText", "Not enough money!", 2)
end)

RegisterNetEvent("rd-rentals:vehiclespawn")
AddEventHandler("rd-rentals:vehiclespawn", function(data, cb)

  print(data)

  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local rentalVehiclenp = CreateVehicle(model, vector4(117.84,-1079.95,29.23,355.92), true, false)

  Citizen.Wait(100)

  SetEntityAsMissionEntity(rentalVehiclenp, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(rentalVehiclenp)

  --TaskWarpPedIntoVehicle(PlayerPedId(), rentalVehiclenp, -1)
  SetVehicleNumberPlateText(rentalVehiclenp, "Rental"..tostring(math.random(1000, 9999)))
  TriggerEvent("vehicle:keys:addNew",rentalVehiclenp,plate)

  local plateText = GetVehicleNumberPlateText(rentalVehiclenp)
  local player = exports["rd-base"]:getModule("LocalPlayer")
  
  local information = {
    ["Plate"] = plateText,
    ["Vehicle"] = data,
    ["Rentee"] = ""..player.character.first_name.." "..player.character.last_name,
  }
  
  TriggerEvent("player:receiveItem", "rentalpapers", 1, true, information)


  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(rentalVehiclenp) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end

end)

-- // Cars // --

RegisterNetEvent("rd-rentals:attempt_spawn_bison")
AddEventHandler("rd-rentals:attempt_spawn_bison", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'bison'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attempt_spawn_futo")
AddEventHandler("rd-rentals:attempt_spawn_futo", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'futo'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attempt_spawn_buffalo")
AddEventHandler("rd-rentals:attempt_spawn_buffalo", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'buffalo'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attempt_spawn_jackal")
AddEventHandler("rd-rentals:attempt_spawn_jackal", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'jackal'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attempt_spawn_sultan")
AddEventHandler("rd-rentals:attempt_spawn_sultan", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'sultan'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attempt_spawn_youga")
AddEventHandler("rd-rentals:attempt_spawn_youga", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'youga'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attempt_spawn_faggio")
AddEventHandler("rd-rentals:attempt_spawn_faggio", function(data)
  local finished = exports["rd-taskbar"]:taskBar(10000, "Renting", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end
  local vehicle = 'faggio'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase",vehicle)
  end 
end)

-- // Rental Shit // --

RegisterUICallback("ui_callbacks:rent_bison", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_bison')
end)

RegisterUICallback("ui_callbacks:rent_futo", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_futo')
end)

RegisterUICallback("ui_callbacks:rent_buffalo", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_buffalo')
end)

RegisterUICallback("ui_callbacks:rent_jackal", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_jackal')
end)

RegisterUICallback("ui_callbacks:rent_sultan", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_sultan')
end)

RegisterUICallback("ui_callbacks:rent_youga", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_youga')
end)

RegisterUICallback("ui_callbacks:rent_faggio", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
		exports["rd-ui"]:hideContextMenu()
	TriggerEvent('rd-rentals:attempt_spawn_faggio')
end)

RegisterNetEvent('ui_callbacks:rentals')
AddEventHandler('ui_callbacks:rentals', function()

	local menuData = {
		{
            title = "Bison",
            description = "Rent Bison $500",
            key = "Rent.Bison",
           
			children = {
				{
					title = "Confirm Bison Rental",
					action = "ui_callbacks:rent_bison",
					key = "Rent.Bison",
          icon = "wallet"
				},
            },
        },
		{
            title = "Futo",
            description = "Rent Futo $450",
            key = "Rent.Futo",
           
			children = {
				{
					title = "Confirm Futo Rental",
					action = "ui_callbacks:rent_futo",
					key = "Rent.Futo",
          icon = "wallet"
				},
            },
        },
		{
            title = "Buffalo",
            description = "Rent Buffalo $750",
            key = "Rent.Buffalo",
           
			children = {
				{
					title = "Confirm Buffalo Rental",
					action = "ui_callbacks:rent_buffalo",
					key = "Rent.Buffalo",
          icon = "wallet"
				},
            },
        },
		{
            title = "Jackal",
            description = "Rent Jackal $625",
            key = "Rent.Jackal",
           
			children = {
				{
					title = "Confirm Jackal Rental",
					action = "ui_callbacks:rent_jackal",
					key = "Rent.Jackal",
          icon = "wallet"
				},
            },
        },
		{
            title = "Sultan",
            description = "Rent Sultan $1000",
            key = "Rent.Sultan",
           
			children = {
				{
					title = "Confirm Sultan Rental",
					action = "ui_callbacks:rent_sultan",
					key = "Rent.Sultan",
          icon = "wallet"
				},
            },
        },
		{
            title = "Youga",
            description = "Rent Youga $400",
            key = "Rent.Youga",
           
			children = {
				{
					title = "Confirm Youga Rental",
					action = "ui_callbacks:rent_youga",
					key = "Rent.Youga",
          icon = "wallet"
				},
            },
        },
		{
            title = "Faggio",
            description = "Rent Faggio $350",
            key = "Rent.Faggio",
           
			children = {
				{
					title = "Confirm Faggio Rental",
					action = "ui_callbacks:rent_faggio",
					key = "Rent.Faggio",
          icon = "wallet"
				},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)