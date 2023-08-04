rentalsInfo = {}
rentalsModel = {}
rentalsCoords = {}
rentalsHeading = {}
getVehicleKey = {}
getVehicle = {}

RegisterNetEvent("rentals:purchaseVehicle")
AddEventHandler("rentals:purchaseVehicle", function(d)
  rentalsInfo = d
end)

RegisterNetEvent("rd:vehicles:rentalSpawn")
AddEventHandler("rd:vehicles:rentalSpawn", function(model, coords, heading)
  rentalsModel = model
  rentalsCoords = coords
  rentalsHeading = heading
  print(rentalsCoords, rentalsHeading)
end)

RegisterNetEvent("rentals:getVehicleKey")
AddEventHandler("rentals:getVehicleKey", function(vin, carModel)
  getVehicleKey = vin
  getVehicle = carModel
end)

STR.register("rentals:purchaseVehicle", function(pSource)
  local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
  local success = false
  if user:getCash() >= rentalsInfo.price then
    user:removeMoney(rentalsInfo.price)
    success = true
  else
    success = false
  end
  return success
end)

STR.register("rd:vehicles:rentalSpawn", function(pSource)
  local target = pSource
  local vehicle = rentalsModel
  local coords = rentalsCoords
  local heading = rentalsHeading
  local mathRandom = math.random(15000, 99990)
  local vin = 'RN '.. mathRandom .. ' STR ' .. mathRandom ..''
  local addMods = nil
  print(coords, heading)
  local vehicleSpawn = exports["rd-vehicles"]:BasicSpawn(target, vehicle, coords, heading, 'menu', nil, vin, addMods)
  return vehicleSpawn
end)

STR.register("rentals:getVehicleKey", function(pSource)
  local src = source
  TriggerClientEvent("vehicle:keys:addNew", source, getVehicle, getVehicleKey)
  print(getVehicleKey)
  return
end)
