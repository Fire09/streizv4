
local CooldownTimer = true

local pIsAvailable = true

RegisterServerEvent('rd-heists:start_hitting_upper_vangelico')
AddEventHandler('rd-heists:start_hitting_upper_vangelico', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if CooldownTimer then
        print('[rd-heists] Someone Robbing Vangelico')
        CooldownTimer = false
        pIsAvailable = false
        TriggerClientEvent('rd-jewelry:open_doors', src)
        print('^3[rd-heists]: ^2Cooldown started^0')
        Citizen.Wait(3600000)
        print('[rd-heists] Vangelico No Longer On Cooldown')
        TriggerClientEvent('rd-heists:lock_vangelico_doors_cooldown', src)
        CooldownTimer = true
        pIsAvailable = true
    else
        print('[rd-heists] Someone Trying to Rob Vangelico But Already Been Robbed')
        TriggerClientEvent('DoLongHudText', src, 'This Jewelry Store was recently robbed.', 2)
    end
end)

RegisterServerEvent('rd-heists:vangelico_loot')
AddEventHandler('rd-heists:vangelico_loot', function()
    local src = source
    local EvanVangelicoLoot = math.random(1, 3)

    if EvanVangelicoLoot == 1 then
        TriggerClientEvent('player:receiveItem', src,'valuablegoods', math.random(5, 10))
        TriggerClientEvent('player:receiveItem', src,'goldbar', math.random(1, 5))
        TriggerClientEvent('player:receiveItem', src,'rolexwatch', math.random(10, 20))
    elseif EvanVangelicoLoot == 2 then
        TriggerClientEvent('player:receiveItem', src,'goldcoin', math.random(15, 30))
        TriggerClientEvent('player:receiveItem', src,'stolen8ctchain', math.random(3, 10))
    elseif EvanVangelicoLoot == 3 then
        TriggerClientEvent('player:receiveItem', src,'valuablegoods', math.random(5, 14))
        TriggerClientEvent('player:receiveItem', src,'goldcoin', math.random(15, 50))
        TriggerClientEvent('player:receiveItem', src,'rolexwatch', math.random(15, 30))
    end
end)

RegisterServerEvent('rd-heists:get_vangelico_availability')
AddEventHandler('rd-heists:get_vangelico_availability', function()
    local src = source

    if pIsAvailable then
        TriggerClientEvent('rd-heists:vangelico_available', src)
    else
        TriggerClientEvent('rd-heists:vangelico_unavailable', src)
    end
end)

RegisterServerEvent('rd-heists:vangelicoRobberyLog')
AddEventHandler('rd-heists:vangelicoRobberyLog', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** np [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing Jewelry Store",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/1068506113466716171/YJiP5tWeNNRWWF1Ty8NnnnMc6nrwcO5C05bMhuTkqdDHGOadSzPsTzWRDfebKcdvC4Ju", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/982104385679159296/1059831718103744522/FAtwwr2.png"}), { ['Content-Type'] = 'application/json' })
end)