 local mousenumbers = {
     [1] = 1,
     [2] = 2,
     [3] = 3, 
     [4] = 4, 
     [5] = 5, 
     [6] = 6, 
     [7] = 12, 
     [8] = 13, 
     [9] = 66, 
     [10] = 67, 
     [11] = 95, 
     [12] = 96,   
     [13] = 97,   
     [14] = 98,
     [15] = 169,
      [16] = 170,
   }
  
   local currentMap = {}
   local customMaps = {}
   local dst = 30.0
   local creatingMap = false
   local SetBlips = {}
   local particleList = {}
   local currentRaces = {}
   local JoinedRaces = {}
   local racing = false
   local racesStarted = 0
   local mylastid = "NA"
  
   Citizen.CreateThread(function()
     local focus = true
    
     while true do
  
       if guiEnabled then
         DisableControlAction(0, 1, guiEnabled) 
         DisableControlAction(0, 2, guiEnabled) 
         DisableControlAction(0, 14, guiEnabled) 
         DisableControlAction(0, 15, guiEnabled) 
         DisableControlAction(0, 16, guiEnabled) 
         DisableControlAction(0, 17, guiEnabled) 
         DisableControlAction(0, 99, guiEnabled) 
         DisableControlAction(0, 100, guiEnabled) 
         DisableControlAction(0, 115, guiEnabled) 
         DisableControlAction(0, 116, guiEnabled) 
         DisableControlAction(0, 142, guiEnabled) 
         DisableControlAction(0, 106, guiEnabled) 
         if IsDisabledControlJustReleased(0, 142) then 
           SendNUIMessage({type = "click"})
         end
  
       else
         mousemovement = 0
       end
  
       if selfieMode then
           if IsControlJustPressed(0, 177) then
             selfieMode = false
             DestroyMobilePhone()
             CellCamActivate(false, false)
           end
           HideHudComponentThisFrame(7)
           HideHudComponentThisFrame(8)
           HideHudComponentThisFrame(9)
           HideHudComponentThisFrame(6)
           HideHudComponentThisFrame(19)
           HideHudAndRadarThisFrame()
       else
         selfieMode = false
         DestroyMobilePhone()
         CellCamActivate(false, false)
       end 
  
       if creatingMap then
  
         local plycoords = GetEntityCoords(GetPlayerPed(-1))
  
         DrawMarker(25,plycoords.x,plycoords.y,plycoords.z,0,0,0,0,0,0,dst,dst,0.3001,69,255,255,255,0,0,0,0)
        
         if #currentMap == 0 then
           DrawText3Ds(plycoords.x,plycoords.y,plycoords.z,"[E] to add start point, up/down for size, phone to save or cancel.")
         else
           DrawText3Ds(plycoords.x,plycoords.y,plycoords.z,"[E] to Add, [Shift+E] to Remove, up/down for size, phone to save or cancel.")
         end
  
         if IsControlPressed(0,27) then
           dst = dst + .2
           if dst > 60.0 then
             dst = 60.0
           end
         end
  
         if IsControlPressed(0,173) then
           dst = dst - .2
           if dst < 4 then
             dst = 3.0
           end
         end
  
         if IsControlJustReleased(0,38) then
           if (IsControlPressed(0,21)) then
             PopLastCheckpoint()
           else
             AddCheckPoint()
           end
           Wait(1000)
         end
  
       end
       Citizen.Wait(1)
     end
   end)
  
   function StartMapCreation()
     currentMap = {}
     dst = 30.0;
     creatingMap = true
   end
  
   function CancelMap()
     creatingMap = false
   end
  
   function ClearBlips()
     for i = 1, #SetBlips do
       RemoveBlip(SetBlips[i])
     end
     SetBlips = {}
   end
  
   function AddCheckPoint()
     loadCheckpointModels()
     local plycoords = GetEntityCoords(GetPlayerPed(-1))
     local ballsdick = dst/2
     local fx,fy,fz = table.unpack(GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1),  ballsdick, 0.0, -0.25))
  
     local fx2,fy2,fz2 = table.unpack(GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0 - ballsdick, 0.0, -0.25))
    
     addCheckpointMarker(vector3(fx,fy,fz), vector3(fx2,fy2,fz2))
  
     local start = false
  
     if #currentMap == 0 then
       start = true
     end
  
     local checkcounter = #currentMap + 1
     currentMap[checkcounter] = { 
       ["flare1x"] = FUCKK(fx), ["flare1y"] = FUCKK(fy), ["flare1z"] = FUCKK(fz),
       ["flare2x"] = FUCKK(fx2), ["flare2y"] = FUCKK(fy2), ["flare2z"] = FUCKK(fz2),
       ["x"] = FUCKK(plycoords.x),  ["y"] = FUCKK(plycoords.y), ["z"] = FUCKK(plycoords.z-1.1), ["start"] = start, ["dist"] = ballsdick, 
     }
  
     local key = #SetBlips+1
     SetBlips[key] = AddBlipForCoord(plycoords.x,plycoords.y,plycoords.z)
     SetBlipAsFriendly(SetBlips[key], true)
     SetBlipSprite(SetBlips[key], 1)
     ShowNumberOnBlip(SetBlips[key], key)
     BeginTextCommandSetBlipName("STRING");
     AddTextComponentString(tostring("Checkpoint " .. key))
     EndTextCommandSetBlipName(SetBlips[key])
  
   end
  
   local checkpointMarkers = {}
   local isModelsLoaded = false
   function loadCheckpointModels()
     local models = {}
     models[1] = "prop_offroad_tyres02"
     models[2] = "prop_beachflag_01"
     for i = 1, #models do
       local checkpointModel = GetHashKey(models[i])
       RequestModel(checkpointModel)
       while not HasModelLoaded(checkpointModel) do
         Citizen.Wait(1)
       end
     end
     isModelsLoaded = true
   end
  
   function addCheckpointMarker(leftMarker, rightMarker)
     local model = #checkpointMarkers == 0 and 'prop_beachflag_01' or 'prop_offroad_tyres02'
  
     local checkpointLeft = CreateObject(GetHashKey(model), leftMarker, false, false, false)
     local checkpointRight = CreateObject(GetHashKey(model), rightMarker, false, false, false)
     checkpointMarkers[#checkpointMarkers+1] = {
       left = checkpointLeft,
       right = checkpointRight
     }
     PlaceObjectOnGroundProperly(checkpointLeft)
     SetEntityAsMissionEntity(checkpointLeft)
     PlaceObjectOnGroundProperly(checkpointRight)
     SetEntityAsMissionEntity(checkpointRight)
   end
  
   function LoadMapBlips(id, reverseTrack, laps)
     local id = tostring(id)
     ClearBlips()
     loadCheckpointModels()
     local maps = RPC.execute("racing:get:custom")
     if(maps[id].checkpoints ~= nil) then
       local checkpoints = maps[id].checkpoints
       if reverseTrack then
         local newCheckpoints = {}
         local count = 1
         for i=#checkpoints, 1, -1 do
           newCheckpoints[count] = checkpoints[i]
           count = count + 1
         end
         if laps ~= 0 then
           table.insert(newCheckpoints, 1, checkpoints[1])
           newCheckpoints[#newCheckpoints] = nil
         end
         checkpoints = newCheckpoints
       end
  
       for mId, map in pairs(checkpoints) do
         local key = #SetBlips+1
         SetBlips[key] = AddBlipForCoord(map["x"],map["y"],map["z"])
         SetBlipAsFriendly(SetBlips[key], true)
         SetBlipAsShortRange(SetBlips[key], true)
         SetBlipSprite(SetBlips[key], 1)
         ShowNumberOnBlip(SetBlips[key], key)
         BeginTextCommandSetBlipName("STRING");
         AddTextComponentString(tostring("Checkpoint " .. key))
         EndTextCommandSetBlipName(SetBlips[key])
  
         addCheckpointMarker(vector3(map["flare1x"], map["flare1y"], map["flare1z"]), vector3(map["flare2x"], map["flare2y"], map["flare2z"]))
       end
     end
   end

  
 function getCardinalDirectionFromHeading()
   local heading = GetEntityHeading(PlayerPedId())
   if heading >= 315 or heading < 45 then
       return "North Bound"
   elseif heading >= 45 and heading < 135 then
       return "West Bound"
   elseif heading >=135 and heading < 225 then
       return "South Bound"
   elseif heading >= 225 and heading < 315 then
       return "East Bound"
   end
 end
  
   function PopLastCheckpoint()
     if #currentMap > 1 then
       local lastCheckpoint = #currentMap
       SetEntityAsNoLongerNeeded(checkpointMarkers[lastCheckpoint].left)
       DeleteObject(checkpointMarkers[lastCheckpoint].left)
       SetEntityAsNoLongerNeeded(checkpointMarkers[lastCheckpoint].right)
       DeleteObject(checkpointMarkers[lastCheckpoint].right)
       RemoveBlip(SetBlips[lastCheckpoint])
       table.remove(checkpointMarkers)
       table.remove(currentMap)
       table.remove(SetBlips)
     end
   end
  
   function ShowText(text)
     TriggerEvent("DoLongHudText",text)
   end
     --function StartEvent(map, laps, counter, reverseTrack, raceName, startTime, mapCreator, mapDistance, mapDescription)

   function StartEvent(map, laps, counter, raceName, startTime)
     print("StartEvent", map, laps, counter, raceName, startTime)
     customMaps = RPC.execute("racing:get:custom")
     allCurRaces = RPC.execute("racing:get:races")

     local found = false
     local cid = exports["isPed"]:isPed("cid")
     for k,v in pairs(allCurRaces) do
       if tonumber(allCurRaces[k]["cid"]) == tonumber(cid) then
         found = true
       end
     end

     if found then 
       TriggerEvent("DoLongHudText", "You already have an active race!", 2)
       return 
     end

   local map = tostring(map)
   local laps = tonumber(laps)
   local counter = tonumber(counter)
   local mapCreator = customMaps[map]["creator"]
   local mapDistance = customMaps[map]["distance"]
   local mapDescription = customMaps[map]["description"] 
   local reverseTrack = false
  
   if map == 0 then
   ShowText("Pick a map or use the old racing system.")
   return
   end
  
   local mapCheckpoints = customMaps[map]["checkpoints"]
   local checkPointIndex = 1
   if reverseTrack and laps == 0 then checkPointIndex = #mapCheckpoints end
  
   local ped = GetPlayerPed(-1)
   local plyCoords = GetEntityCoords(ped)
   local dist = Vdist(mapCheckpoints[checkPointIndex]["x"],
        mapCheckpoints[checkPointIndex]["y"],
        mapCheckpoints[checkPointIndex]["z"], plyCoords.x,
        plyCoords.y, plyCoords.z)
  
   if dist > 140.0 then
   ShowText("You are too far away!")
   EndRace()
   return
   end
  
   ShowText("Successfully created race on " .. customMaps[map]["track_name"] .. " with " ..
   laps .. " laps!")
   racesStarted = racesStarted + 1
   local cid = exports["isPed"]:isPed("cid")
   local uniqueid = cid .. "-" .. racesStarted
  
   local s1, s2 = GetStreetNameAtCoord(mapCheckpoints[checkPointIndex].x,mapCheckpoints[checkPointIndex].y, mapCheckpoints[checkPointIndex].z)
   local street1 = GetStreetNameFromHashKey(s1)
   zone = tostring(GetNameOfZone(mapCheckpoints[checkPointIndex].x,mapCheckpoints[checkPointIndex].y,mapCheckpoints[checkPointIndex].z))
   local playerStreetsLocation = GetLabelText(zone)
   local dir = getCardinalDirectionFromHeading()
   local street1 = street1 .. ", " .. playerStreetsLocation
   local street2 = GetStreetNameFromHashKey(s2) .. " " .. dir
   RPC.execute("racing-global-race", map, laps, counter, uniqueid, cid, raceName, startTime, mapCreator,mapDistance, mapDescription, street1, street2)
   end
  
   function hudUpdate(pHudState, pHudData)
     pHudState = pHudState or 'finished'
     pHudData = pHudData or '{}'
     SendReactMessage("racingHud", {
       action = "update",
       hudState = pHudState,
       hudData = pHudData
     })
   end
  
   --   -- this function needs to run for every racer
   function RunRace(identifier)
     print("FUNC RUN RACE", identifier)
     raceMaps = RPC.execute("racing:get:custom")
     --RPC.execute("race:start", identifier)

     local found = false
     for k,v in pairs(currentRaces) do
      if tonumber(v.identifier) == tonumber(identifier) then
         found = k
       end
     end

     if not found then return false end

     print(json.encode(raceMaps))
     local map = currentRaces[found].map
     print("map", map)
     local laps = currentRaces[found].laps
     print("laps", laps)
     local counter = currentRaces[found].counter
     print("counter", counter)
     local sprint = false
  
     if laps == 0 then
         laps = 1
         sprint = true
     end
     local myLap = 0
  
     local checkpoints = #raceMaps[map]["checkpoints"]
     local mycheckpoint = 1
     local permacheckpoint = 0
     local ped = GetPlayerPed(-1)
  
     SetBlipColour(SetBlips[1], 3)
     SetBlipScale(SetBlips[1], 1.6)
  
     TriggerEvent("DoLongHudText","Race Starts in 3",14)
     PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
     Citizen.Wait(1000)
     TriggerEvent("DoLongHudText","Race Starts in 2",14)
     PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
     Citizen.Wait(1000)
     TriggerEvent("DoLongHudText","Race Starts in 1",14)
     PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
     Citizen.Wait(1000)
     PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
     TriggerEvent("DoLongHudText","GO!",14)
     hudUpdate("start",
               {isSprint = sprint, maxLaps = laps, maxCheckpoints = checkpoints})
     while myLap < laps + 1 and racing do
         Wait(1)
         local plyCoords = GetEntityCoords(ped)
         print(raceMaps[map]["checkpoints"][mycheckpoint]["x"],raceMaps[map]["checkpoints"][mycheckpoint]["y"], raceMaps[map]["checkpoints"][mycheckpoint]["z"])
         if (Vdist(raceMaps[map]["checkpoints"][mycheckpoint]["x"],raceMaps[map]["checkpoints"][mycheckpoint]["y"], raceMaps[map]["checkpoints"][mycheckpoint]["z"],plyCoords.x, plyCoords.y, plyCoords.z)) < raceMaps[map]["checkpoints"][mycheckpoint]["dist"] then
             SetBlipColour(SetBlips[mycheckpoint], 3)
             SetBlipScale(SetBlips[mycheckpoint], 1.0)
  
             -- PlaySound(-1, "CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
             mycheckpoint = mycheckpoint + 1
             permacheckpoint = permacheckpoint + 1

             local myPosition, totalRacers = RPC.execute("race:update:checkpoint", identifier, permacheckpoint) --mycheckpoint

             print("myPos: ", myPosition)
             print("totalRacers: ", totalRacers)

             -- send checkpoint update
  
             SetBlipColour(SetBlips[mycheckpoint], 2)
             SetBlipScale(SetBlips[mycheckpoint], 1.6)
             SetBlipAsShortRange(SetBlips[mycheckpoint - 1], true)
             SetBlipAsShortRange(SetBlips[mycheckpoint], false)
  
             if mycheckpoint > checkpoints then mycheckpoint = 1 end
  
             SetNewWaypoint(raceMaps[map]["checkpoints"][mycheckpoint]["x"],
                            raceMaps[map]["checkpoints"][mycheckpoint]["y"])
  
             if not sprint and mycheckpoint == 1 then
                 SetBlipColour(SetBlips[1], 2)
                 SetBlipScale(SetBlips[1], 1.6)
             end
  
             if not sprint and mycheckpoint == 2 then
                 myLap = myLap + 1
                 SetBlipColour(SetBlips[1], 3)
                 SetBlipScale(SetBlips[1], 1.0)
                 SetBlipColour(SetBlips[2], 2)
                 SetBlipScale(SetBlips[2], 1.6)
             elseif sprint and mycheckpoint == 1 then
                 myLap = myLap + 2
             end
  
             hudUpdate("update",
                       {curLap = myLap, curCheckpoint = (mycheckpoint - 1), curPos = myPosition, totalPos = totalRacers})
         end
     end
  
     hudUpdate("finished", {eventId = identifier, curPos = myPosition, totalPos = totalRacers})
  
     PlaySound(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
     TriggerEvent("DoLongHudText","You have finished!",1)
     Wait(10000)
     racing = false
     hudUpdate("clear")
     ClearBlips()
     RemoveCheckpoints()
   end
  
   function EndRace()
     ClearBlips()
     RemoveCheckpoints()
   end
  
   function RemoveCheckpoints()
     for i = 1, #checkpointMarkers do
         SetEntityAsNoLongerNeeded(checkpointMarkers[i].left)
         DeleteObject(checkpointMarkers[i].left)
         SetEntityAsNoLongerNeeded(checkpointMarkers[i].right)
         DeleteObject(checkpointMarkers[i].right)
         checkpointMarkers[i] = nil
     end
   end
  
   function FUCKK(num)
     local new = math.ceil(num*100)
     new = new / 100
     return new
   end
  
   function SaveMap(name,description)
  
     local distanceMap = 0.0
     for i = 1, #currentMap do
       if i == #currentMap then
         distanceMap = Vdist(currentMap[i]["x"],currentMap[i]["y"],currentMap[i]["z"], currentMap[1]["x"],currentMap[1]["y"],currentMap[1]["z"]) + distanceMap
       else
         distanceMap = Vdist(currentMap[i]["x"],currentMap[i]["y"],currentMap[i]["z"], currentMap[i+1]["x"],currentMap[i+1]["y"],currentMap[i+1]["z"]) + distanceMap
       end
     end
     distanceMap = math.ceil(distanceMap)
  
     if #currentMap > 1 then
       TriggerEvent("DoLongHudText","The map is being processed and should be available shortly.",2)
       TriggerServerEvent("racing-save-map", currentMap, name, description, distanceMap)
     else
       TriggerEvent("DoLongHudText","Failed due to lack of checkpoints",2)
     end
     currentMap = {}
     creatingMap = false
   end
  
   RegisterNUICallback('racing:events:list', function()
     local cid = exports["isPed"]:isPed("cid")
     if exports["rd-inventory"]:hasEnoughOfItem("racingusb0",1,false) then
     local canCreate = RPC.execute("rd-business:canCreateRaces", cid, "ug_racing")
       SendNUIMessage({
         action = "racing:events:list",
         races = currentRaces,
         canMakeMap = canCreate
       });
      TriggerServerEvent("racing-retreive-maps")
      else
         TriggerEvent("DoLongHudText", "You need something...", 2)
     end
   end)

   RegisterNUICallback('getRacingData', function(data, cb)
     print("getRacingData")
     local races = RPC.execute("racing:get:races")
     local tracks = RPC.execute("racing:get:tracks")

     local curRaces = races or {}
     local curTracks = tracks or {}

     currentRaces = curRaces
     customMaps = curTracks

     print(json.encode(tracks))
     print(json.encode(curTracks))

     cb({races = curRaces, tracks = curTracks, cid = exports["isPed"]:isPed("cid")})
   end)

   RegisterNUICallback('startRace', function(data, cb)
     print("start race", data.id)

     RPC.execute("race:start", data.id)
     RunRace(tonumber(data.id))
   end)

   RegisterNetEvent("startRace")
   AddEventHandler("startRace", function(identifier)
     RunRace(identifier)
   end)

   RegisterNetEvent("resetRace")
   AddEventHandler("resetRace", function(identifier)
     hudUpdate('clear')
     ClearBlips()
     RemoveCheckpoints()
     racing = false
     JoinedRaces[identifier] = false
   end)

   RegisterNUICallback('deleteRace', function(data, cb)
     RPC.execute("racing:delete:race", data.id)
     hudUpdate('clear')
     ClearBlips()
     RemoveCheckpoints()
     racing = false
     JoinedRaces[id] = false
   end)

   RegisterNUICallback('setGps', function(data, cb)
     print(data.id)
     local x, y = RPC.execute("racing:set:gps", data.id)
     print(x, y)
     TriggerEvent("DoLongHudText", "Updated GPS.", 1)
     SetNewWaypoint(x, y)
   end)

   RegisterNUICallback('setTrackGps', function(data, cb)
     print(data.map)
     local x, y = RPC.execute("racing:tracks:set:gps", data.map)
     print(x, y)
     TriggerEvent("DoLongHudText", "Updated GPS.", 1)
     SetNewWaypoint(x, y)
   end)

   RegisterNetEvent("RacingUpdate")
   AddEventHandler("RacingUpdate", function()
     print("RacingUpdate")
     local races = RPC.execute("racing:get:races")
     print(json.encode(races))
     local tracks = RPC.execute("racing:get:tracks")

     local curRaces = races or {}
     local curTracks = tracks or {}

     currentRaces = curRaces
     customMaps = curTracks

     SendNUIMessage({update = true, updateapp = "racing", races = currentRaces, maps = customMaps})
     SendReactMessage("updateRacing", {
         races = curRaces,
         tracks = curTracks
     })
 end)
  
    RegisterNUICallback('racing:events:list', function()
      local rank = exports["isPed"]:GroupRank("ug_racing")
      SendNUIMessage({
        action = "racing:events:list",
          races = currentRaces,
          canMakeMap = (rank >= 4 and true or false)
        });
        TriggerServerEvent("racing-retreive-maps")
    end)
  
   RegisterNUICallback('racing:events:highscore', function()
     TriggerServerEvent("racing-retreive-maps")
     Wait(300)
     local highScoreObject = {}
     for k,v in pairs(customMaps) do
       highScoreObject[k] = {
         fastestLap = v.fastest_lap,
         fastestName = v.fastest_name,
         fastestSprint = v.fastest_sprint,
         fastestSprintName = v.fastest_sprint_name,
         map = v.track_name,
         noOfRaces = v.races,
         mapDistance = v.distance
       }
     end
  
     SendNUIMessage({
       action = "racing:events:highscore",
       highScoreList = highScoreObject
     });
   end)
  
   RegisterNUICallback('racing:event:setup', function()
     TriggerServerEvent("racing-build-maps")
   end)
  
   RegisterNUICallback('racing:event:leave', function(data)
     local id = data.id
     hudUpdate('clear')
     ClearBlips()
     RemoveCheckpoints()
     racing = false
     JoinedRaces[id] = false
     RPC.execute("racing:leave:race", id)
     ShowText("Leaving Race!")
   end)
  
   RegisterNUICallback('racing:event:join', function(data)
     print(data.id)
     currentRaces = RPC.execute("racing:get:races")
     print(json.encode(currentRaces))
     customMaps = RPC.execute("racing:get:custom")

     local found = false
     local cid = exports["isPed"]:isPed("cid")
     for k,v in pairs(currentRaces) do
       if currentRaces[k]["racers"][cid] then
         found = true
       end
     end

     if found then
       TriggerEvent("DoLongHudText", "You are already in a race!", 2)
       return
     end
    
     RemoveCheckpoints()
     local id = tonumber(data.id)
     local ped = GetPlayerPed(-1)
     local IsPlayerDriver = GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1)), -1) == GetPlayerPed(-1)
     local plyCoords = GetEntityCoords(ped)
  
     if not IsPlayerDriver then
         TriggerEvent("DoLongHudText","You must be the driver of the vehicle to join this race.",2)
         return
     end

     print(currentRaces[id]["map"])
  
     local mapCheckpoints = customMaps[currentRaces[id]["map"]]["checkpoints"]
     local checkPointIndex = 1
     if currentRaces[id]["reverseTrack"] and currentRaces[id]["laps"] == 0 then
         checkPointIndex = #mapCheckpoints
     end
  
     if Vdist(mapCheckpoints[checkPointIndex]["x"],mapCheckpoints[checkPointIndex]["y"],mapCheckpoints[checkPointIndex]["z"], plyCoords.x, plyCoords.y,plyCoords.z) < 40 then
         if currentRaces[id]["open"] and not racing then
             racing = true
             JoinedRaces[id] = true
             TriggerServerEvent("racing-join-race", id)
             RPC.execute("racing:join:race", id)
             hudUpdate('starting')
             ShowText("Joining Race!")
             LoadMapBlips(currentRaces[id]["map"],currentRaces[id]["reverseTrack"],currentRaces[id]["laps"])
         else
             if (JoinedRaces[id] and not racing) then
                 racing = true
                 hudUpdate('starting')
             else
                 ShowText("This race is closed or you are already in it!")
             end
         end
     else
         ShowText("You are too far away!")
     end
   end)
  
   RegisterNUICallback('racing:event:start', function(data)
     StartEvent(data.raceMap, data.raceLaps, data.raceCountdown, data.reverseTrack, data.raceName, data.raceStartTime, data.mapCreator, data.mapDistance, data.mapDescription)
     Wait(500)
     SendNUIMessage({action = "racing:events:list", races = currentRaces});
   end)

   RegisterNUICallback("createRace", function(data, cb)
     print("createRace NUI", data.raceMap, data.raceLaps, data.raceCountdown, data.raceName, data.raceStartTime)
     StartEvent(data.raceMap, data.raceLaps, data.raceCountdown, data.raceName, data.raceStartTime)
     cb(true)  
 end)
  
   RegisterNUICallback('race:completed', function(data)
     JoinedRaces[data.identifier] = nil
     TriggerServerEvent("race:completed2",data.fastestlap, data.overall, data.sprint, data.identifier)
     EndRace()
   end)
  
   RegisterNUICallback('racing:map:create', function()
     StartMapCreation()
   end)
  
   RegisterNUICallback('racing:map:load', function(data)
     ClearBlips()
     RemoveCheckpoints()
     if(data.id ~= nil) then
       LoadMapBlips(data.id)
     end
   end)
  
   RegisterNUICallback('racing:map:delete', function(data)
     ClearBlips()
     RemoveCheckpoints()
     if data.id ~= "0" then
       TriggerServerEvent("racing-map-delete",customMaps[tonumber(data.id)]["dbid"])
     end
   end)
  
   RegisterNUICallback('racing:map:removeBlips', function()
     EndRace()
   end)
  
   RegisterNUICallback('racing:map:cancel', function()
     EndRace()
     CancelMap()
   end)
  
   RegisterNUICallback('racing:map:save', function(data)
     EndRace()
     SaveMap(data.name,data.desc)
   end)
  
   RegisterNetEvent('racing:data:set')
   AddEventHandler('racing:data:set', function(data)
     if(data.event == "map") then
       if (data.eventId ~= -1) then
         customMaps[data.eventId] = data.data
       else
         customMaps = data.data
         if(data.subEvent == nil or data.subEvent ~= "noNUI") then
           SendNUIMessage({
             action = 'racing-start',
             maps = customMaps
           })
         end
       end
     elseif (data.event == "event") then
       if (data.eventId ~= -1) then
         currentRaces[data.eventId] = data.data
         if JoinedRaces[data.eventId] and racing and data.subEvent == "close" then
           RunRace(data.eventId)
         end
         SendNUIMessage({
           action = "racing:event:update",
           eventId = data.eventId,
           raceData = currentRaces[data.eventId]
         })
       else
         currentRaces = data.data
         SendNUIMessage({
           action = "racing:event:update",
           raceData = currentRaces
         })
       end
     end
   end)
  
   RegisterNetEvent('racing:clearFinishedRaces')
   AddEventHandler('racing:clearFinishedRaces', function(id)
     if(JoinedRaces[id] ~= nil) then
       JoinedRaces[id] = nil
       ClearBlips()
       RemoveCheckpoints()
     end
   end)