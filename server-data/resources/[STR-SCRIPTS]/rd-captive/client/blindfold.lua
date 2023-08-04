local isBlindfolded = false
local headobject = nil

RegisterCommand('test-blindfold',function(source,args) -- For testing solo - Ghost.#4736
  if args[1] == 'apply' then
    TriggerServerEvent('blindfold:server:apply',true,1)
  elseif args[1] == 'remove' then
    TriggerServerEvent('blindfold:server:apply',false,1)
  else
    TriggerEvent('DoLongHudText','Format /test-blindfold apply /remove')
  end
end)

RegisterNetEvent("blindfold:blindfold")
AddEventHandler("blindfold:blindfold", function(pArgs, pEntity)
  local ped = PlayerPedId()
  local tPed = pEntity
  local target = GetClosestPlayerAny()
  local pTarget = GetPlayerServerId(target)
  isBlindfolded = exports["rd-flags"]:HasPedFlag(tPed, "isBlindfolded")
  local time, string = 1000, "Putting On Blindfold"
  if isBlindfolded then
    time = 2000
    string = "Removing Blindfold"
  end

  RequestAnimDict("random@shop_robbery")
  while not HasAnimDictLoaded("random@shop_robbery") do
    Citizen.Wait(0)
  end

  ClearPedTasksImmediately(ped)
  TaskPlayAnim(ped, "random@shop_robbery", "robbery_action_b", 8.0, -8, -1, 16, 0, 0, 0, 0)

  local blindfoldtask = exports["rd-taskbar"]:taskBar(time, string)

  if blindfoldtask == 100 then
    if isBlindfolded then
      exports['rd-flags']:SetPedFlag(tPed, 'isBlindfolded', false)
    else
      exports['rd-flags']:SetPedFlag(tPed, 'isBlindfolded', true)
    end
  end
  TriggerServerEvent('blindfold:server:apply',isBlindfolded,pTarget)
  ClearPedSecondaryTask(ped)
end)

RegisterNetEvent("blindfold:apply")
AddEventHandler("blindfold:apply", function(pIsBlindfolded)
  isBlindfolded = pIsBlindfolded
  SendNUIMessage({blind = isBlindfolded})
  if isBlindfolded then
    AddHeadObject()
    TriggerEvent('InteractSound_CL:PlayOnOne', 'headbagon', 1.0)
  else
    RemoveHeadObject()
    TriggerEvent('InteractSound_CL:PlayOnOne', 'headbagoff', 1.0)
  end
end)

function AddHeadObject()
  local ped = PlayerPedId()
  local model = `np_blindfold_hood`

  if not IsModelValid(model) then
    print("INVALID PROP")
    return
  end

  RequestModel(model)

  while not HasModelLoaded(model) do
    Wait(0)
  end

  local coords = GetEntityCoords(ped)

  headobject = CreateObjectNoOffset(model, coords, true, false, false)

  while not DoesEntityExist(headobject) do
    Wait(0)
  end

  SetModelAsNoLongerNeeded(model)

  boneid = GetPedBoneIndex(ped, 12844)

  AttachEntityToEntity(headobject, ped, boneid, 0.32, 0.01, 0.0, 0.0, 270.0, 0.0, 0, 0, 0, 1, 0, 1)

  SetFollowPedCamViewMode(4)

  Citizen.CreateThread(function ()
    SetFollowPedCamViewMode(4)
      while isBlindfolded do
        SetEntityLocallyInvisible(headobject)
        DisableControlAction(0, 0, true)
        Citizen.Wait(0)
      end
  end)
end

function RemoveHeadObject()
  DeleteObject(headobject)
end

function GetClosestPlayerAny()
  local players = GetPlayers()
  local closestDistance = -1
  local closestPlayer = -1
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  for index, value in ipairs(players) do
      local target = GetPlayerPed(value)
      if (target ~= ply) then
          local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
          local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) -
                               vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
          if (closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
              closestPlayer = value
              closestDistance = distance
          end
      end
  end
  return closestPlayer, closestDistance
end

function GetPlayers()
  local players = {}

  for i = 0, 255 do
      if NetworkIsPlayerActive(i) then
          players[#players + 1] = i
      end
  end

  return players
end

AddEventHandler('onResourceStop', function (resource)
  if resource == GetCurrentResourceName() then
    RemoveHeadObject()
  end
end)