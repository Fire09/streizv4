RegisterNetEvent('rd-drifting:openDriftRentalMenu')
AddEventHandler('rd-drifting:openDriftRentalMenu', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("drift_school")
    if isEmployed then
        local DriftVehicles = {
            {
                title = "Current Available Drift Rentals",
                icon = 'info-circle',
            },
            {
                title = "Drift Tampa",
                description = "$5,500.00",
                children ={
                    {
                        title = "Confirm Purchase",
                        icon = 'check-square',
                        action = "rd-drifting:RentedTampa",
                    },
                    {
                        title = "Cancel Purchase",
                        icon = 'window-close',
                        action = "rd-drifting:driftvehicles_nope",
                    },
                }
            },
        }
        exports["rd-ui"]:showContextMenu(DriftVehicles)
    else
        TriggerEvent("DoLongHudText", "Not a part of driftschool", 2)
    end
end)

RegisterUICallback('rd-drifting:driftvehicles_nope', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
end)


RegisterUICallback('rd-drifting:RentedTampa', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
        TriggerEvent('rd-drifting:driftcars:attemptvehiclespawn', 'tampa5', 5500)
end)

RegisterNetEvent("rd-drifting:driftcars:attemptvehiclespawn", function(vehicle,price)
    exports["rd-taskbar"]:taskBar(15000,  "Renting Drift Vehicle...")
  if IsAnyVehicleNearPoint(-120.4901, -2530.778, 5.9999604, 0.3) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-drifting:driftcars:attemptPurchase",vehicle,price)
  end 
end)

RegisterNetEvent("rd-drifting:driftcars:attemptvehiclespawnfail", function()
    TriggerEvent("DoLongHudText", "Not enough money!", 2)
end)

RegisterNetEvent("rd-drifting:driftcars:vehiclespawn", function(data, cb)

  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local DriftRentalVehicle = CreateVehicle(model,vector4(-119.4757, -2531.548, 5.289267, 237.4559), true, false)

  Citizen.Wait(100)

  SetEntityAsMissionEntity(DriftRentalVehicle, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(DriftRentalVehicle)

 -- TaskWarpPedIntoVehicle(PlayerPedId(), DriftRentalVehicle, -1)
  SetVehicleNumberPlateText(DriftRentalVehicle, "Drifter"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(DriftRentalVehicle)
  TriggerEvent("vehicle:keys:addNew",DriftRentalVehicle,plate)

  local plateText = GetVehicleNumberPlateText(DriftRentalVehicle)
  local vehname = GetDisplayNameFromVehicleModel(model)
  
  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(DriftRentalVehicle) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end

end)

AddEventHandler("rd-drifting:getdriftanglekit", function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("drift_school")
    if isEmployed then
        TriggerEvent("player:receiveItem", "driftanglekit", 1)
    else
        TriggerEvent("DoLongHudText", "Not a part of driftschool", 2)
    end
end)
