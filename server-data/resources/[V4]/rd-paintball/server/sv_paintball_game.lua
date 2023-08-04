local teamPlayersEast = 0
local teamPlayersWest = 0
local playerCache = {}
local gameInProgress = false
local flagObjNetId = 0
local flagCenterCoords = vector3(5500.00, 6084.20, 590.75)

function spawnFlag(pCoords)
    local playerSrcs = {}
    for k, v in pairs(playerCache) do
        playerSrcs[#playerSrcs + 1] = k
    end
    local rndSrc = playerSrcs[math.random(#playerSrcs)]
    TriggerClientEvent("rd-paintball:game:spawnFlag", rndSrc, pCoords)  
end

function startGame()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
    gameInProgress = true
    spawnFlag(flagCenterCoords)
end

function endGame()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
    gameInProgress = false
    teamPlayersEast = 0
    teamPlayersWest = 0
    playerCache = {}
end  

function joinTeam(pSource, pTeam)
    if playerCache[pSource] then return end
    if pTeam == "east" then
        teamPlayersEast = teamPlayersEast + 1
        playerCache[pSource] = "east"
    else
        teamPlayersWest = teamPlayersWest + 1
        playerCache[pSource] = "west"
    end
end

function leaveTeam(pSource)
    if not playerCache[pSource] then return end
    if playerCache[pSource] == "east" then
        teamPlayersEast = teamPlayersEast - 1
    else
        teamPlayersWest = teamPlayersWest - 1
    end    
    playerCache[pSource] = nil
    if teamPlayersEast == 0 or teamPlayersWest == 0 then
        endGame()
    end        
end    

RPC.register("rd-paintball:game:action", function(pSource, pAction, pCtx)
    if pAction == "start" then
        startGame()
    end
    if pAction == "end" then
        endGame()   
    end
    if pAction == "join" then
        joinTeam(pSource, pCtx)
    end
    if pAction == "leave" then
        leaveTeam(pSource)
    end

    TriggerClientEvent("rd-paintball:game:update", -1, {
        teamPlayersEast = teamPlayersEast,
        teamPlayersWest = teamPlayersWest,
        gameInProgress = gameInProgress,
    })
end)

RegisterServerEvent("rd-paintball:game:spawnedFlag")
AddEventHandler("rd-paintball:game:spawnedFlag", function(pNetId)
    flagObjNetId = pNetId
end)

RegisterServerEvent("rd-paintball:game:pickedUpFlag")
AddEventHandler("rd-paintball:game:pickedUpFlag", function()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
end)

RegisterServerEvent("rd-paintball:game:diedWithFlag")
AddEventHandler("rd-paintball:game:diedWithFlag", function(pCoords)
    --spawnFlag(pCoords)
    local src = source
    TriggerClientEvent("rd-paintball:game:spawnFlag", src, pCoords)
end)