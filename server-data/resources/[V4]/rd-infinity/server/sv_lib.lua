pCoordsActivePlayers = {}

RegisterServerEvent('rd:infinity:player:ready')
AddEventHandler('rd:infinity:player:ready', function()
    local src = source
    local ped = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(ped)
    pCoordsActivePlayers[src] = playerCoords    
    TriggerClientEvent('rd:infinity:player:coords', -1, playerCoords)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        local sexinthetube = GetEntityCoords(source)

        TriggerClientEvent('rd:infinity:player:coords', -1, sexinthetube)
        TriggerEvent("rd-base:updatecoords", sexinthetube.x, sexinthetube.y, sexinthetube.z)

        if #pCoordsActivePlayers > 0 then
            for k,v in pairs(pCoordsActivePlayers) do
                if v ~= nil then
                    local ped = GetPlayerPed(k)
                    local playerCoords = GetEntityCoords(ped)
                    pCoordsActivePlayers[k] = playerCoords
                end
            end
        end
    end
end)

AddEventHandler("playerDropped", function()
    local src = source
    if #pCoordsActivePlayers > 0 then
        pCoordsActivePlayers[src] = nil
    end
end)

function GetPlayerCoords(serverid)
    if pCoordsActivePlayers[serverid] then
        return pCoordsActivePlayers[serverid]
    else
        return false
    end
end

exports("GetPlayerCoords", GetPlayerCoords)

function GetNearbyPlayers(pCoords, pDistance)
    local pData = pCoordsActivePlayers
    local returndata = {}
    for pPlayer,COORD in pairs(pData) do
        if #(vector3(pCoords.x,pCoords.y,pCoords.z) - vector3(COORD.x,COORD.y,COORD.z)) < pDistance then
            table.insert( returndata, pPlayer )
        end
    end
    return returndata
end

exports("GetNearbyPlayers", GetNearbyPlayers)