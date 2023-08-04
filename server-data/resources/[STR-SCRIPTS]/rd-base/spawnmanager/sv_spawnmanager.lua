STX.SpawnManager = {}

-- function OnPlayerConnecting(name, setKickReason, deferrals)
--     local player = source
--     local steamIdentifier
--     local identifiers = GetPlayerIdentifiers(player)

--     for _, v in pairs(identifiers) do
--         if string.find(v, "steam") then
--             steamIdentifier = v
--             break
--         end
--     end

--     if steamIdentifier then
--         exports.oxmysql:execute("SELECT * FROM user_bans WHERE steam_id = ?", {steamIdentifier}, function(data)
--             if data[1] then
--                 local reason = data[1].reason
--                 if reason == "" then
--                     reason = "No Reason Specified"
--                 end

--                 deferrals.done("You have been permanently banned | Reason: " .. string.upper(reason));
--                 CancelEvent()
--             else
--                 -- deferrals.done();
--                 if GetConvarInt('logs_enabled', 0) == 1 then
--                     local LogInfo =  GetPlayerName(player).. " is loading into the server"
--                     --exports['rd-base']:DiscordLog("https://discord.com/api/webhooks/852705393967890472/W3LrJvhuH-LEDdNQeoO9g5b7ErRrQ5k4LMgtaS8--lIWVZi4CAXFQ7LNPYqHioOvNLP8", player, "Player Joining", "", LogInfo)
--                 end
--             end
--         end)
--     else

--     end
-- end

-- AddEventHandler("playerConnecting", OnPlayerConnecting)
