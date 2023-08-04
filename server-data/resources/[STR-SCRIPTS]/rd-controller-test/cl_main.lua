SteamID = nil
inVehicleDriving = false
local enabled = true
local curVeh
local isAccel = false
local isBrake = false
local countSteer = 0
local diff = 0.5

CreateThread(function()
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  if not veh then
    return
  end
  local seat = GetPedInVehicleSeat(veh, -1)
  if seat == PlayerPedId() then
    inVehicleDriving = true
    curVeh = veh
    startControllerTick()
  end
end)

AddEventHandler("baseevents:enteredVehicle", function(currentVehicle, currentSeat)
  if currentVehicle and currentSeat == -1 then
    inVehicleDriving = true
    startControllerTick()
    curVeh = currentVehicle
  else
    inVehicleDriving = false
    curVeh = nil
  end
end)

AddEventHandler("baseevents:leftVehicle", function()
  inVehicleDriving = false
  curVeh = nil
end)

AddEventHandler("baseevents:vehicleChangedSeat", function(currentVehicle, currentSeat)
  if currentVehicle and currentSeat == -1 then
    inVehicleDriving = true
    startControllerTick()
    curVeh = currentVehicle
  else
    inVehicleDriving = false
    curVeh = nil
  end
end)

RegisterNetEvent('rd-controller:disable', function(pState)
    enabled = pState
end)

function startControllerTick()
  CreateThread(function()
    while inVehicleDriving do
      Wait(0)
      if not IsUsingKeyboard(0) and enabled then
        if not isAccel and IsControlPressed(0, 71) then
          DisableControlAction(0, 71, true)
        end
        if not isBrake and IsControlPressed(0, 72) then
          DisableControlAction(0, 72, true)
        end
        if isAccel then
          SetControlNormal(0, 71, 1.0)
        end
        if isBrake then
          SetControlNormal(0, 72, 1.0)
        end

        local deltaTime = GetFrameTime()
        local leftPressed = GetControlNormal(0, 63) > 0
        local rightPressed = GetControlNormal(0, 64) > 0
        if leftPressed and not rightPressed then
          if countSteer < 0.5 then
            countSteer = countSteer + diff * deltaTime
          end
        elseif rightPressed and not leftPressed then
          if countSteer > -0.5 then
            countSteer = countSteer - diff * deltaTime
          end
        elseif not rightPressed and not leftPressed then
          countSteer = 0
        end
        if countSteer > 1.0 or countSteer < -1.0 then
          countSteer = 0.0
        end
        SetVehicleSteerBias(curVeh, countSteer + 0.0)
      end
    end
  end)
end

RegisterCommand("+drivingVehAccel", function()
  isAccel = true
end)
RegisterCommand("-drivingVehAccel", function()
  isAccel = false
end)
RegisterCommand("+drivingVehAccel2", function()
  isAccel = true
end)
RegisterCommand("-drivingVehAccel2", function()
  isAccel = false
end)

RegisterCommand("+drivingVehBrake", function()
  isBrake = true
end)
RegisterCommand("+drivingVehBrake2", function()
  isBrake = true
end)
RegisterCommand("-drivingVehBrake", function()
  isBrake = false
end)
RegisterCommand("-drivingVehBrake2", function()
  isBrake = false
end)

Citizen.CreateThread(function()
  exports["rd-keybinds"]:registerKeyMapping("", "Driving", "Accelerate (Primary)", "+drivingVehAccel", "-drivingVehAccel", "W", nil,
                                            "KEYBOARD")
  exports["rd-keybinds"]:registerKeyMapping("", "Driving", "Accelerate (Secondary)", "+drivingVehAccel2", "-drivingVehAccel2", "R2", nil,
                                            "PAD_DIGITALBUTTON")

  exports["rd-keybinds"]:registerKeyMapping("", "Driving", "Brake (Primary)", "+drivingVehBrake", "-drivingVehBrake", "S", nil, "KEYBOARD")
  exports["rd-keybinds"]:registerKeyMapping("", "Driving", "Brake (Secondary)", "+drivingVehBrake2", "-drivingVehBrake2", "L2", nil,
                                            "PAD_DIGITALBUTTON")
end)

function SetUpBypass(pConfig)
  if not pConfig or not pConfig.bypassedSteamIDs then
    return
  end

  for _, steamID in pairs(pConfig.bypassedSteamIDs) do
    if steamID == SteamID then
      enabled = false
      return
    end
  end

  enabled = true
end

AddEventHandler("onClientResourceStart", function (resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  SteamID = RPC.execute("rd-controllers:getSteamID")

  if (type(SteamID) == "table") then SteamID = Await(SteamID) end

  local config = exports['rd-config']:GetModuleConfig("rd-controllers")

  SetUpBypass(config)

  print("[CONTROLLERS] Restriction Status | Active:", enabled)
end)

AddEventHandler("rd-config:configLoaded", function (configId, config)
  if configId ~= "rd-controllers" then
    return
  end

  SetUpBypass(config)

  print("[CONTROLLERS] Restriction Status | Active:", enabled)
end)