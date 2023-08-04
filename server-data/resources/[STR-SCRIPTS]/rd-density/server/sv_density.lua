RegisterNetEvent("rd:peds:rogue")
AddEventHandler("rd:peds:rogue", function(toDelete)
    local src = source

    local coords = GetEntityCoords(GetPlayerPed(src))
    local players = exports["rd-infinity"]:GetNearbyPlayers(coords, 250)

    for i, v in ipairs(players) do
        TriggerClientEvent("rd:peds:rogue:delete", v, toDelete)
    end
end)