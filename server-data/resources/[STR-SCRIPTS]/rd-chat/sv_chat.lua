local toggled = false

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')
 
AddEventHandler('_chat:messageEntered', function(author, color, message, mode)
    if not message or not mode or not author then
        return
    end
 
    TriggerEvent('chatMessage', source, author, message, mode)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message, mode)
    end
end)

AddEventHandler("chatMessage", function(source, args, raw)
    local src = source
    TriggerClientEvent('chatMessage', src, "SYSTEM", {255, 140, 0}, "Invalid Command")
    CancelEvent()
end)
 


AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

RegisterCommand('ooc', function(source, args)
    print('OOC')
    if not args[1] then return end
    local src = source
    local msg = ""
    for i = 1, #args do
      msg = msg .. " " .. args[i]
    end
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
    if not toggled then
        TriggerClientEvent('chatMessage', -1, 'OOC '.. name .. ' ['.. src .. '] ', 2, msg, "OOC")
    elseif toggled then
        TriggerClientEvent("DoLongHudText", src, "OOC is disabled", 2)
    end
 end)

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text,Coords)
	TriggerClientEvent('Do3DText', -1, text, source, Coords)
	if logEnabled then
		setLog(text, source)
	end
end)

RegisterCommand("clear", function(source)
    TriggerClientEvent("chat:clear", source)
end)

RegisterCommand("clearall", function(source)
    local steamIdentifier = GetPlayerIdentifiers(source)[1]
    exports.oxmysql:execute("SELECT rank FROM users WHERE hex_id = ?", {steamIdentifier}, function(data)
        if data[1].rank ~= "user" then
            TriggerClientEvent("chat:clear", -1)
        end
    end)
end)

RegisterCommand("disable", function(source, args)
    local pSrc = source
    local command = string.lower(args[1])
    local steamIdentifier = GetPlayerIdentifiers(source)[1]
    exports.oxmysql:execute("SELECT rank FROM users WHERE hex_id = ?", {steamIdentifier}, function(data)
        if data[1].rank ~= "user" then
            if command == "ooc" then
                toggled = not toggled
                TriggerClientEvent("DoLongHudText", pSrc, ('OOC has been %s!'):format(toggled and 'Disabled' or 'Enabled')) -- Pkarti was here
            end
        end
    end)
end)

local Me_ERP_Log = "https://discord.com/api/webhooks/985254222318686268/bXiztgbINhnFPUwISdS_icky7rsFV_EJ8TAMPDwQ1weOAH7_pSMcQ7t8zOLeg33k2e3A"

RegisterServerEvent('chat:me_log')
AddEventHandler('chat:me_log', function(pMeText)
    local pName = GetPlayerName(source)
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "/me Log From: ".. pName,
            ["description"] = "Text: "..pMeText,
	        ["footer"] = {
                ["text"] = "[Chat] /me Log",
            },
        }
    }
    PerformHttpRequest(Me_ERP_Log, function(err, text, headers) end, 'POST', json.encode({username = "NoPixel",  avatar_url = "https://cdn.discordapp.com/attachments/928946993840132116/930453062403899472/Untitled-1.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)