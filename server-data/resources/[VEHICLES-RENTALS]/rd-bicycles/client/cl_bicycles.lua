local bicyclesList = {
  { name = "BMX 2 Seats", model = "bimx", retail_price = 90 },
  { name = "Cruiser", model = "cruiser", retail_price = 100 },
  { name = "Fixter", model = "fixter", retail_price = 100 },
  { name = "Scorcher", model = "scorcher", retail_price = 100 },
  { name = "Whippet Race Bike", model = "tribike", retail_price = 250 },
  { name = "Endurex Race Bike", model = "tribike2", retail_price = 250 },
  { name = "Tri-Cycles Race Bike", model = "tribike3", retail_price = 250 },
}

local function showbicycleMenu()
  local bicycleShop = getClosestbicycleShop()
  if bicycleShop == nil then return end

  local data = { {title = "Current Available bicycles", icon = "exclamation-circle" } }
  for _, vehicle in pairs(bicyclesList) do
    data[#data + 1] = {
      title = vehicle.name,
      description = "$" .. vehicle.retail_price .. ".00",
      -- image = vehicle.image,
      key = vehicle.model,
      children = {
          { title = _L("bicycles-confirm-purchase", "Confirm Purchase"), icon = "check-circle", action = "rd-ui:bicyclePurchase", key = vehicle.model },
          { title = _L("bicycles-confirm-purchase", "Cancel Purchase"), icon = "times-circle", action = "rd-ui:bicyclecancelPurchase", key = nil },
      },
    }
  end
  exports["rd-ui"]:showContextMenu(data)
end

local bicyclesLocations = {
  ["bicycleShop"] = { name = "Vespucci bicycles", coords = vector3(-1101.375, -1703.186, 3.7528), heading = 275.02 }
}

function getClosestbicycleShop()
  local shop = nil
  local minDist = 25.0

  for k, v in pairs(bicyclesLocations) do
    local dist = #(GetEntityCoords(PlayerPedId()) - v.coords)
    if dist <= minDist then
      shop = v
    end
  end

  return shop
end

RegisterUICallback("rd-ui:bicyclePurchase", function(data, cb)
  local bicycleShop = getClosestbicycleShop()
  if bicycleShop == nil then return end
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local finished = exports["rd-taskbar"]:taskBar(15000, "Purchasing...", false, true, false, false, nil, 2.5, PlayerPedId())
  if finished ~= 100 then return end

  if IsAnyVehicleNearPoint(bicycleShop.coords.x, bicycleShop.coords.y, bicycleShop.coords.z, 3.0) then
    TriggerEvent("DoLHudText", 2, "bicycles-delivering-text", "Vehicle in the way.")
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    return
  end
  local d = nil
  for _, v in pairs(bicyclesList) do
    if d == nil and v.model == data.key then
      d = v
    end
  end
  d.character = data.character
  TriggerServerEvent("bicycles:purchaseVehicle", d)
  local success, message = STR.execute("bicycles:purchaseVehicle", d)
  if not success then
      cb({ data = {}, meta = { ok = success, message = message } })
      return
  end
  local model = data.key
  -- DoScreenFadeOut(200)

  local coords = { 
    x = bicycleShop.coords.x, 
    y = bicycleShop.coords.y, 
    z = bicycleShop.coords.z
  }
  TriggerServerEvent("rd:vehicles:bicyclespawn", model, coords, bicycleShop.heading)
  local rentalInfo = STR.execute("rd:vehicles:bicyclespawn", model, coords, bicycleShop.heading)

  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

RegisterUICallback("rd-ui:bicyclecancelPurchase", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

RegisterNetEvent("rd-npcs:ped:vehiclekeeper")
AddEventHandler("rd-npcs:ped:vehiclekeeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  if GetHashKey("npc_bike_shop") == DecorGetInt(pEntity, "NPC_ID") then
    showbicycleMenu()
  end
end)

