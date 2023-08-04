RegisterServerEvent('ragdoll:reviveSV')
AddEventHandler('ragdoll:reviveSV', function(t)
	TriggerClientEvent('ragdoll:revive', t)
    TriggerClientEvent('rd-hospital:client:RemoveBleed', t) 
    TriggerClientEvent('rd-hospital:client:ResetLimbs', t)
end)

RegisterServerEvent('ragdoll:reviveSV2')
AddEventHandler('ragdoll:reviveSV2', function()
	TriggerClientEvent('ragdoll:revive', source)
end)

RegisterNetEvent('baseevents:onPlayerDied')
AddEventHandler('baseevents:onPlayerDied', function(killerId, data)
    local src = source
    local pSteamName = GetPlayerName(src)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports['rd-admin']:addPlayerLog('Player Died', GetPlayerIdentifier(src, 0), pSteamName..' ['..char.first_name..' '..char.last_name..'] died to '..killerId, char.id, 'None')
end)

RegisterNetEvent('baseevents:onPlayerKilled')
AddEventHandler('baseevents:onPlayerKilled', function(killerId, data)
    local src = source
    local pSteamName = GetPlayerName(src)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    print(json.encode(data))
    exports['rd-admin']:addPlayerLog('Player Killed', GetPlayerIdentifier(src, 0), pSteamName..' ['..char.first_name..' '..char.last_name..'] died to '..data.weaponhash, char.id, 'None')
end)