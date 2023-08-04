RegisterServerEvent("updateJailTime")
AddEventHandler("updateJailTime", function(minutes)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    if minutes == 0 then
        TriggerClientEvent('endJailTime', src)
    else
        exports.oxmysql:execute("UPDATE `characters` SET `jail_time` = '" .. tonumber(minutes) .. "' WHERE `id` = '" .. char.id .. "'")
    end
end)



RegisterServerEvent("updateJailTimeMobster")
AddEventHandler("updateJailTimeMobster", function(minutes)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    exports.oxmysql:execute("UPDATE `characters` SET `jail_time_mobster` = '" .. minutes .. "' WHERE `id` = '" .. char.id .. "'")
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(60000)
        exports.oxmysql:execute("SELECT * FROM `characters` ", {}, function(result)
            for k, v in ipairs(result) do 
                if v.jail_time >= 1 then
                    exports.oxmysql:execute("UPDATE `characters` SET `jail_time` = @time WHERE `id` = @cid", {['time'] = v.jail_time - 1, ['cid'] = v.id } )
                end
            end
        end)
    end
end)

RegisterServerEvent("updateJailTimeMobster")
AddEventHandler("updateJailTimeMobster", function(minutes)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    if minutes == 0 then
        TriggerClientEvent('endJailTime', src)
    else
        exports.oxmysql:execute("UPDATE `characters` SET `jail_time_mobster` = @time WHERE `id` = @cid", {['time'] = tonumber(minutes), ['cid'] = char.id})
    end
end)


RegisterServerEvent('jail:charecterFullySpawend')
AddEventHandler('jail:charecterFullySpawend', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
    local playerName = character.first_name .. ' ' .. character.last_name
    
    exports.oxmysql:execute("SELECT `jail_time` FROM `characters` WHERE id = @cid", {['cid'] = character.id}, function(result)
        TriggerClientEvent('beginJail', src, true,result[1].jail_time, playerName, character.id, date)
    end)
end)

RegisterServerEvent("checkJailTime")
AddEventHandler("checkJailTime", function(sendmessage)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `jail_time` FROM `characters` WHERE id = @cid", {['cid'] = char.id}, function(result)

        if tonumber(result[1].jail_time) <= 0 then
            TriggerClientEvent("TimeRemaining", src, tonumber(result[1].jail_time), true)
        elseif tonumber(result[1].jail_time) >= 1 then
            TriggerClientEvent("TimeRemaining", src, tonumber(result[1].jail_time), false)
        end
	end)
end)

RegisterCommand('unjail', function(source, args)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local target = exports["rd-base"]:getModule("Player"):GetUser(args[1])

    if user:getVar("job") == 'police' or user:getVar("job") == 'state' or user:getVar("job") == 'police' or user:getVar("job") == 'doc' or user:getVar("job") == 'judge' then
        if args[1] and exports["rd-base"]:getModule("Player"):GetUser(tonumber(args[1])) then
            TriggerClientEvent("endJailTime", (args[1]))
            exports.oxmysql:execute("UPDATE `characters` SET `jail_time` = @time WHERE `id` = @cid", {['time'] = 0, ['cid'] = char.id})
        else
            TriggerClientEvent("DoLongHudText", src, 'There are no player with this ID.', 2)
        end
    end
end)

RegisterCommand('jail', function(source, args)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

    if user:getVar("job") == 'police' or user:getVar("job") == 'state' or user:getVar("job") == 'sheriff' or user:getVar("job") == 'ranger' or user:getVar("job") == 'doc' or user:getVar("job") == 'judge' then
        TriggerClientEvent("police:jailing", src, args)
    end
end)

-- Jail Jobs Reduce Time --

RegisterServerEvent('rd-jail:remove-time-electrical')
AddEventHandler("rd-jail:remove-time-electrical", function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.oxmysql:execute("SELECT * FROM `characters` WHERE id = @cid", {['cid'] = char.id}, function(data)
        local recent = tonumber(data[1].jail_time)
        exports.oxmysql:execute("UPDATE `characters` SET `jail_time` = @time WHERE `id` = @cid", {['time'] = recent - tonumber(math.random(1, 3)), ['cid'] = char.id})
    end)
end)

-- IDFK

RegisterServerEvent('srvIDCard')
AddEventHandler('srvIDCard', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)

    if user:getCash() >= 200 then
        user:removeMoney(200)
        TriggerClientEvent('getIdCard', src)
    else
        TriggerClientEvent('DoLongHudText', src, 'You need $200.', 2)
    end
end)