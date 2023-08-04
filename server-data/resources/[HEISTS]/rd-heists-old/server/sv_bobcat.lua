pCanBlow = false
canloot = false

RegisterServerEvent("rd-bobcat:effect")
AddEventHandler("rd-bobcat:effect", function(method)
    TriggerClientEvent("lumo:effectoutside", -1, method)
end)

RegisterServerEvent("rd-bobcat:effect2")
AddEventHandler("rd-bobcat:effect2", function(method)
    TriggerClientEvent("lumo:effectinside", -1, method)
end)

RegisterServerEvent("rd-bobcat:bubbles")
AddEventHandler("rd-bobcat:bubbles", function()
    canloot = true
    TriggerClientEvent("rd-bobcat:bubbles", -1)
end)

local searched1 = false
local searched2 = false
local searched3 = false

RegisterServerEvent("rd-bobcat:search_crate_1")
AddEventHandler("rd-bobcat:search_crate_1", function()
    local source = source
    
    if searched1 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("rd-bobcat:search_crate_1", source)
        searched1 = true
    end
end)

RegisterServerEvent("rd-bobcat:search_crate_2")
AddEventHandler("rd-bobcat:search_crate_2", function()
    local source = source
    
    if searched2 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("rd-bobcat:search_crate_2", source)
        searched2 = true
    end
end)

RegisterServerEvent("rd-bobcat:search_crate_3")
AddEventHandler("rd-bobcat:search_crate_3", function()
    local source = source
    
    if searched3 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("rd-bobcat:search_crate_3", source)
        searched3 = true
    end
end)

RegisterServerEvent("str:particleserver")
AddEventHandler("str:particleserver", function(method)
    TriggerClientEvent("str:ptfxparticle", -1, method)
end)

RegisterServerEvent('rd-bobcat:blow_door')
AddEventHandler('rd-bobcat:blow_door', function()
    if not pCanBlow then
        pCanBlow = true
        TriggerClientEvent('rd-heists:explosion_ped_walk', source)
    end
end)

RegisterServerEvent('rd-heists:bobcatLog')
AddEventHandler('rd-heists:bobcatLog', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** np [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing Bobcat Security",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/1068505941068230757/_nT1RF6RQbG4ZesJLMeyOLPnQVibSy6FoqPL5noFJrFB5ARDjDWRnpLuDEAXpRQ1fq4P", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/982104385679159296/1059831718103744522/FAtwwr2.png"}), { ['Content-Type'] = 'application/json' })
end)