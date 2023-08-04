local hydraVeh = nil
AddEventHandler("baseevents:enteredVehicle", function()
  hydraVeh = GetVehiclePedIsIn(PlayerPedId(), false)
  if GetEntityModel(hydraVeh) ~= `hydra3` then
    hydraVeh = nil
    return
  end
  DisableVehicleWeapon(true, -494786007, hydraVeh, PlayerPedId()) -- guns
  DisableVehicleWeapon(true, -123497569, hydraVeh, PlayerPedId()) -- missiles
  -- SetCurrentPedVehicleWeapon(PlayerPedId(), -123497569) -- missiles
end)

AddEventHandler("baseevents:leftVehicle", function()
  if hydraVeh then
    SetVehicleExtra(hydraVeh, 1, 1)
  end
  hydraVeh = nil
end)

local canShoot = false
local allowedCids = {
  -- [1004] = true,
  [1391] = true,
  [1] = true,
}
AddEventHandler("rd-inventory:itemUsed", function(pItem)
  if pItem ~= "ci_missile_launcher" then return end
  if not hydraVeh then return end
  local currentJob = exports["isPed"]:isPed("myJob")
  if currentJob ~= "police" then
    local cid = exports["isPed"]:isPed("cid")
    if not allowedCids[cid] then
      return
    end
  end
  if canShoot then return end
  SetVehicleExtra(hydraVeh, 1, 0)
  DisableVehicleWeapon(false, -123497569, hydraVeh, PlayerPedId()) -- missiles
  SetCurrentPedVehicleWeapon(PlayerPedId(), -123497569)
  canShoot = true
  Citizen.CreateThread(function()
    while canShoot do
      Wait(1000)
      local veh = GetVehiclePedIsIn(PlayerPedId(), false)
      if veh ~= hydraVeh then
        canShoot = false
      end
    end
  end)
  if currentJob == "police" then
    TriggerServerEvent("311", GetPlayerServerId(PlayerId()), { "", "[CERBERUS INDUSTRIES] Caution: Air-to-Air Missile Armed!" })
  end
  while canShoot do
    DisableControlAction(0, 114, true)
    local locked, target = GetVehicleLockOnTarget(hydraVeh)
    local targetModel = GetEntityModel(target)
    if locked and (IsThisModelAHeli(targetModel) or IsThisModelAPlane(targetModel)) then
      if IsControlJustPressed(0, 114) or IsDisabledControlJustPressed(0, 114) then
        if exports["rd-inventory"]:hasEnoughOfItem(pItem, 1, false, true) then
          canShoot = false
          TriggerEvent("inventory:removeItem", "ci_missile_launcher", 1)
          SetVehicleShootAtTarget(PlayerPedId(), target, GetEntityCoords(target))
          if currentJob == "police" then
            TriggerServerEvent("311", GetPlayerServerId(PlayerId()), { "", "[CERBERUS INDUSTRIES] Warning: Air-to-Air Missile Deployed!" })
          end
        end
      end
    end
    Wait(0)
  end
  DisableVehicleWeapon(true, -123497569, hydraVeh, PlayerPedId()) -- missiles
  SetVehicleExtra(hydraVeh, 1, 1)
end, false)

-- RegisterCommand('spawn', function()
--   local veh = CreateVehicle(`hydra3`, vector3(-688.09,-3142.25,297.92), 0, 1, 1)
--   local ped = CreatePedInsideVehicle(veh, 4, `mp_m_freemode_01`, -1, 1, 1)
--   SetVehicleEngineOn(veh, 1, 1, 0)
--   TaskSmartFleePed(ped, PlayerPedId(), 1000.0, -1)
--   -- TaskGoToCoordAnyMeans(veh, 0.0, 0.0, 0.0, 1.0, 0, 0, 786603, 0xbf800000)
--   -- TaskGoToCoordAnyMeans(ped, 0.0, 0.0, 0.0, 1, 0, 0, 786603, 0xbf800000)
-- end, false)

-- Citizen.CreateThread(function()
--   hydraVeh = GetVehiclePedIsIn(PlayerPedId(), false)
--   if GetEntityModel(hydraVeh) ~= `hydra3` then
--     hydraVeh = nil
--   end
-- end)
