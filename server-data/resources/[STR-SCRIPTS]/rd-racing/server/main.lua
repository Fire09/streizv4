--Racing
  local BuiltMaps = {}
  local Races = {}
  
  RegisterServerEvent('racing-global-race')
  AddEventHandler('racing-global-race', function(map, laps, counter, reverseTrack, uniqueid, cid, raceName, startTime, mapCreator, mapDistance, mapDescription, street1, street2)
    Races[uniqueid] = { 
        ["identifier"] = uniqueid, 
        ["map"] = map, 
        ["laps"] = laps,
        ["counter"] = counter,
        ["reverseTrack"] = reverseTrack, 
        ["cid"] = cid, 
        ["racers"] = {}, 
        ["open"] = true, 
        ["raceName"] = raceName, 
        ["startTime"] = startTime, 
        ["mapCreator"] = mapCreator, 
        ["mapDistance"] = mapDistance, 
        ["mapDescription"] = mapDescription,
        ["raceComplete"] = false
    }
  
    TriggerEvent('racing:server:sendData', uniqueid, -1, 'event', 'open')
    local waitperiod = (counter * 1000)
    Wait(waitperiod)
    Races[uniqueid]["open"] = false
    -- if(math.random(1, 10) >= 5) then
    --     TriggerEvent("dispatch:svNotify", {
    --         dispatchCode = "10-94",
    --         firstStreet = street1,
    --         secondStreet = street2,
    --         origin = {
    --             x = BuiltMaps[map]["checkpoints"][1].x,
    --             y = BuiltMaps[map]["checkpoints"][1].y,
    --             z = BuiltMaps[map]["checkpoints"][1].z
    --         }
    -- })
    -- end
    TriggerEvent('racing:server:sendData', uniqueid, -1, 'event', 'close')
  end)
  
  RegisterServerEvent('racing-join-race')
  AddEventHandler('racing-join-race', function(identifier)
    local src = source
    local player = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    local playername = ""..char.first_name.." "..char.last_name..""
    Races[identifier]["racers"][cid] = {["name"] = PlayerName, ["cid"] = cid, ["total"] = 0, ["fastest"] = 0 }
    TriggerEvent('racing:server:sendData', identifier, src, 'event')
  end)
  
  RegisterServerEvent('race:completed2')
  AddEventHandler('race:completed2', function(fastestLap, overall, sprint, identifier)
    local src = source
    local player = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    local playername = ""..char.first_name.." "..char.last_name..""
    Races[identifier]["racers"][cid] = { ["name"] = PlayerName, ["cid"] = cid, ["total"] = overall, ["fastest"] = fastestLap}
    Races[identifier].sprint = sprint
    TriggerEvent('racing:server:sendData', identifier, -1, 'event')
  
    if not Races[identifier]["raceComplete"] then
        exports.oxmysql:execute("UPDATE racing_tracks SET races = races+1 WHERE id = '"..tonumber(Races[identifier].map).."'", function(results)
            if results.changedRows > 0 then
                Races[identifier]["raceComplete"] = true
            end
        end)
    end
  
    if(Races[identifier].sprint and Races[identifier]["racers"][cid]["total"]) then
        exports.oxmysql:execute("UPDATE racing_tracks SET fastest_sprint = "..tonumber(Races[identifier]["racers"][cid]["total"])..", fastest_sprint_name = '"..tostring(PlayerName).."' WHERE id = "..tonumber(Races[identifier].map).." and (fastest_sprint IS NULL or fastest_sprint > "..tonumber(Races[identifier]["racers"][cid]["total"])..")", function(results)
            if results.changedRows > 0 then
            end
        end)
    else
        exports.oxmysql:execute("UPDATE racing_tracks SET fastest_lap = "..tonumber(Races[identifier]["racers"][cid]["fastest"])..", fastest_name = '"..tostring(PlayerName).."' WHERE id = "..tonumber(Races[identifier].map).." and (fastest_lap IS NULL or fastest_lap > "..tonumber(Races[identifier]["racers"][cid]["fastest"])..")", function(results)
            if results.changedRows > 0 then
            end
        end)
    end
  end)
  
  
  RegisterServerEvent("racing:server:sendData")
  AddEventHandler('racing:server:sendData', function(pEventId, clientId, changeType, pSubEvent)
    local dataObject = {
        eventId = pEventId, 
        event = changeType,
        subEvent = pSubEvent,
        data = {}
    }
    if (changeType =="event") then
        dataObject.data = (pEventId ~= -1 and Races[pEventId] or Races)
    elseif (changeType == "map") then
        dataObject.data = (pEventId ~= -1 and BuiltMaps[pEventId] or BuiltMaps)
    end
    TriggerClientEvent("racing:data:set", -1, dataObject)
  end)
  
  function buildMaps(subEvent)
    local src = source
    subEvent = subEvent or nil
    BuiltMaps = {}
    exports.oxmysql:execute("SELECT * FROM racing_tracks", {}, function(result)
        for i=1, #result do
            local correctId = tostring(result[i].id)
            BuiltMaps[correctId] = {
                checkpoints = json.decode(result[i].checkpoints),
                track_name = result[i].track_name,
                creator = result[i].creator,
                distance = result[i].distance,
                races = result[i].races,
                fastest_car = result[i].fastest_car,
                fastest_name = result[i].fastest_name,
                fastest_lap = result[i].fastest_lap,
                fastest_sprint = result[i].fastest_sprint, 
                fastest_sprint_name = result[i].fastest_sprint_name,
                description = result[i].description
            }
        end
        local target = -1
        if(subEvent == 'mapUpdate') then
            target = src
        end
        TriggerEvent('racing:server:sendData', -1, target, 'map', subEvent)
    end)
  end
  
  RegisterServerEvent('racing-build-maps')
  AddEventHandler('racing-build-maps', function()
    buildMaps('mapUpdate')
  end)
  
  RegisterServerEvent('racing-map-delete')
  AddEventHandler('racing-map-delete', function(deleteID)
    exports.oxmysql:execute("DELETE FROM racing_tracks WHERE id = @id", {
        ['id'] = deleteID })
    Wait(1000)
    buildMaps()
  end)
  
  RegisterServerEvent('racing-retreive-maps')
  AddEventHandler('racing-retreive-maps', function()
    local src = source
    buildMaps('noNUI', src)
  end)
  
  RegisterServerEvent('racing-save-map')
  AddEventHandler('racing-save-map', function(currentMap,name,description,distanceMap)
    local src = source
    local player = exports['rd-base']:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local playername = char.first_name .." ".. char.last_name
  
    -- exports.oxmysql:execute("INSERT INTO racing_tracks_new ('checkpoints', 'creator', 'track_name', 'distance', 'description') VALUES (@currentMap, @creator, @trackname, @distance, @description)",
    -- {['currentMap'] = json.encode(currentMap), ['creator'] = playername, ['trackname'] = name, ['distance'] = distanceMap, ['description'] = description})
  
    exports.oxmysql:execute("INSERT INTO `racing_tracks` (`checkpoints`, `creator`, `track_name`, `distance`, `description`) VALUES ('"..json.encode(currentMap).."', '"..tostring(playername).."', '"..tostring(name).."', '"..distanceMap.."',  '"..description.."')", function(results)
        Wait(1000)
        -- buildMaps()
    end)
  end)
  
  RegisterServerEvent('phone:RemovePayPhoneMoney')
  AddEventHandler('phone:RemovePayPhoneMoney', function()
    local src = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:removeMoney(25)
  end)
  
  RegisterServerEvent('phone:RemovePhoneJobSourceSend')
  AddEventHandler('phone:RemovePhoneJobSourceSend', function(srcsent)
    local src = srcsent
    for i = 1, #YellowPageArray do
        if YellowPageArray[i]
        then 
          local a = tonumber(YellowPageArray[i]["src"])
          local b = tonumber(src)
  
          if a == b then
            table.remove(YellowPageArray,i)
          end
        end
    end
    TriggerClientEvent("YellowPageArray", -1 , YellowPageArray)
  end)
  
  RegisterNetEvent('phone:deleteYP')
  AddEventHandler('phone:deleteYP', function(number)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id
    local mynumber = getNumberPhone(cid)
    exports.oxmysql:execute('DELETE FROM phone_yp WHERE phoneNumber = @phoneNumber', {
        ['@phoneNumber'] = mynumber
    }, function (result)
        TriggerClientEvent('refreshYP', src)
    end)
  end)