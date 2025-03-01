local PlayerCoords = {}

RegisterNetEvent("rd:infinity:player:coords")
AddEventHandler("rd:infinity:player:coords", function(coords)
    PlayerCoords = coords
end)

function GetPlayerCoords(serverID)
    local playerID = GetPlayerFromServerId(serverID)

    if playerID ~= -1 then
        return GetEntityCoords(GetPlayerPed(playerID))
    else
        return PlayerCoords[serverID] or vector3(0.0, 0.0, 0.0)
    end
end