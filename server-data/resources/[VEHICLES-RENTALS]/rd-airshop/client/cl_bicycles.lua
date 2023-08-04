local airList = {
  { name = "Luxor Deluxe", model = "luxor", retail_price = 5000000 },
  { name = "Dodo", model = "dodo", retail_price = 5000 },
  { name = "Micro Light", model = "microlight", retail_price = 2500 },
  { name = "Blimp", model = "blimp", retail_price = 50000 },
  { name = "Cuban", model = "cuban", retail_price = 5000 },
  { name = "Duster", model = "duster", retail_price = 3000 },
  { name = "Mammatus", model = "mammatus", retail_price = 5000 },
  { name = "Stunt", model = "stunt", retail_price = 4000 },
  { name = "Shamal", model = "shamal", retail_price = 7500 },
  { name = "Velum", model = "velum", retail_price = 6500 },
  { name = "Vestra", model = "vestra", retail_price = 6500 },
  { name = "Alpha Z1", model = "alphaz1", retail_price = 10000 },
}

local function showairMenu()
  local airShop = getClosestairShop()
  if airShop == nil then return end

  local data = { {title = "Current Available air", icon = "exclamation-circle" } }
  for _, vehicle in pairs(airList) do
    data[#data + 1] = {
      title = vehicle.name,
      description = "$" .. vehicle.retail_price .. ".00",
      -- image = vehicle.image,
      key = vehicle.model,
      children = {
          { title = _L("air-confirm-purchase", "Confirm Purchase"), icon = "check-circle", action = "rd-ui:airPurchase", key = vehicle.model },
          { title = _L("air-confirm-purchase", "Cancel Purchase"), icon = "times-circle", action = "rd-ui:aircancelPurchase", key = nil },
      },
    }
  end
  exports["rd-ui"]:showContextMenu(data)
end

local airLocations = {
  ["airShop"] = { name = "Vespucci air", coords = vector3(-1650.593, -3139.275, 13.99), heading = 330.003 }
}

function getClosestairShop()
  local shop = nil
  local minDist = 75.0

  for k, v in pairs(airLocations) do
    local dist = #(GetEntityCoords(PlayerPedId()) - v.coords)
    if dist <= minDist then
      shop = v
    end
  end

  return shop
end

RegisterUICallback("rd-ui:airPurchase", function(data, cb)
  local airShop = getClosestairShop()
  if airShop == nil then return end
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local finished = exports["rd-taskbar"]:taskBar(15000, "Purchasing...", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end

  if IsAnyVehicleNearPoint(airShop.coords.x, airShop.coords.y, airShop.coords.z, 3.0) then
    TriggerEvent("DoLHudText", 2, "air-delivering-text", "Vehicle in the way.")
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    return
  end
  local d = nil
  for _, v in pairs(airList) do
    if d == nil and v.model == data.key then
      d = v
    end
  end
  d.character = data.character
  TriggerServerEvent("air:purchaseVehicle", d)
  local success, message = STR.execute("air:purchaseVehicle", d)
  if not success then
      cb({ data = {}, meta = { ok = success, message = message } })
      return
  end
  local model = data.key
  -- DoScreenFadeOut(200)

  local coords = { 
    x = airShop.coords.x, 
    y = airShop.coords.y, 
    z = airShop.coords.z
  }
  TriggerServerEvent("rd:vehicles:airpawn", model, coords, airShop.heading)
  local rentalInfo = STR.execute("rd:vehicles:airpawn", model, coords, airShop.heading)

  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

RegisterUICallback("rd-ui:aircancelPurchase", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

RegisterNetEvent("rd-npcs:ped:vehiclekeeper")
AddEventHandler("rd-npcs:ped:vehiclekeeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  if GetHashKey("npc_air_shop") == DecorGetInt(pEntity, "NPC_ID") then
    showairMenu()
  end
end)

