boatsInfo = {}
boatsModel = {}
boatsCoords = {}
boatsHeading = {}
getVehicleKey = {}
getVehicle = {}

RegisterNetEvent("boats:purchaseVehicle")
AddEventHandler("boats:purchaseVehicle", function(d)
  boatsInfo = d
end)

RegisterNetEvent("rd:vehicles:boatspawn")
AddEventHandler("rd:vehicles:boatspawn", function(model, coords, heading)
  boatsModel = model
  boatsCoords = coords
  boatsHeading = heading
end)

RegisterNetEvent("boats:getVehicleKey")
AddEventHandler("boats:getVehicleKey", function(vin, carModel)
  getVehicleKey = vin
  getVehicle = carModel
end)

STR.register("boats:purchaseVehicle", function(pSource)
  local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
  local success = false
  if user:getCash() >= boatsInfo.retail_price then
    user:removeMoney(boatsInfo.retail_price)
    success = true
  else
    success = false
  end
  return success
end)

STR.register("rd:vehicles:boatspawn", function(pSource)
  local target = pSource
  local vehicle = boatsModel
  local coords = boatsCoords
  local heading = boatsHeading
  local mathRandom = math.random(15000, 99990)
  local vin = 'RN '.. mathRandom .. ' STR ' .. mathRandom ..''
  local addMods = nil
  local user = exports["rd-base"]:getModule("Player"):GetUser(target)
  local info = user:getCurrentCharacter()
  local vehicleSpawn = exports["rd-vehicles"]:GenerateVehicleInfo(target, info.id, vehicle, "pd", "pd", nil, boatsInfo.name)
  TriggerEvent("rd:vehicles:InsertVehicleData", target, vehicleSpawn)
  exports["rd-vehicles"]:BasicSpawn(target, vehicle, coords, heading, 'menu', nil, vin, addMods)
  return vehicleSpawn
end)

STR.register("boats:getVehicleKey", function(pSource)
  local src = source
  TriggerClientEvent("vehicle:keys:addNew", source, getVehicle, getVehicleKey)
  print(getVehicleKey)
  return
end)
