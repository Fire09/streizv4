local panItems = {
  ["goldpantray"] = {
    degChance = 0.56,
    rollCount = 1,
  },
  ["goldpantraym"] = {
    degChance = 0.28,
    rollCount = 2,
  },
  ["goldpantrayl"] = {
    degChance = 0.14,
    rollCount = 3,
  },
}
local panInProgress = false
local pannedCoords = {}

AddEventHandler("rd-inventory:itemUsed", function(pItem)
  local panConfig = panItems[pItem]
  if not panConfig then return end
  local rollCount = panConfig.rollCount
  if panInProgress then return end
  local myCoords = GetEntityCoords(PlayerPedId())
  local timer = GetGameTimer()
  for _, coords in pairs(pannedCoords) do
    if (#(myCoords - coords.coords) < 2.5) and ((coords.time + (15 * 60000)) > timer) then
      TriggerEvent("DoLongHudText", "Try further away!", 2)
      return
    end
  end
  panInProgress = true
  Citizen.CreateThread(function()
    Citizen.Wait(16000)
    panInProgress = false
  end)
  -- local dict, anim = "amb@world_human_yoga@male@base", "base_a"
  local finished = exports["rd-ui"]:taskBarSkill(math.random(1500, 4500), math.random(10, 25))
  if finished ~= 100 then return end
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  if veh ~= 0 then return end
  if not IsEntityInWater(PlayerPedId()) then return end
  if IsPedSwimming(PlayerPedId()) or IsPedSwimmingUnderWater(PlayerPedId()) then return end
  local dict, anim = 'amb@world_human_bum_wash@male@high@idle_a', 'idle_a'
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Wait(0)
  end
  TaskPlayAnim(PlayerPedId(), dict, anim, 1.0, -1.0, -1, 1, false, false, false)
  Wait(800)
  TriggerEvent('attachItem', 'goldpantray')
  Wait(7000)
  ClearPedTasks(PlayerPedId())
  TriggerEvent('destroyProp')
  TriggerServerEvent("rd-goldpanning:getLoot", myCoords, rollCount)
  if math.random() < 0.05 then
    pannedCoords[#pannedCoords + 1] = { coords = myCoords, time = GetGameTimer() }
  end
  if math.random() > panConfig.degChance then return end
  TriggerEvent('inventory:DegenLastUsedItem', 1)
end)

AddEventHandler("rd-inventory:itemUsed", function(pItem)
  if pItem ~= "goldpanprobe" then return end
  panInProgress = true
  Citizen.CreateThread(function()
    Citizen.Wait(16000)
    panInProgress = false
  end)
  -- local dict, anim = "amb@world_human_yoga@male@base", "base_a"
  local finished = exports["rd-ui"]:taskBarSkill(math.random(1500, 4500), math.random(10, 25))
  if finished ~= 100 then return end
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  if veh ~= 0 then return end
  if not IsEntityInWater(PlayerPedId()) then return end
  if IsPedSwimming(PlayerPedId()) or IsPedSwimmingUnderWater(PlayerPedId()) then return end
  local dict, anim = 'amb@world_human_bum_wash@male@high@idle_a', 'idle_a'
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Wait(0)
  end
  TaskPlayAnim(PlayerPedId(), dict, anim, 1.0, -1.0, -1, 1, false, false, false)
  Wait(800)
  TriggerEvent('attachItem', 'goldpantray')
  Wait(7000)
  ClearPedTasks(PlayerPedId())
  TriggerEvent('destroyProp')
  TriggerServerEvent("rd-goldpanning:checkProbeSpot", GetEntityCoords(PlayerPedId()))
end)

