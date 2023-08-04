Citizen.CreateThread(function()
  exports['rd-interact']:AddPeekEntryByModel({ `ch_prop_casino_drone_02a`, `xs_prop_arena_drone_02` }, {
    { id = 'drone_pickup', event = 'rd-rcvehicles:pickupDrone', icon = 'people-carry', label = 'pickup' },
  }, {
    distance = { radius = 3.0 },
    isEnabled = function(pEntity)
      return #GetEntityVelocity(pEntity) < 0.2
    end
  })
end)

AddEventHandler('rd-rcvehicles:pickupDrone', function(pArgs, pEntity, pContext)
    if not pEntity then return end

    RPC.execute('rd-rcvehicles:pickupDrone', NetworkGetNetworkIdFromEntity(pEntity))
end)

AddEventHandler('rd-rcvehicles:pickupCar', function(pArgs, pEntity, pContext)
  if not pEntity then return end

  RPC.execute('rd-rcvehicles:pickupCar', NetworkGetNetworkIdFromEntity(pEntity))
end)

RegisterCommand("droneciv", function()
  local metaData = {
    ["id"] = "31",
    ["battery"] = "60",
    ["charges"] = "31",
  }
  TriggerEvent('player:receiveItem', 'drone_civ', 1, false, metaData)
end)

AddEventHandler('rd-inventory:itemUsed', function(pItem, pInfo, pSlot)
  if pItem == 'drone_lspd' then
    local info = json.decode(pInfo)
    -- Use rd-objects placement
    local droneSettings = {
      model = `ch_prop_casino_drone_02a`, -- police drone
      camOffset = { -0.25, -0.1 },
      maxDistance = 360.0,
      lifeTime = (info.battery or 45) * 60,
      charges = info.charges or 0,
      name = 'Police Drone #' .. info.id,
      id = info.id,
    }
    local placement = placeVehicle(droneSettings)
    if not placement then
      return
    end

    if not exports['rd-inventory']:hasEnoughOfItem(pItem, 1, false, true) then
      return
    end

    droneSettings.position = vector3(placement.coords.x, placement.coords.y, placement.coords.z)
    droneSettings.rotation = vector3(placement.rotation.x, placement.rotation.y, placement.rotation.z)
    droneSettings.item = pItem

    RPC.execute('rd-rcvehicles:placeDrone', droneSettings)
  end

  if pItem == 'drone_civ' then
    local info = json.decode(pInfo)
    local droneSettings = {
      model = `xs_prop_arena_drone_02`,
      camOffset = { -0.125, -0.135 },
      maxDistance = 320.0,
      lifeTime = (info.battery or 45) * 60,
      charges = info.charges or 0,
      name = 'Civilian Drone #' .. info.id,
      id = info.id,
    }
    local placement = placeVehicle(droneSettings)
    if not placement then
      return
    end

    if not exports['rd-inventory']:hasEnoughOfItem(pItem, 1, false, true) then
      return
    end

    droneSettings.position = vector3(placement.coords.x, placement.coords.y, placement.coords.z)
    droneSettings.rotation = vector3(placement.rotation.x, placement.rotation.y, placement.rotation.z)
    droneSettings.item = pItem

    RPC.execute('rd-rcvehicles:placeDrone', droneSettings)
  end

  if pItem == 'rc_car_civ' then
    local info = json.decode(pInfo)
    local carSettings = {
      model = `rcbandito`,
      camOffset = { 0.115, 0.35 },
      maxDistance = 320.0,
      lifeTime = (info.battery or 45) * 60,
      name = 'Civilian Car #' .. info.id,
      id = info.id,
    }

    local placement = placeVehicle(carSettings)
    if not placement then
      return
    end

    if not exports['rd-inventory']:hasEnoughOfItem(pItem, 1, false, true) then
      return
    end

    carSettings.position = vector3(placement.coords.x, placement.coords.y, placement.coords.z)
    carSettings.rotation = vector3(placement.rotation.x, placement.rotation.y, placement.rotation.z)
    carSettings.item = pItem

    RPC.execute('rd-rcvehicles:placeCar', carSettings)
  end

  if pItem == 'rccontroller' then
    -- Open RC context menu with active vehicles
    local context = { { title = 'RC Vehicles', icon = 'gamepad' } }
    for droneId, drone in pairs(DRONES) do
      context[#context + 1] = {
        title = drone.name,
        description = 'Battery Remaining: ' .. tostring(getRemainingBattery(drone)) ..
            ' minutes',
        icon = 'helicopter',
        children = {
          {
            title = 'Pilot',
            icon = 'gamepad',
            action = 'rd-rcvehicles:drone:contextAction',
            key = { action = 'pilotDrone', drone = droneId },
          },
        },
      }
    end

    for carId, car in pairs(CARS) do
      context[#context+1] = {
        title = car.name,
        description = 'Battery Remaining: ' .. tostring(getRemainingBattery(car)) ..
            ' minutes',
        icon = 'car',
        children = {
          {
            title = 'Drive',
            icon = 'gamepad',
            action = 'rd-rcvehicles:car:contextAction',
            key = { action = 'pilotCar', car = carId },
          },
        },
      }
    end
    exports['rd-ui']:showContextMenu(context)
  end
end)

RegisterUICallback('rd-rcvehicles:drone:contextAction', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  if data.key.action == 'pilotDrone' then
    RPC.execute('rd-rcvehicles:pilotDrone', data.key.drone)
  end
end)

RegisterUICallback('rd-rcvehicles:car:contextAction', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  if data.key.action == 'pilotCar' then
    RPC.execute('rd-rcvehicles:pilotCar', data.key.car)
  end
end)

function placeVehicle(pSettings)
  local result = exports['rd-objects']:PlaceObject(pSettings.model, { groundSnap = true }, function(pCoords, pMaterial, pEntity)
    return true
  end)

  if not result or not result[1] then
    return
  end

  return result[2]
end

function getRemainingBattery(vehicle)
    return math.ceil((vehicle.lifeTime - (GetCloudTimeAsInt() - vehicle.start)) / 60)
end
