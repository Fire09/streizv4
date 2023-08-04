
local BuiltMaps = {}
local Races = {}

RegisterCommand("testrace", function()
    Races[#Races + 1] = {
        identifier = #Races + 1,
        map = "Airport 2.0",
        laps = 3,
        counter = 10000,
        reverseTrack = false,
        cid = 700,
        racers = {},
        open = true,
        raceName = "Test Name",
        startTime = 10000,
        mapCreator = "cool",
        mapDistance = "500",
        mapDescription = "Swag",
        raceComplete = false
    }

    TriggerClientEvent("RacingUpdate", -1)
end)

RegisterCommand("testracers", function()
    Races[1234567]["racers"][699] = {["name"] = "Kevin Malagnaggi", ["cid"] = 699, ["total"] = 0, ["fastest"] = 0, ["checkpoints"] = 10 }
    Races[1234567]["racers"][700] = {["name"] = "Joe Mama", ["cid"] = 700, ["total"] = 0, ["fastest"] = 0, ["checkpoints"] = 5 }
end)

RegisterCommand("race:print", function()    
    local racers = {}
    local positions = {}
    for k,v in pairs(Races[1234567]["racers"]) do
        table.insert(racers, v)
    end

    table.sort(racers, function(a,b) return a.checkpoints > b.checkpoints end)
    local index = 0
    for i,v in ipairs(racers) do 
        index = index + 1
        positions[v.cid] = i
    end

    return positions[cid], index
end)

RPC.register("race:update:checkpoint", function(pSource, pId, pTotalCheckPoints)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local char = user:getCurrentCharacter()
    local identifier = pId.param

    local found = false
    for k,v in pairs(Races) do
      if tonumber(v.identifier) == tonumber(identifier) then
        found = k
      end
    end

    if not found then return false end

    local cid = tostring(char.id)
    local curCheckpoints = tonumber(pTotalCheckPoints.param)
    Races[found]["racers"][cid]["checkpoints"] = curCheckpoints

    local racers = {}
    local positions = {}
    for k,v in pairs(Races[found]["racers"]) do
        table.insert(racers, v)
    end

    table.sort(racers, function(a,b) return a.checkpoints > b.checkpoints end)
    local index = 0
    for i,v in ipairs(racers) do 
        index = index + 1
        positions[v.cid] = i
    end

    return positions[cid], index
end)

RPC.register('racing-global-race', function(pSource, pMap, pLaps, pCounter, pUniqueId, pCid, pRaceName, pStartTime, pMapCreator, pMapDistance, pMapDescription, street1, street2)
    print("racing-global-race")
    Races[#Races + 1] = { 
        ["identifier"] = #Races + 1, 
        ["map"] = pMap.param, 
        ["laps"] = pLaps.param,
        ["counter"] = pCounter.param,
        ["reverseTrack"] = nil,
        ["cid"] = pCid.param, 
        ["racers"] = {}, 
        ["open"] = true, 
        ["raceName"] = pRaceName.param, 
        ["startTime"] = pStartTime.param, 
        ["mapCreator"] = pMapCreator.param, 
        ["mapDistance"] = pMapDistance.param,
        ["mapDescription"] = pMapDescription.param,
        ["raceComplete"] = false
    }
    local waitperiod = (pCounter.param * 1000)
    Wait(waitperiod)
    Races[pUniqueId.param]["open"] = false
     if(math.random(1, 10) >= 5) then
         TriggerEvent("dispatch:svNotify", {
             dispatchCode = "10-94",
             firstStreet = street1,
             secondStreet = street2,
             origin = {
                 x = BuiltMaps[map]["checkpoints"][1].x,
                 y = BuiltMaps[map]["checkpoints"][1].y,
                 z = BuiltMaps[map]["checkpoints"][1].z
             }
     })
     end
    TriggerClientEvent("RacingUpdate", -1) 
end)

RPC.register("racing:get:races", function(pSource)
    return Races
end)

RPC.register("racing:join:race", function(pSource, pId)
    local identifier = pId.param

    local found = false
    for k,v in pairs(Races) do
      if tonumber(v.identifier) == tonumber(identifier) then
        found = k
      end
    end

    if not found then return false end

    print("found race")

    if not Races[found]["open"] then return end

    print("race is open")

    local src = pSource
    print("src", src)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = tostring(char.id) 
    print("cid", cid)
    local name = char.first_name .. " " .. char.last_name
    print("name", name)
    Races[found]["racers"][cid] = {["src"] = src, ["name"] = name, ["cid"] = cid, ["total"] = 0, ["fastest"] = 0 }
    print(json.encode(Races))
    print(json.encode(Races[found]["racers"]))

    print("1")

    print(json.encode(Races[found]["racers"][cid]))
    TriggerClientEvent("RacingUpdate", -1)

end)

RPC.register("racing:leave:race", function(pSource, pId)
    print("racing:leave:race", pId.param)
    local src = pSource
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = tostring(char.id)
    local identifier = pId.param

    local found = false
    for k,v in pairs(Races) do
      if tonumber(v.identifier) == tonumber(identifier) then
        found = k
      end
    end

    if not found then return false end

    print("found race")

    if Races[found]["racers"][cid] then
        print("found racer cid, nil it out")
        Races[found]["racers"][cid] = nil
    end
    TriggerClientEvent("RacingUpdate", -1)
end)

RPC.register("race:start", function(pSource, pId)
    print("race start")
    local identifier = pId.param
    print(identifier)

    local found = false
    for k,v in pairs(Races) do
      if tonumber(v.identifier) == tonumber(identifier) then
        found = k
      end
    end

    if not found then return false end

    if Races[found] then
        print("if identifier, set open to false")
    Races[found]["open"] = false
    end
    print("update phone")
    TriggerClientEvent("RacingUpdate", -1) 


    print("send user run race")

    for k,v in pairs(Races[found]["racers"]) do
        TriggerClientEvent("startRace", tonumber(v.src), identifier)
    end
end)

RegisterCommand("racestart", function()
    if Races[1234567] then
    Races[1234567]["open"] = false
    end

    TriggerClientEvent("RacingUpdate", -1)
end)

RPC.register("racing:delete:race", function(pSource, pId)
    local identifier = pId.param

    local found = false
    for k,v in pairs(Races) do
      if tonumber(v.identifier) == tonumber(identifier) then
        found = k
      end
    end

    if not found then return false end

    for k,v in pairs(Races[found]["racers"]) do
        TriggerClientEvent("resetRace", tonumber(v.src), identifier)
    end

    if Races[found] then
        Races[found] = nil
    end

    TriggerClientEvent("RacingUpdate", -1)
end)

RPC.register("racing:tracks:set:gps", function(pSource, pMap)
    print("racing:tracks:set:gps")
    local map = tostring(pMap.param)
    AllMaps = {}
    local data = Await(SQL.execute("SELECT * FROM racing_tracks",{}))
    for i = 1, #data do
        local correctId = tostring(data[i].track_name)
        AllMaps[correctId] = {
            checkpoints = json.decode(data[i].checkpoints),
            track_name = data[i].track_name,
            creator = data[i].creator,
            distance = data[i].distance,
            races = data[i].races,
            fastest_car = data[i].fastest_car,
            fastest_name = data[i].fastest_name,
            fastest_lap = data[i].fastest_lap,
            fastest_sprint = data[i].fastest_sprint, 
            fastest_sprint_name = data[i].fastest_sprint_name,
            description = data[i].description
        }
    end

    local x = tonumber(AllMaps[map]["checkpoints"][1]["x"])
    local y = tonumber(AllMaps[map]["checkpoints"][1]["y"])

    print(x, y)

    return x, y
end)

RPC.register("racing:set:gps", function(pSource, pId)
    print("racing:set:gps")
    print(pId.param)
    local identifier = tonumber(pId.param)
    print(identifier)
    local map = Races[identifier]["map"]

    AllMaps = {}
    local data = Await(SQL.execute("SELECT * FROM racing_tracks",{}))
    for i = 1, #data do
        local correctId = tostring(data[i].track_name)
        AllMaps[correctId] = {
            checkpoints = json.decode(data[i].checkpoints),
            track_name = data[i].track_name,
            creator = data[i].creator,
            distance = data[i].distance,
            races = data[i].races,
            fastest_car = data[i].fastest_car,
            fastest_name = data[i].fastest_name,
            fastest_lap = data[i].fastest_lap,
            fastest_sprint = data[i].fastest_sprint, 
            fastest_sprint_name = data[i].fastest_sprint_name,
            description = data[i].description
        }
    end

    local x = tonumber(AllMaps[map]["checkpoints"][1]["x"])
    local y = tonumber(AllMaps[map]["checkpoints"][1]["y"])

    print(x, y)

    return x, y
end)

RegisterServerEvent('race:completed2')
AddEventHandler('race:completed2', function(fastestLap, overall, sprint, identifier)
    local src = source
    local player = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = tostring(char.id)
    local playername = ""..char.first_name.." "..char.last_name..""

    local found = false
    for k,v in pairs(Races) do
      if tonumber(v.identifier) == tonumber(identifier) then
        found = k
      end
    end
   
    local index = 0
    if Races[found] then
    for k,v in pairs(Races[found]["racers"]) do
        index = index + 1
    end
    end

    Races[found]["racers"][cid] = { ["name"] = PlayerName, ["cid"] = cid, ["total"] = overall, ["fastest"] = fastestLap}
    Races[found].sprint = sprint
    TriggerEvent('racing:server:sendData', found, -1, 'event')

    if index > 2 then
    local buzzamount = 10

    local checkWallet = Await(SQL.execute("SELECT COUNT(*) AS total FROM user_crypto WHERE cryptoid = @cryptoid AND cryptocid = @cryptocid", {
        ["cryptoid"] = 2,
        ["cryptocid"] = char.id,
    }))

    if checkWallet[1].total > 0 then
        local update = Await(SQL.execute("UPDATE user_crypto SET cryptoamount = cryptoamount + @amount WHERE cryptoid = @cryptoid AND cryptocid = @cryptocid", {
            ["amount"] = buzzamount,
            ["cryptoid"] = 2,
            ["cryptocid"] = char.id
        }))
    else
        local insert = Await(SQL.execute("INSERT INTO user_crypto (cryptoid, cryptoamount, cryptocid) VALUES (@cryptoid, @cryptoamount, @cryptocid)",{
            ["cryptoid"] = 2,
            ["cryptoamount"] = buzzamount,
            ["cryptocid"] = char.id
        }))
    end
    end

    if not Races[found]["raceComplete"] then
        exports.oxmysql:execute("UPDATE racing_tracks SET races = races+1 WHERE id = '"..tonumber(Races[found].map).."'", function(results)
            if results.changedRows > 0 then
                Races[found]["raceComplete"] = true
            end
        end)
    end

    if(Races[found].sprint and Races[found]["racers"][cid]["total"]) then
        exports.oxmysql:execute("UPDATE racing_tracks SET fastest_sprint = "..tonumber(Races[found]["racers"][cid]["total"])..", fastest_sprint_name = '"..tostring(PlayerName).."' WHERE id = "..tonumber(Races[found].map).." and (fastest_sprint IS NULL or fastest_sprint > "..tonumber(Races[found]["racers"][cid]["total"])..")", function(results)
            if results.changedRows > 0 then
            end
        end)
    else
        exports.oxmysql:execute("UPDATE racing_tracks SET fastest_lap = "..tonumber(Races[found]["racers"][cid]["fastest"])..", fastest_name = '"..tostring(PlayerName).."' WHERE id = "..tonumber(Races[found].map).." and (fastest_lap IS NULL or fastest_lap > "..tonumber(Races[found]["racers"][cid]["fastest"])..")", function(results)
            if results.changedRows > 0 then
            end
        end)
   end

    if Races[found] then
      Races[found] = nil
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

RPC.register("racing:get:tracks", function(pSource)
    print("racing:get:tracks")
    tracks = {}
   local data = Await(SQL.execute("SELECT * FROM racing_tracks",{}))

    for i = 1, #data do
    tracks[#tracks + 1] = {
        id = #tracks + 1,
        checkpoints = json.encode(data[i].checkpoints),
        track_name = data[i].track_name
    }
    end

    for i = 1, #data do
    tracks[#tracks + 1] = {
        id = #tracks + 1,
        checkpoints = json.decode(data[i].checkpoints),
       track_name = data[i].track_name,
        creator = data[i].creator,
        distance = data[i].distance,
        races = data[i].races,
        fastest_car = data[i].fastest_car,
       fastest_name = data[i].fastest_name,
        fastest_lap = data[i].fastest_lap,
        fastest_sprint = data[i].fastest_sprint, 
        fastest_sprint_name = data[i].fastest_sprint_name,
        description = data[i].description
    }

       local correctId = tostring(data[i].id)
        BuiltMaps[correctId] = {
            id = correctId,
            checkpoints = json.decode(data[i].checkpoints),
            track_name = data[i].track_name,
            creator = data[i].creator,
           distance = data[i].distance,
            races = data[i].races,
            fastest_car = data[i].fastest_car,
            fastest_name = data[i].fastest_name,
            fastest_lap = data[i].fastest_lap,
            fastest_sprint = data[i].fastest_sprint, 
            fastest_sprint_name = data[i].fastest_sprint_name,
            description = data[i].description
        } 
    end


    return tracks
end)

RPC.register("racing:get:custom", function(pSource)
    BuiltMapsNew = {}
    local data = Await(SQL.execute("SELECT * FROM racing_tracks",{}))
    for i = 1, #data do
        local correctId = tostring(data[i].track_name)
        BuiltMapsNew[correctId] = {
            checkpoints = json.decode(data[i].checkpoints),
           track_name = data[i].track_name,
            creator = data[i].creator,
           distance = data[i].distance,
            races = data[i].races,
            fastest_car = data[i].fastest_car,
            fastest_name = data[i].fastest_name,
            fastest_lap = data[i].fastest_lap,
            fastest_sprint = data[i].fastest_sprint, 
            fastest_sprint_name = data[i].fastest_sprint_name,
            description = data[i].description
        }
    end

    return BuiltMapsNew
end)

RegisterServerEvent('racing-build-maps')
AddEventHandler('racing-build-maps', function()
    buildMaps('mapUpdate')
end)

RegisterServerEvent('racing-map-delete')
AddEventHandler('racing-map-delete', function(deleteID)
    exports.oxmysql.execute("DELETE FROM racing_tracks WHERE id = @id", {
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

    exports.oxmysql:execute("INSERT INTO `racing_tracks` (`checkpoints`, `creator`, `track_name`, `distance`, `description`) VALUES ('"..json.encode(currentMap).."', '"..tostring(playername).."', '"..tostring(name).."', '"..distanceMap.."',  '"..description.."')", function(results)
        Wait(1000)
        buildMaps()
    end)
end)