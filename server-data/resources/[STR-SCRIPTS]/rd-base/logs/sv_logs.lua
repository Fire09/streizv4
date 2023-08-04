function DiscordLog(wh, pSrc, reason, pBanReason, pLogData)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)
    if user ~= false then
        hexId = user:getVar("hexid")
    else
        hexId = GetPlayerIdentifiers(pSrc)[1]
    end


    local pName = GetPlayerName(pSrc)
    local pDiscord = GetPlayerIdentifiers(pSrc)[3]
    
    pLogData = pLogData and tostring(pLogData) or "None"

    
    local LogData = {
        {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", reason, pSrc, hexId, pDiscord),
            ['color'] = 2317994,
            ['fields'] = {
                {
                    ['name'] = '`Additional Information`',
                    ['value'] = pLogData,
                    ['inline'] = false
                },
            },
            ['author'] = {
                ['name'] = "Steam Name: "..pName
            },
        }
    }

    PerformHttpRequest(wh, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	


    --- Drop Player for valid reasons
    if reason == "Cheater: Spawned Blacklisted Prop" or reason == "Triggering Events" or reason == "Damage Modifier" or reason == "Trigger-Event-Admin" then
        exports.oxmysql:execute('INSERT INTO user_bans (steam_id, discord_id, steam_name, reason, details) VALUES (@steam_id, @discord_id, @steam_name, @reason, @details)', {
            ['@steam_id'] = hexId,
            ['@discord_id'] = pDiscord,
            ['@steam_name'] = pName,
            ['@reason'] = pBanReason,
            ['@details'] = pLogData
        }, function()
        end)
    end
end