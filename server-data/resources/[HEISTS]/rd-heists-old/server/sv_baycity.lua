local pCanDo2NDDoor = false

RegisterServerEvent('rd-heists:first_door:cl')
AddEventHandler('rd-heists:first_door:cl', function()
    TriggerClientEvent('rd-heists:bay_city:first_door', source)
end)

RegisterServerEvent('rd-heists:second_door:cl')
AddEventHandler('rd-heists:second_door:cl', function()
    if pCanDo2NDDoor then
        TriggerClientEvent('rd-heists:bay_city:second_door', source)
    end
end)

RegisterServerEvent('pSendSecondDoor')
AddEventHandler('pSendSecondDoor', function()
    pCanDo2NDDoor = true
end)

RegisterServerEvent('pStopSecondDoor')
AddEventHandler('pStopSecondDoor', function()
    pCanDo2NDDoor = false
end)

RegisterServerEvent('rd-heists:bayCityLog')
AddEventHandler('rd-heists:bayCityLog', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** np [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing Bay City Bank",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/1068505875423174686/0hiRBokK7wsfMijqamU_XTo-9Rn1E0-peCoXjCdXJVtkuBmPh9IFP7h8ngyafOm7aHiM", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/982104385679159296/1059831718103744522/FAtwwr2.png"}), { ['Content-Type'] = 'application/json' })
end)