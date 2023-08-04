RPC.register("rd-gov:police:showBadge", function(pSource, pInfo, pCoords)
    print("[rd-gov] [sv_police] [RPC] rd-gov:police:showBadge")
    local info = json.decode(pInfo.param)
    print("[rd-gov] [sv_police] [RPC] rd-gov:police:showBadge - info: " .. json.encode(info))
    local playerCoords = pCoords.param
    print("[rd-gov] [sv_police] [RPC] rd-gov:police:showBadge - playerCoords: " .. json.encode(playerCoords))
    local players = GetNearbyPlayers(playerCoords, 10)
    print("[rd-gov] [sv_police] [RPC] rd-gov:police:showBadge - players: " .. json.encode(players))
    print(json.encode(players))
    print(exports["rd-infinity"]:GetPlayerCoords(1))
    for _, serverID in ipairs(players) do
        TriggerClientEvent("rd-gov:police:showBadge", serverID, pSource, info)
    end
end)

RPC.register("rd-gov:police:getBadge", function(pSource)
    local src = pSource
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
    local getJobInfo = Await(SQL.execute("SELECT * FROM jobs_whitelist WHERE cid = @cid AND job = @job OR job = @job1", {
        ["cid"] = char.id,
        ["job"] = "police",
        ["job1"] = "state"
    }))
    local getProfileInfo = Await(SQL.execute("SELECT profilepic FROM characters WHERE id = @cid", {
        ["cid"] = char.id
    }))

    -- job check here

    local rank = getJobInfo[1].rank
    local department = "LSPD"
    local label = ""

    if getJobInfo[1].job == "police" then
    joblabel = {}
    joblabel[1] = "Cadet"
    joblabel[2] = "Officer"
    joblabel[3] = "Senior Officer"
    joblabel[4] = "Corporal"
    joblabel[5] = "Sergeant"
    joblabel[6] = "Lieutenant"
    joblabel[7] = "Captain"
    joblabel[8] = "Deputy Chief Of Police"
    joblabel[9] = "Chief Of Police"
    label = joblabel[rank]
    end

    if getJobInfo[1].job == "state" then
        department = "SASP"
        joblabel = {}
        joblabel[1] = "Trooper"
        joblabel[2] = "Senior Trooper"
        joblabel[3] = "Assistant Major"
        joblabel[4] = "Major"
        label = joblabel[rank]
    end

    TriggerClientEvent("player:receiveItem", pSource, 'pdbadge', 1, false, {
       -- _hideKeys = { "name", "badge", "rank", "department", "image", "callsign" },
        name = name,
        badge = department,
        rank = joblabel[rank],
        department = department,
        image = getProfileInfo[1].profilepic,
        callsign = getJobInfo[1].callsign
      })
end)