local carBombTable = {}

RegisterNetEvent("rd-miscscripts:carbombs:removeBomb", function(pNetId)
    carBombTable[pNetId] = nil
end)

RegisterNetEvent("rd-usableprops:defusePhoneBomb", function(pNetId)
    carBombTable[pNetId] = nil
end)

RegisterNetEvent("rd-miscscripts:carbombs:foundBomb", function(pNetId, pMetaData)
    TriggerClientEvent("rd-miscscripts:carbombs:foundBombAll", -1, carBombTable[pMetaData.netId])
end)

STR.register("rd-miscscripts:carbombs:addCarBomb", function(pSource, netId, minSpeed, ticksBeforeExplode, ticksForRemoval, gridSize, coloredSquares, timeToComplete)
    print(netId, minSpeed, ticksBeforeExplode, ticksForRemoval, gridSize, coloredSquares, timeToComplete)
    carBombTable[netId] = {
        carBombData = {
            minSpeed = minSpeed, 
            ticksBeforeExplode = ticksBeforeExplode, 
            ticksForRemoval = ticksForRemoval, 
            gridSize = gridSize, 
            coloredSquares = coloredSquares, 
            timeToComplete = timeToComplete,
            netId = netId,
            hasCarBomb = true,
        }
    }
end)

STR.register("rd-miscscripts:carbombs:getCarBombDataFromNetID", function(pSource, netId)
    return carBombTable[netId]
end)

--[[ STR.register("rd-usableprops:hasPhoneBomb", function(pSource, pNetId)
    print(pNetId)
    if carBombTable[pNetId] then
        return true
    end
    return false
end) ]]