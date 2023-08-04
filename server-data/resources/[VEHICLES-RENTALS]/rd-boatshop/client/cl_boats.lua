local boatList = {
  { name = "Jetski", model = "seashark", retail_price = 15000 },
  { name = "Suntrap", model = "suntrap", retail_price = 25000 },
  { name = "Tropic", model = "tropic", retail_price = 25000 },
  { name = "Speeder", model = "speeder", retail_price = 40000 },
  { name = "Toro", model = "toro", retail_price = 40000 },
  { name = "Squalo", model = "squalo", retail_price = 40000 },
  { name = "Jetmax", model = "jetmax", retail_price = 65000 },
  { name = "Marquis", model = "marquis", retail_price = 100000 },
  { name = "Dinghy", model = "dinghy", retail_price = 250000 },
  { name = "Tug", model = "tug", retail_price = 350000 },
  { name = "Kraken", model = "submers", retail_price = 500000 },
  { name = "Avisa", model = "avisa", retail_price = 2000000 },
}

local function showBoatMenu()
  local boatshop = getClosestboatshop()
  if boatshop == nil then return end

  local data = { {title = "Current Available boats", icon = "exclamation-circle" } }
  for _, vehicle in pairs(boatList) do
    data[#data + 1] = {
      title = vehicle.name,
      description = "$" .. vehicle.retail_price .. ".00",
      -- image = vehicle.image,
      key = vehicle.model,
      children = {
          { title = _L("boats-confirm-purchase", "Confirm Purchase"), icon = "check-circle", action = "rd-ui:boatPurchase", key = vehicle.model },
          { title = _L("boats-confirm-purchase", "Cancel Purchase"), icon = "times-circle", action = "rd-ui:boatcancelPurchase", key = nil },
      },
    }
  end
  exports["rd-ui"]:showContextMenu(data)
end

local boatLocations = {
  ["boatShop"] = { name = "Vespucci boats", coords = vector3(-873.9557, -1333.551, 0.119), heading = 112.88 }
}

function getClosestboatshop()
  local shop = nil
  local minDist = 25.0

  for k, v in pairs(boatLocations) do
    local dist = #(GetEntityCoords(PlayerPedId()) - v.coords)
    if dist <= minDist then
      shop = v
    end
  end

  return shop
end

RegisterUICallback("rd-ui:boatPurchase", function(data, cb)
  local boatshop = getClosestboatshop()
  if boatshop == nil then return end
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local finished = exports["rd-taskbar"]:taskBar(15000, "Purchasing...", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end

  if IsAnyVehicleNearPoint(boatshop.coords.x, boatshop.coords.y, boatshop.coords.z, 3.0) then
    TriggerEvent("DoLHudText", 2, "boats-delivering-text", "Vehicle in the way.")
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    return
  end
  local d = nil
  for _, v in pairs(boatList) do
    if d == nil and v.model == data.key then
      d = v
    end
  end
  d.character = data.character
  TriggerServerEvent("boats:purchaseVehicle", d)
  local success, message = STR.execute("boats:purchaseVehicle", d)
  if not success then
      cb({ data = {}, meta = { ok = success, message = message } })
      return
  end
  local model = data.key
  -- DoScreenFadeOut(200)

  local coords = { 
    x = boatshop.coords.x, 
    y = boatshop.coords.y, 
    z = boatshop.coords.z
  }
  TriggerServerEvent("rd:vehicles:boatspawn", model, coords, boatshop.heading)
  local rentalInfo = STR.execute("rd:vehicles:boatspawn", model, coords, boatshop.heading)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(rentalInfo.netId) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
  
  local veh = NetworkGetEntityFromNetworkId(rentalInfo)

  SetVehicleDirtLevel(veh, 0.0)
  RemoveDecalsFromVehicle(veh)
  local vehicleModel = veh

  if not DoesEntityExist(veh) then 
    TriggerEvent("DoLHudText", 2, "boats-vehicle-notfound", "Could not find rental vehicle.")
    cb({ data = {}, meta = { ok = true, message = "done" } })
    return 
  end
  
  exports['rd-flags']:SetVehicleFlag(veh, 'isRentalVehicle', true)
  
  local plateText = GetVehicleNumberPlateText(veh)

  DoScreenFadeOut(200)

  Citizen.Wait(200)

  TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)

  SetEntityAsMissionEntity(veh, true, true)
  SetVehicleOnGroundProperly(veh)

  DoScreenFadeIn(2000)

  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

RegisterUICallback("rd-ui:boatcancelPurchase", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

RegisterNetEvent("rd-npcs:ped:vehiclekeeper")
AddEventHandler("rd-npcs:ped:vehiclekeeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  if GetHashKey("npc_boat_shop") == DecorGetInt(pEntity, "NPC_ID") then
    showBoatMenu()
  end
end)

