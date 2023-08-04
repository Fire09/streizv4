local STX = STX or {}
STX.Scoreboard = {}
STX._Scoreboard = {}
STX._Scoreboard.PlayersS = {}
STX._Scoreboard.RecentS = {}

RegisterServerEvent('rd-scoreboard:AddPlayer')
AddEventHandler("rd-scoreboard:AddPlayer", function()

    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local data = { src = source, steamid = stid, comid = scomid, name = ply }

    TriggerClientEvent("rd-scoreboard:AddPlayer", -1, data )
    STX.Scoreboard.AddAllPlayers()
end)

function STX.Scoreboard.AddAllPlayers(self)
    --local players = GetActivePlayers()

    for i, _PlayerId in pairs(GetPlayers()) do
        
        local identifiers, steamIdentifier = GetPlayerIdentifiers(_PlayerId)
        for _, v in pairs(identifiers) do
            if string.find(v, "steam") then
                steamIdentifier = v
                break
            end
        end

        local stid = HexIdToSteamId(steamIdentifier)
        local ply = GetPlayerName(_PlayerId)
        local scomid = steamIdentifier:gsub("steam:", "")
        local data = { src = tonumber(_PlayerId), steamid = stid, comid = scomid, name = ply }

        TriggerClientEvent("rd-scoreboard:AddAllPlayers", source, data)

    end
end

function STX.Scoreboard.AddPlayerS(self, data)
    STX._Scoreboard.PlayersS[data.src] = data
end

AddEventHandler("playerDropped", function()
	local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local plyid = source
    local data = { src = source, steamid = stid, comid = scomid, name = ply }

    TriggerClientEvent("rd-scoreboard:RemovePlayer", -1, data )
    TriggerEvent('rd-scoreboard:updatePlayerCount')
    Wait(600000)
    TriggerClientEvent("rd-scoreboard:RemoveRecent", -1, plyid)
end)

function HexIdToSteamId(hexId)
    local cid = math.floor(tonumber(string.sub(hexId, 7), 16))
	local steam64 = math.floor(tonumber(string.sub( cid, 2)))
	local a = steam64 % 2 == 0 and 0 or 1
	local b = math.floor(math.abs(6561197960265728 - steam64 - a) / 2)
	local sid = "STEAM_0:"..a..":"..(a == 1 and b -1 or b)
    return sid
end

RegisterServerEvent('rd-scoreboard:updatePlayerCount')
AddEventHandler("rd-scoreboard:updatePlayerCount", function()
    local playersonline = GetNumPlayerIndices()
    TriggerClientEvent("rd-scoreboard:playerscount", -1, playersonline)
end)