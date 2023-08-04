local LastSpawnAttempt, LastRespawn, SpawnDrawing = nil, nil, false

local function getVehicleClassification(pVehicleModel)
  local vehicleClass = GetVehicleClassFromName(pVehicleModel)
  if vehicleClass == 13 then
    return "bicycle"
  elseif vehicleClass == 14 then
    return "ship"
  else
    return "car"
  end
end

RegisterNUICallback("rd-ui:getCars", function(data, cb)
  local data = RPC.execute("rd:vehicles:getPlayerVehiclesWithCoordinates")
  local playerCoords = GetEntityCoords(PlayerPedId())
  for _, car in pairs(data) do
    if car.location then

      local location = json.decode(car.location)

      local vehicleCoords = vector3(location.x, location.y, location.z)

      if car.state == 'Out' and #(vehicleCoords - playerCoords) < 5.0 then
        car.spawnable = true
        car.sellable = true
      else
        car.spawnable = true
        car.sellable = false
      end
    else
      print('ERROR GETTING THE LOCATION OF THE VEHICLE', car.garage, car.plate, car.location)
    end

    car.type = getVehicleClassification(car.model)
  end
  print(json.encode(data))
  cb({ data = data, meta = { ok = true, message = 'done' } })
end)

RegisterNUICallback("rd-ui:carActionTrack", function(data, cb)
  local vehicleCoords = json.decode(data.car.location)
  if not vehicleCoords then return end
  SetNewWaypoint(vehicleCoords.x, vehicleCoords.y)

  local plyCoords = GetEntityCoords(PlayerPedId())
  if not SpawnDrawing and #(plyCoords - vector3(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)) < 200.0 then
    SpawnDrawing = true
    SetTimeout(30000, function()
      SpawnDrawing = false
    end)
    Citizen.CreateThread(function()
      while SpawnDrawing do
        DrawMarker(36, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 0, 0, 0, 0, 0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 100, true, true, 0, false, nil, nil, false)
        Wait(0)
      end
    end)
  end

  TriggerEvent('DoLongHudText',"GPS updated.")
  cb({ data = {}, meta = { ok = true, message = '' } })
end)

RegisterNUICallback("rd-ui:carActionSpawn", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' }})

  local vehicle_plate = data.car

  local timer = GetGameTimer()

  if LastSpawnAttempt and (timer - LastSpawnAttempt) < 1000 or LastRespawn and (timer - LastRespawn) < 60000 then return end

  LastSpawnAttempt = timer

  if not canCarSpawn(vehicle_plate.plate) then return end

  local success, message = RPC.execute('rd:vehicles:respawnVehicle', vehicle_plate)

  if success then
    SpawnDrawing = false
    LastRespawn = timer

    if message then
      local veh = NetworkGetEntityFromNetworkId(message)

      --exports["rd-vehicles"]:SetVehicleAppearance(veh, vehicle_plate.appearance)
      --exports["rd-vehicles"]:SetVehicleMods(veh, vehicle_plate.mods)

      SetVehicleProps(veh, json.decode(vehicle_plate.customized))
    end

  else
    TriggerEvent('DoLongHudText', message, 2)
  end
end)

function canCarSpawn(pLicensePlate)
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    return
  end

  local DoesVehExistInProximity = nil
  DoesVehExistInProximity = CheckExistenceOfVehWithPlate(pLicensePlate)

  return not DoesVehExistInProximity
end

function CheckExistenceOfVehWithPlate(pLicensePlate)
  local playerCoords = GetEntityCoords(PlayerPedId())
  local vehicleHandle, scannedVehicle = FindFirstVehicle()
  local success
  repeat
      local pos = GetEntityCoords(scannedVehicle)
      local distance = #(playerCoords - pos)
        if distance < 50.0 then
          local targetVehiclePlate = GetVehicleNumberPlateText(scannedVehicle)
          if targetVehiclePlate == pLicensePlate then
            return true
          end
        end
      success, scannedVehicle = FindNextVehicle(vehicleHandle)
  until not success
  EndFindVehicle(vehicleHandle)
  return false
end

Citizen.CreateThread(function()
  local invehicle = false
  local plateupdate = "None"
  local vehobj = 0
  while true do
      Wait(1000)
      if not invehicle and IsPedInAnyVehicle(PlayerPedId(), false) then
        local playerPed = PlayerPedId()
        local veh = GetVehiclePedIsIn(playerPed, false)
          if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            vehobj = veh
            local checkplate = GetVehicleNumberPlateText(veh)
            invehicle = true
            plateupdate = checkplate
            local coords = GetEntityCoords(vehobj)
            local heading = GetEntityHeading(vehobj)
            RPC.execute("vehicle:coords",plateupdate,coords,heading)
          end
      end
      if invehicle and not IsPedInAnyVehicle(PlayerPedId(), false) then
        local coords = GetEntityCoords(vehobj)
        local heading = GetEntityHeading(vehobj)
        RPC.execute("vehicle:coords",plateupdate,coords,heading)
        invehicle = false
        plateupdate = "None"
        vehobj = 0
      end
  end
end)

function SetVehicleProps(veh, customized)
  SetVehicleModKit(veh, 0)
  if customized ~= nil then
          
      if customized.plate ~= nil then
          SetVehicleNumberPlateText(veh, customized.plate)
      end
  
      if customized.plateIndex ~= nil then
          SetVehicleNumberPlateTextIndex(veh, customized.plateIndex)
      end
  
      if customized.bodyHealth ~= nil then
          SetVehicleBodyHealth(veh, customized.bodyHealth + 0.0)
      end
  
      if customized.engineHealth ~= nil then
          SetVehicleEngineHealth(veh, customized.engineHealth + 0.0)
      end
  
      if customized.dirtLevel ~= nil then
          SetVehicleDirtLevel(veh, customized.dirtLevel + 0.0)
      end
  
      if customized.color1 ~= nil then
          local color1, color2 = GetVehicleColours(veh)
          SetVehicleColours(veh, customized.color1, color2)
      end
  
      if customized.color2 ~= nil then
          local color1, color2 = GetVehicleColours(veh)
          SetVehicleColours(veh, color1, customized.color2)
      end
  
      if customized.pearlescentColor ~= nil then
          local pearlescentColor, wheelColor = GetVehicleExtraColours(veh)
          SetVehicleExtraColours(veh, customized.pearlescentColor, wheelColor)
      end
  
      if customized.wheelColor ~= nil then
          local pearlescentColor, wheelColor = GetVehicleExtraColours(veh)
          SetVehicleExtraColours(veh, pearlescentColor, customized.wheelColor)
      end
  
      if customized.wheels ~= nil then
          SetVehicleWheelType(veh, customized.wheels)
      end
  
      if customized.windowTint ~= nil then
          SetVehicleWindowTint(veh, customized.windowTint)
      end
  
      if customized.neonEnabled ~= nil then
          SetVehicleNeonLightEnabled(veh, 0, customized.neonEnabled[1])
          SetVehicleNeonLightEnabled(veh, 1, customized.neonEnabled[2])
          SetVehicleNeonLightEnabled(veh, 2, customized.neonEnabled[3])
          SetVehicleNeonLightEnabled(veh, 3, customized.neonEnabled[4])
      end
  
      if customized.extras ~= nil then
          for id,enabled in pairs(customized.extras) do
              if enabled then
                  SetVehicleExtra(veh, tonumber(id), 0)
              else
                  SetVehicleExtra(veh, tonumber(id), 1)
              end
          end
      end
  
      if customized.neonColor ~= nil then
          SetVehicleNeonLightsColour(veh, customized.neonColor[1], customized.neonColor[2], customized.neonColor[3])
      end
  
      if customized.modSmokeEnabled ~= nil then
          ToggleVehicleMod(veh, 20, true)
      end
  
      if customized.tyreSmokeColor ~= nil then
          SetVehicleTyreSmokeColor(veh, customized.tyreSmokeColor[1], customized.tyreSmokeColor[2], customized.tyreSmokeColor[3])
      end
  
      if customized.modSpoilers ~= nil then
          SetVehicleMod(veh, 0, customized.modSpoilers, false)
      end
  
      if customized.modFrontBumper ~= nil then
          SetVehicleMod(veh, 1, customized.modFrontBumper, false)
      end
  
      if customized.modRearBumper ~= nil then
          SetVehicleMod(veh, 2, customized.modRearBumper, false)
      end
  
      if customized.modSideSkirt ~= nil then
          SetVehicleMod(veh, 3, customized.modSideSkirt, false)
      end
  
      if customized.modExhaust ~= nil then
          SetVehicleMod(veh, 4, customized.modExhaust, false)
      end
  
      if customized.modFrame ~= nil then
          SetVehicleMod(veh, 5, customized.modFrame, false)
      end
  
      if customized.modGrille ~= nil then
          SetVehicleMod(veh, 6, customized.modGrille, false)
      end
  
      if customized.modHood ~= nil then
          SetVehicleMod(veh, 7, customized.modHood, false)
      end
  
      if customized.modFender ~= nil then
          SetVehicleMod(veh, 8, customized.modFender, false)
      end
  
      if customized.modRightFender ~= nil then
          SetVehicleMod(veh, 9, customized.modRightFender, false)
      end
  
      if customized.modRoof ~= nil then
          SetVehicleMod(veh, 10, customized.modRoof, false)
      end
  
      if customized.modEngine ~= nil then
          SetVehicleMod(veh, 11, customized.modEngine, false)
      end
  
      if customized.modBrakes ~= nil then
          SetVehicleMod(veh, 12, customized.modBrakes, false)
      end
  
      if customized.modTransmission ~= nil then
          SetVehicleMod(veh, 13, customized.modTransmission, false)
      end
  
      if customized.modHorns ~= nil then
          SetVehicleMod(veh, 14, customized.modHorns, false)
      end
  
      if customized.modSuspension ~= nil then
          SetVehicleMod(veh, 15, customized.modSuspension, false)
      end
  
      if customized.modArmor ~= nil then
          SetVehicleMod(veh, 16, customized.modArmor, false)
      end
  
      if customized.modTurbo ~= nil then
          ToggleVehicleMod(veh,  18, customized.modTurbo)
      end
  
      if customized.modXenon ~= nil then
          ToggleVehicleMod(veh,  22, customized.modXenon)
      end
  
      if customized.modFrontWheels ~= nil then
          SetVehicleMod(veh, 23, customized.modFrontWheels, false)
      end
  
      if customized.modBackWheels ~= nil then
          SetVehicleMod(veh, 24, customized.modBackWheels, false)
      end
  
      if customized.modPlateHolder ~= nil then
          SetVehicleMod(veh, 25, customized.modPlateHolder, false)
      end
  
      if customized.modVanityPlate ~= nil then
          SetVehicleMod(veh, 26, customized.modVanityPlate, false)
      end
  
      if customized.modTrimA ~= nil then
          SetVehicleMod(veh, 27, customized.modTrimA, false)
      end
  
      if customized.modOrnaments ~= nil then
          SetVehicleMod(veh, 28, customized.modOrnaments, false)
      end
  
      if customized.modDashboard ~= nil then
          SetVehicleMod(veh, 29, customized.modDashboard, false)
      end
  
      if customized.modDashboardColour ~= nil then
          SetVehicleDashboardColour(veh, customized.modDashboardColour)
      end
  
      if customized.modInteriorColour ~= nil then
          SetVehicleInteriorColour(veh, customized.modInteriorColour)
      end
  
      if customized.modXenonColour ~= nil then
          SetVehicleHeadlightsColour(veh, customized.modXenonColour)
      end
  
      if customized.modDial ~= nil then
          SetVehicleMod(veh, 30, customized.modDial, false)
      end
  
      if customized.modDoorSpeaker ~= nil then
          SetVehicleMod(veh, 31, customized.modDoorSpeaker, false)
      end
  
      if customized.modSeats ~= nil then
          SetVehicleMod(veh, 32, customized.modSeats, false)
      end
  
      if customized.modSteeringWheel ~= nil then
          SetVehicleMod(veh, 33, customized.modSteeringWheel, false)
      end
  
      if customized.modShifterLeavers ~= nil then
          SetVehicleMod(veh, 34, customized.modShifterLeavers, false)
      end
  
      if customized.modAPlate ~= nil then
          SetVehicleMod(veh, 35, customized.modAPlate, false)
      end
  
      if customized.modSpeakers ~= nil then
          SetVehicleMod(veh, 36, customized.modSpeakers, false)
      end
  
      if customized.modTrunk ~= nil then
          SetVehicleMod(veh, 37, customized.modTrunk, false)
      end
  
      if customized.modHydrolic ~= nil then
          SetVehicleMod(veh, 38, customized.modHydrolic, false)
      end
  
      if customized.modEngineBlock ~= nil then
          SetVehicleMod(veh, 39, customized.modEngineBlock, false)
      end
  
      if customized.modAirFilter ~= nil then
          SetVehicleMod(veh, 40, customized.modAirFilter, false)
      end
  
      if customized.modStruts ~= nil then
          SetVehicleMod(veh, 41, customized.modStruts, false)
      end
  
      if customized.modArchCover ~= nil then
          SetVehicleMod(veh, 42, customized.modArchCover, false)
      end
  
      if customized.modAerials ~= nil then
          SetVehicleMod(veh, 43, customized.modAerials, false)
      end
  
      if customized.modTrimB ~= nil then
          SetVehicleMod(veh, 44, customized.modTrimB, false)
      end
  
      if customized.modTank ~= nil then
          SetVehicleMod(veh, 45, customized.modTank, false)
      end
  
      if customized.modWindows ~= nil then
          SetVehicleMod(veh, 46, customized.modWindows, false)
      end
  
      if customized.modLivery ~= nil then
          SetVehicleMod(veh, 48, customized.modLivery, false)
          SetVehicleLivery(veh, customized.modLivery)
      end
  
      if customized.modoldLivery ~= nil then
          SetVehicleLivery(veh, customized.modoldLivery)
      end
  else
      SetVehicleColours(veh, 0, 0)
      SetVehicleExtraColours(veh, 0, 0)
  end
end

RegisterNetEvent("carGiveKeys")
AddEventHandler("carGiveKeys", function(car, carPlate)
    print(car, carPlate)
    TriggerEvent("vehicle:keys:addNew", car, carPlate)
end)