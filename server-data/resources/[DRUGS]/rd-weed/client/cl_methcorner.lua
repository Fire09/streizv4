local CurrentlyCornering = false
local CurrentCornerCoords
local CurrentCornerVehicle
local CurrentCornerZone
local sellBlock = false

local UsedPeds = {}
local ActivePeds = {}

local MethStartCorner = {
  group = { 2 },
  data = {
    {
      id = 'meth_corner_start',
      label = 'start cornering meth',
      icon = 'handshake',
      event = 'rd-meth:startCornering',
      parameters = {},
    },
  },
  options = {
    distance = { radius = 5.0 },
    isEnabled = function(pEntity, pContext)
      local hasMeth = exports['rd-inventory']:hasEnoughOfItem('meth1g', 1, false, true)
      local isCorneringAlready = false
      return not CurrentlyCornering and hasMeth and not IsPedInAnyVehicle(PlayerPedId(), false) and not isCorneringAlready
    end,
  },
}

local MethStopCorner = {
  group = { 2 },
  data = {
    {
      id = 'meth_cornering_stop',
      label = 'stop cornering meth',
      icon = 'handshake-slash',
      event = 'rd-meth:stopCornering',
      parameters = {},
    },
  },
  options = {
    distance = { radius = 5.0 },
    isEnabled = function(pEntity, pContext)
      return CurrentlyCornering and not IsPedInAnyVehicle(PlayerPedId(), false)
    end,
  },
}

local MethCornerInteract = {
  group = { 1 },
  data = {
    {
      id = 'meth_corner_sale',
      label = 'sell',
      icon = 'comment-dollar',
      event = 'rd-meth:cornerSale',
      parameters = {},
    },
  },
  options = {
    distance = { radius = 2.5 },
    isEnabled = function(pEntity, pContext)
      return CurrentlyCornering and ActivePeds[pEntity] and not IsPedInAnyVehicle(PlayerPedId(), false)
    end,
  },
}

Citizen.CreateThread(function()
  exports['rd-interact']:AddPeekEntryByEntityType(MethCornerInteract.group, MethCornerInteract.data, MethCornerInteract.options)
  exports['rd-interact']:AddPeekEntryByEntityType(MethStartCorner.group, MethStartCorner.data, MethStartCorner.options)
  exports['rd-interact']:AddPeekEntryByEntityType(MethStopCorner.group, MethStopCorner.data, MethStopCorner.options)
end)

AddEventHandler('rd-meth:startCornering', function(pContext, pEntity)
  CurrentCornerCoords = GetEntityCoords(PlayerPedId())
  CurrentCornerZone = GetNameOfZone(CurrentCornerCoords)

  if not WhitelistedZones[CurrentCornerZone] then
    TriggerEvent('DoLongHudText', 'Nobody is buying around here')
    return
  end

  local canCorner, message = RPC.execute('rd-meth:startCorner', CurrentCornerCoords)
  TriggerEvent('DoLongHudText', message)

  if not canCorner then
    return
  end

  CurrentlyCornering = true
  CurrentCornerVehicle = pEntity

  SetVehicleDoorOpen(CurrentCornerVehicle, 5, false, false)

  -- Ped spawn loop
  Citizen.CreateThread(function()
    while CurrentlyCornering and CornerConfig.PopulateRate ~= -1 do
      PopulateNow()
      Wait(CornerConfig.PopulateRate)
    end
  end)

  -- Ped Acquisition loop
  Citizen.CreateThread(function()
    local notFoundCount = 0
    while CurrentlyCornering do
      local plyCoords = GetEntityCoords(PlayerPedId())
      if #(CurrentCornerCoords - plyCoords) > 50.0 or #(GetEntityCoords(CurrentCornerVehicle) - plyCoords) > 50.0 then
        TriggerEvent('DoLongHudText', 'No longer selling...')
        stopCornering()
        return
      end

      local peds = GetGamePool('CPed')
      local foundPed
      for _, ped in ipairs(peds) do
        if not IsPedDeadOrDying(ped, true) and not IsPedAPlayer(ped) and not IsPedFleeing(ped) and IsPedOnFoot(ped) and
            not IsPedInAnyVehicle(ped, true) and IsPedHuman(ped) and NetworkGetEntityIsNetworked(ped) and not IsPedInMeleeCombat(ped) and
            not UsedPeds[ped] and not ActivePeds[ped] and #(CurrentCornerCoords - GetEntityCoords(ped)) < 100.0 then
          TriggerEvent('DoLongHudText', message)
          foundPed = ped
          notFoundCount = 0
          break
        end
      end

      if not foundPed then
        notFoundCount = notFoundCount + 1
      else
        local retval, coords = GetPointOnRoadSide(CurrentCornerCoords.x, CurrentCornerCoords.y, CurrentCornerCoords.z, 1)
        local result = RPC.execute('rd-meth:cornerPed', coords, NetworkGetNetworkIdFromEntity(foundPed), NetworkGetNetworkIdFromEntity(CurrentCornerVehicle))
    end

      if notFoundCount > 7 then
        TriggerEvent('DoLongHudText', 'Looks like this spot has dried up.')
        stopCornering()
        return
      end

      Wait(CornerConfig.TimeBetweenAcquisition)
    end
  end)
end)

local methItems = { 'corner-meth-item1', 'corner-meth-item2', 'corner-meth-item3', 'corner-meth-item4', 'corner-meth-item5' }

AddEventHandler('rd-meth:cornerSale', function(pContext, pEntity)
  if not DoesEntityExist(pEntity) == 1 or IsPedDeadOrDying(pEntity) then
    return
  end

  if sellBlock then return end

  sellBlock = true

  local hasBaggies = exports['rd-inventory']:hasEnoughOfItem('meth1g', 1, true)
  if not hasBaggies then
    TriggerEvent('DoLongHudText', 'You need more baggies to sell')
    sellBlock = false
    return
  end

  SetPedCanRagdoll(PlayerPedId(), false)
  PlayAmbientSpeech1(pEntity, 'Generic_Hi', 'Speech_Params_Force')
  TaskTurnPedToFaceEntity(PlayerPedId(), pEntity, 1000)
  TaskPlayAnim(PlayerPedId(), 'mp_safehouselost@', 'package_dropoff', 8.0, -8.0, -1, 4096, 0, false, false, false)
  RPC.execute('rd-meth:cornerSyncHandoff', CurrentCornerCoords, NetworkGetNetworkIdFromEntity(pEntity))

  Wait(2000)
  SetPedCanRagdoll(PlayerPedId(), true)
  if CornerConfig.DropEvidence and math.random() < 0.3 then
    local rndItem = math.random(1, #methItems)
    TriggerEvent('evidence:drugs', methItems[rndItem])
  end

  local didSale = RPC.execute('rd-meth:cornerSale', CurrentCornerCoords, NetworkGetNetworkIdFromEntity(pEntity), CurrentCornerZone)
  if didSale then
    PlayAmbientSpeech1(pEntity, 'Chat_State', 'Speech_Params_Force')
    local rndAmt = math.random(1, 3)
    if rndAmt == 1 and exports['rd-inventory']:hasEnoughOfItem('meth1g', 1) then
        TriggerEvent('money:clean2')
        TriggerEvent('inventory:removeItem', 'meth1g', 1)
      elseif rndAmt == 2 and exports['rd-inventory']:hasEnoughOfItem('meth1g', 3) then
        TriggerEvent('money:clean2')
        TriggerEvent('money:clean2')
        TriggerEvent('money:clean2')
        TriggerEvent('inventory:removeItem', 'meth1g', 1)
        TriggerEvent('inventory:removeItem', 'meth1g', 1)
        TriggerEvent('inventory:removeItem', 'meth1g', 1)
      elseif rndAmt == 3 and exports['rd-inventory']:hasEnoughOfItem('meth1g', 2) then
        TriggerEvent('money:clean2')
        TriggerEvent('money:clean2')
        TriggerEvent('inventory:removeItem', 'meth1g', 1)
        TriggerEvent('inventory:removeItem', 'meth1g', 1)
      end
    Citizen.Wait(3000)
    sellBlock = false
  end
  if didSale and math.random() < 0.05 then
    TriggerEvent('rd-mdt:drugsale')
  end
end)

AddEventHandler('rd-meth:stopCornering', function(pContext, pEntity)
  TriggerEvent('DoLongHudText', 'No longer selling...')
  stopCornering()
end)

RegisterNetEvent('rd-meth:addCorneredPed')
AddEventHandler('rd-meth:addCorneredPed', function(pPed)
  local ped = NetworkGetEntityFromNetworkId(pPed)
  ActivePeds[ped] = false
end)

RegisterNetEvent('rd-meth:cornerSyncHandoff')
AddEventHandler('rd-meth:cornerSyncHandoff', function(pPed)
  local ped = NetworkGetEntityFromNetworkId(pPed)
  local relation = GetPedRelationshipGroupHash(ped)
  SetRelationshipBetweenGroups(0, `PLAYER`, relation)
  SetRelationshipBetweenGroups(0, relation, `PLAYER`)
  if NetworkHasControlOfEntity(ped) then
    TaskHandoff(ped)
  end
end)

RegisterNetEvent('rd-meth:cornerPed')
AddEventHandler('rd-meth:cornerPed', function(pPed, pCornerCoords, pVehicle)
  local ped = NetworkGetEntityFromNetworkId(pPed)
  ActivePeds[ped] = true
  UsedPeds[ped] = true
  if NetworkHasControlOfEntity(ped) then
    local robber = math.random()
    if robber > 0.9969 then
      TaskRobTrunk(ped, pCornerCoords, NetworkGetEntityFromNetworkId(pVehicle))
      ActivePeds[ped] = false
    else
      TaskWalkToCorner(ped, pCornerCoords)
    end
  end
end)

RegisterNetEvent('rd-meth:cleanCornerPeds')
AddEventHandler('rd-meth:cleanCornerPeds', function()
  UsedPeds = {}
end)

function stopCornering()
  for ped, _ in pairs(ActivePeds) do
    SetEntityAsNoLongerNeeded(ped)
    SetPedKeepTask(ped, false)
  end
  ActivePeds = {}
  CurrentlyCornering = false
  CurrentCornerCoords = nil
  CurrentCornerVehicle = nil
  CurrentCornerZone = nil
end

function TaskHandoff(pPed)
  loadAnimDict('mp_safehouselost@')
  ClearPedTasks(pPed)

  local taskSeq = OpenSequenceTask()
  TaskSetBlockingOfNonTemporaryEvents(0, true)
  TaskTurnPedToFaceEntity(0, PlayerPedId(), 0)
  TaskPlayAnim(0, 'mp_safehouselost@', 'package_dropoff', 8.0, -8.0, -1, 0, 0, false, false, false)
  TaskSetBlockingOfNonTemporaryEvents(0, false)
  TaskWanderStandard(0, 10.0, 10)
  CloseSequenceTask(taskSeq)

  TaskPerformSequence(pPed, taskSeq)
  ClearSequenceTask()
  SetPedKeepTask(pPed)
end

function TaskWalkToCorner(pPed, pCornerCoords)
  ClearPedTasks(pPed)
  local animDict, anim = getRandomIdle()
  loadAnimDict(animDict)

  local randomLength = (math.random() * 7.0) + 3.0
  local taskSeq = OpenSequenceTask()
  TaskSetBlockingOfNonTemporaryEvents(0, true)
  TaskFollowNavMeshToCoord(0, pCornerCoords, 1.0, -1, randomLength, true, 40000.0)
  TaskTurnPedToFaceEntity(0, PlayerPedId(), 0)
  TaskPlayAnim(0, animDict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
  TaskPause(0, 10000)
  TaskSetBlockingOfNonTemporaryEvents(0, false)
  TaskWanderStandard(0, 10.0, 10)
  CloseSequenceTask(taskSeq)

  TaskPerformSequence(pPed, taskSeq)
  ClearSequenceTask()
  SetPedKeepTask(pPed, true)

  SetEntityAsMissionEntity(pPed, true, true)
  SetTimeout(120000, function()
    SetEntityAsNoLongerNeeded(pPed)
    SetPedKeepTask(pPed, false)
  end)
end

function TaskRobTrunk(pPed, pCornerCoords, pCornerVehicle)
  ClearPedTasks(pPed)
  -- This is a good "Robber" script or something, goes to trunk and plays anim, then runs away
  loadAnimDict('mini@repair')

  local taskSeq = OpenSequenceTask()
  TaskSetBlockingOfNonTemporaryEvents(0, true)
  TaskFollowNavMeshToCoord(0, pCornerCoords, 10.0, -1, 1.0, true, 40000.0)
  TaskTurnPedToFaceEntity(0, pCornerVehicle, 0)
  TaskPlayAnim(0, 'mini@repair', 'fixing_a_player', 8.0, -8.0, -1, 1, 0, false, false, false)
  TaskSetBlockingOfNonTemporaryEvents(0, false)
  TaskSmartFleePed(0, PlayerPedId(), 100.0, -1, false, false)
  CloseSequenceTask(taskSeq)

  TaskPerformSequence(pPed, taskSeq)
  ClearSequenceTask()
  SetPedKeepTask(pPed, true)

  SetEntityAsMissionEntity(pPed, true, true)
  SetTimeout(120000, function()
    SetEntityAsNoLongerNeeded(pPed)
    SetPedKeepTask(pPed, false)
  end)
end

function getRandomIdle()
  local idles = {
    ['anim@mp_corona_idles@male_c@idle_a'] = 'idle_a',
    ['friends@fra@ig_1'] = 'base_idle',
    ['amb@world_human_hang_out_street@male_b@idle_a'] = 'idle_b',
    ['anim@heists@heist_corona@team_idles@male_a'] = 'idle',
    ['anim@mp_celebration@idles@female'] = 'celebration_idle_f_a',
    ['anim@mp_corona_idles@female_b@idle_a'] = 'idle_a',
    ['random@shop_tattoo'] = '_idle_a',
  }
  for animDict, anim in pairs(idles) do
    if math.random() < 0.2 then
      return animDict, anim
    end
  end
  return 'rcmjosh1', 'idle'
end

function loadAnimDict(pDict)
  while (not HasAnimDictLoaded(pDict)) do
    RequestAnimDict(pDict)
    Citizen.Wait(5)
  end
end

exports('IsCornering', function()
  return CurrentlyCornering
end)

-- cleaning
local billsCleaningStuff = {
  ["band"] = { extra = 5, price = 50 },
  ["markedbills"] = { extra = 8, price = 100 },
  ["rollcash"] = { extra = 15, price = 15 },
  ["inkset"] = { extra = 15, price = 25 },
}

AddEventHandler("money:clean2", function(pRandomChance)
  local payment = 0
  for typ, conf in pairs(billsCleaningStuff) do
    local randomAmount = math.random(4, 12)
    local randomChance = pRandomChance and pRandomChance or 0.4
    local totalAmount = randomAmount + conf.extra
    if math.random() < randomChance and exports["rd-inventory"]:hasEnoughOfItem(typ, totalAmount, false) then
      TriggerEvent("inventory:removeItem", typ, totalAmount)
      payment = payment + (conf.price * totalAmount)
      payment = payment + math.random(5, 15)
      TriggerServerEvent('zyloz:payout', payment)
    end
  end
  if payment == 0 then
    TriggerServerEvent('zyloz:payout', math.random(250, 380))
  end
end)