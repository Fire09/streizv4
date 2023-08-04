Citizen.CreateThread(function()
  exports["rd-polytarget"]:AddBoxZone("cerb_indsutries_craft", vector3(221.0, -986.58, -99.0), 1.6, 1, {
    heading=0,
    minZ=-99.4,
    maxZ=-98.6,
  })
  exports["rd-polytarget"]:AddBoxZone("cerb_indsutries_craft_cia", vector3(1612.29, 2656.53, -158.27), 1, 1, {
    heading=270,
    minZ=-158.27,
    maxZ=-157.47,
  })
  exports["rd-polytarget"]:AddBoxZone("cerb_indsutries_craft_arena", vector3(5520.87, 5985.68, 590.0), 1, 1, {
    heading=0,
    minZ=589.8,
    maxZ=590.6,
  })
  exports["rd-polyzone"]:AddBoxZone("cerb_armory_elevator_shaft", vector3(1630.6083984, 2659.0908203, -70.3896408), 8.2, 15.2, {
    heading=0,
    minZ=-164.4,
    maxZ=20.8,
  })

  exports["rd-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft", {{
    id = 'ci_craft_wingsuits',
    label = 'Wingsuits',
    icon = 'circle',
    event = "rd-cerb-industries:craftStuff",
    parameters =  { id = "420ci_wingsuits" },
  }}, { distance = { radius = 1.5 } })

  exports["rd-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft_cia", {{
    id = 'cia_craft',
    label = 'Missles n Shit',
    icon = 'circle',
    event = "rd-cerb-industries:craftStuff",
    parameters =  { id = "420cia_stuff" },
  }}, { distance = { radius = 1.5 } })

  exports["rd-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft", {{
    id = 'ci_craft_misc',
    label = 'Misc',
    icon = 'circle',
    event = "rd-cerb-industries:craftStuff",
    parameters =  { id = "420ci_misc", type = "Shop" },
  }}, { distance = { radius = 1.5 } })

  exports["rd-interact"]:AddPeekEntryByPolyTarget("cerb_indsutries_craft_arena", {{
    id = 'ci_craft_misc',
    label = 'Misc',
    icon = 'circle',
    event = "rd-cerb-industries:craftStuff",
    parameters =  { id = "420ci_misc", type = "Shop" },
  }}, { distance = { radius = 1.5 } })
end)

AddEventHandler("rd-cerb-industries:craftStuff", function(p1, p2, p3)
  if not p1 then return end
  if not p1.id then return end
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "cerberus_industries"} })
  if not jobAccess then
    TriggerEvent("DoLongHudText", "You cannot use that", 2)
    return
  end
  TriggerEvent("server-inventory-open", p1.id, p1.type and p1.type or "Craft")
end)

--

local iplStates = {}
local interiorCoords = {
  { -137.66,-610.05,40.43 },
}

local function updateIpls()
  local intIds = {}
  for k, v in pairs(iplStates) do
    local coords = interiorCoords[v.coordIndex]
    local interiorId = v.interiorId or GetInteriorAtCoords(coords[1], coords[2], coords[3])
    intIds[interiorId] = true
    if v.state then
      ActivateInteriorEntitySet(interiorId, k)
    else
      DeactivateInteriorEntitySet(interiorId, k)
    end
  end
  for interiorId, v in pairs(intIds) do
    RefreshInterior(interiorId)
  end
end

RegisterNetEvent("rd-cbc:iplStatesUpdate", function(pStates)
  iplStates = pStates
  updateIpls()
end)

Citizen.CreateThread(function()
  TriggerServerEvent("rd-cbc:getIplsStates")
end)

local inElevatorPolyzone = false
AddEventHandler("rd-polyzone:enter", function(zone, data)
  if zone ~= "cerb_armory_elevator_shaft" then return end
  inElevatorPolyzone = true
end)

AddEventHandler("rd-polyzone:exit", function(zone)
  if zone ~= "cerb_armory_elevator_shaft" then return end
  inElevatorPolyzone = false
end)

-- 
local intCoords = vector3(1626.065, 2657.826, 16.15353)
local elevatorHash = GetHashKey("np_bunker_elevator")
local elevatorEntity = nil
AddEventHandler("rd-objects:objectCreated", function(pObject, pEntity)
  if pObject.data.model ~= elevatorHash then return end
  elevatorEntity = pEntity
  while elevatorEntity and DoesEntityExist(elevatorEntity) do
    local intAtCoords = GetInteriorAtCoords(intCoords)
    ForceRoomForEntity(elevatorEntity, intAtCoords, 1277052448)
    Wait(100)
  end
end)

AddEventHandler('rd-objects:objectDeleted', function(pObject, pHandle)
  if pObject.data.model ~= elevatorHash then return end
  elevatorEntity = nil
end)

Citizen.CreateThread(function()
  if not elevatorEntity then return end
  SetEntityVisible(elevatorEntity, true, 0)
end)

Citizen.CreateThread(function()
  local forced = false
  while true do
    local intAtCoords = GetInteriorAtCoords(intCoords)
    local pedCoords = GetEntityCoords(PlayerPedId())
    local pedInt = GetInteriorAtCoords(pedCoords)
    local dist = #(pedCoords - intCoords)
    if (not forced) and pedInt == intAtCoords and inElevatorPolyzone then
      forced = true
      ForceRoomForEntity(PlayerPedId(), intAtCoords, 1277052448)
      ForceRoomForGameViewport(intAtCoords, 1277052448)
    elseif forced and (not inElevatorPolyzone) then
      forced = false
      local roomId = GetRoomKeyFromEntity(PlayerPedId())
      ForceRoomForEntity(PlayerPedId(), intAtCoords, roomId)
      ForceRoomForGameViewport(intAtCoords, roomId)
    end
    if dist > 100 then
      Wait(5000)
    end
    Wait(100)
  end
end)

-- local topCoords = vector3(1629.622, 2658.587, 16.39374)
-- local bottomCoords = vector3(1629.622, 2658.587, -158.0403)
-- local topBottomDiff = math.abs(topCoords.z) + math.abs(bottomCoords.z)
-- local moveDuration = 2 * 60
-- local timePlaces = {}
-- RegisterNetEvent("rd-cia:elevator", function(pDir)
--   local startTime = GetGameTimer()
--   local beginZ = (pDir == "down" and topCoords.z or bottomCoords.z) + 0.0
--   local endZ = (pDir == "down" and bottomCoords.z or topCoords.z) + 0.0
--   local segments = moveDuration * 20
--   local diffPerSegment = topBottomDiff / segments
--   local loopCount = 0
--   local segmentPortions = {}
--   while loopCount < segments do
--     local sIdx = #segmentPortions + 1
--     if pDir == "down" then
--       segmentPortions[sIdx] = beginZ - (diffPerSegment * sIdx)
--     else
--       segmentPortions[sIdx] = beginZ + (diffPerSegment * sIdx)
--     end
--     loopCount = loopCount + 1
--   end
--   local idx = 1
--   local nextZ = segmentPortions[idx]
--   local nextZSwapped = false
--   Citizen.CreateThread(function()
--     while DoesEntityExist(elevatorEntity) and segmentPortions[idx] do
--       nextZ = segmentPortions[idx]
--       nextZSwapped = true
--       idx = idx + 1
--       Wait(50)
--     end
--     nextZ = endZ
--   end)
--   Citizen.CreateThread(function()
--     local currZ = beginZ
--     local isUpOrDown = function()
--       if pDir == "down" then
--         return currZ > nextZ
--       end
--       return currZ < nextZ
--     end
--     while currZ ~= endZ do
--       if nextZSwapped then
--         nextZSwapped = false
--         currZ = nextZ - diffPerSegment
--       else if pDir == "down" then
--         if currZ > nextZ then
--           currZ = currZ - 
--         end
--       else
--         if currZ < nextZ then
--           currZ = currZ + 
--         end
--       end
--       SetEntityCoords(elevatorEntity, bottomCoords.x, bottomCoords.y, currZ)
--       Wait(0)
--     end
--   end)
--   -- local loopNewZ = newZ
--   -- while topBottomDiff > math.abs(loopNewZ) do
--   --   local currPlaces = #timePlaces + 1
--   --   local calcZ = ((topBottomDiff / moveDuration) * 0.05) * (currPlaces + 1)
--   --   if (pDir == "down") then
--   --     loopNewZ = loopNewZ - calcZ
--   --   else
--   --     loopNewZ = loopNewZ + calcZ
--   --   end
--   --   timePlaces[#timePlaces + 1] = {
--   --     time = startTime + (50 * currPlaces),
--   --     z = loopNewZ,
--   --   }
--   -- end
--   -- print(json.encode(timePlaces), startTime)
--   -- local upOrDown = function()
--   --   if pDir == "down" then
--   --     newZ = newZ - gapSegmentDiff
--   --     return newZ > endCoords.z
--   --   else -- up
--   --     newZ = newZ + gapSegmentDiff
--   --     return newZ < startCoords.z
--   --   end
--   -- end
-- end)

-- Citizen.CreateThread(function()
--   local propName = "np_bunker_elevator"
--   print(GetHashKey(propName))
--   local startZ = 16.39374
--   local endZ = -158.0566
--   local topCoords = vector3(1629.622, 2658.587, 16.39374)
--   local bottomCoords = vector3(1629.622, 2658.587, -158.0566)
--   local obj = GetClosestObjectOfType(topCoords, 10.0, GetHashKey(propName), true, false, false)
--   if obj == 0 or obj == -1 then return end
--   FreezeEntityPosition(obj, true)
--   local dir = "down"
--   if dir == "down" then
--     while #(topCoords - bottomCoords) > 0.1 do
--       startZ = startZ - 0.01
--       SetEntityCoords(obj, topCoords.x, topCoords.y, startZ)
--       Wait(0)
--     end
--   else
--     while #(topCoords - bottomCoords) > 0.01 do
--       endZ = endZ + 0.1
--       SetEntityCoords(obj, bottomCoords.x, bottomCoords.y, endZ)
--       Wait(0)
--     end
--   end
-- end)
