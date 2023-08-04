local currentClassRoomBoardUrl = "https://cdn.discordapp.com/attachments/929484136572387339/936710819910156408/unknown.png"
local currentMeetingRoomBoardUrl = "https://cdn.discordapp.com/attachments/929484136572387339/936710819910156408/unknown.png"

local firstname = {'Mona', 'Ray', 'Sonny', 'Don', 'Jo', 'Joe', 'Dixon', 'Ben', 'Hugh G.', 'Duncan', 'Mike', 'Mike',
                   'Mike', 'Ima', 'Richard'}

local lastname = {'Alott', 'Gunn', 'Day', 'Key', 'King', 'Kane', 'Uranus', 'Dover', 'Rection', 'McOkiner', 'Hawk',
                  'Hunt', 'Oxlong', 'Pigg', 'Head'}

RegisterNetEvent("police:changewhiteboard", function(pRoomphotoUrl, pRoomsId)
    local src = source

    if pRoomsId == "classroom" then
        currentClassRoomBoardUrl = pRoomphotoUrl
    elseif pRoomsId == "meetingroom" and inMeetingRoom and dui then
        currentMeetingRoomBoardUrl = pRoomphotoUrl
    end

    TriggerClientEvent("police:changewhiteboardcli", -1, pRoomphotoUrl, pRoomsId)
end)

RegisterNetEvent("police:duisaveriddlev", function()
    local src = source

    TriggerClientEvent("police:changewhiteboardcli", src, currentClassRoomBoardUrl, "classroom")
    TriggerClientEvent("police:changewhiteboardcli", src, currentMeetingRoomBoardUrl, "meetingroom")
end)

RegisterServerEvent('police:showID')
AddEventHandler('police:showID', function(itemInfo)
	local src = source
	local fuck = json.decode(itemInfo)
	local data = {
		['DOB'] = fuck.DOB,
		['Name'] = fuck.Name,
		['Surname'] = fuck.Surname,
		['Sex'] = fuck.Sex,
		['Identifier'] = fuck.identifier,
		['pref'] = "sex"
	}

	if data.Sex == 0 then
		data = {
			['DOB'] = fuck.DOB,
			['Name'] = fuck.Name,
			['Surname'] = fuck.Surname,
			['Sex'] = "M",
			['Identifier'] = fuck.identifier,
			['pref'] = "Male"
		}
	elseif data.Sex == 1 then
		data = {
			['DOB'] = fuck.DOB,
			['Name'] = fuck.Name,
			['Surname'] = fuck.Surname,
			['Sex'] = "F",
			['Identifier'] = fuck.identifier,
			['pref'] = "Female"
		}
	end
	TriggerClientEvent("chat:showCID", -1, data, src)
end)

RegisterServerEvent('rd-base:addLicenses')
AddEventHandler('rd-base:addLicenses', function()
	local src = source
	local user2 = exports["rd-base"]:getModule("Player"):GetUser(src)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("SELECT * FROM user_licenses WHERE cid = ?", {char2.id}, function(result)
		if result[1] == nil then
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Weapon', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Drivers', ['@status'] = '1'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Hunting', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Fishing', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Bar', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Business', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Pilot', ['@status'] = '0'})
		end
	end)
end)

RegisterNetEvent("vehicle:flip")
AddEventHandler("vehicle:flip", function(pTarget, pVehicle, pPitch, pVRoll, pVYaw)
	TriggerClientEvent("vehicle:flip", pTarget, pVehicle, pPitch, pVRoll, pVYaw)
end)

RegisterServerEvent('CrashTackle')
AddEventHandler('CrashTackle', function(player)
    TriggerClientEvent('playerTackled', player)
end)

RegisterServerEvent('rd-police:dnaAsk')
AddEventHandler('rd-police:dnaAsk', function(t)
	local src = source
	local user2 = exports["rd-base"]:getModule("Player"):GetUser(t)
	local character2 = user2:getCurrentCharacter()
    TriggerClientEvent("DoLongHudText", t, 'You have been DNA tested!',1)
	TriggerClientEvent('DoLongHudText', src, 'DNA swab comes back to a : ' .. character2.first_name .." ".. character2.last_name, 1)
	TriggerClientEvent('DoLongHudText', src, 'DNA: ' .. character2.id, 2)
end)

RegisterServerEvent('rd-police:remmaskGranted') -- that is np's code ((sway))
AddEventHandler('rd-police:remmaskGranted', function(targetplayer)
    TriggerClientEvent('rd-police:remmaskAccepted', targetplayer)
end)

local logged = {}

RegisterServerEvent('checkLicensePlate')
AddEventHandler('checkLicensePlate', function(oof)
    local source = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)
    local char = user:getCurrentCharacter()
    local job = "Unemployed"
    local message = ""
    local phonenumber = char.phone_number
    local kekw = oof
    exports.oxmysql:execute('SELECT * FROM characters_cars WHERE `plate` = @plate', {['@plate'] = kekw}, function(result)
        if result[1] ~= nil then
            exports.oxmysql:execute('SELECT * FROM characters WHERE `id` = @cid', {['@cid'] = result[1].cid}, function(data)
                exports.oxmysql:execute('SELECT * FROM character_passes WHERE `cid` = @cid', {['@cid'] = data[1].id}, function(penis)
                    if penis[1] ~= nil then
                        job = penis[1].business_name
                        if job == "police" then
                            job = "Police"
                        elseif job == "ems" then
                            job = "EMS"
                        elseif job == "mandem" then
                            job = "Unemployed"
                        elseif job == "sosa" then
                            job = "Unemployed"
                        elseif job == "gambinos" then
                            job = "Unemployed"
                        elseif job == "black_mafia" then
                            job = "Unemployed"
                        elseif job == "saigons" then
                            job = "Unemployed"
                        end
                        local phoneNumber = string.sub(data[1].phone_number, 0, 3) .. '' ..string.sub(data[1].phone_number, 4, 6) .. '' ..string.sub(data[1].phone_number, 7, 10)
                        TriggerClientEvent("chatMessage", source, "DISPATCH", 3,"10-74 (Negative) \n Name: " .. data[1].first_name .. " " .. data[1].last_name .. " \n Phone: " ..phoneNumber .. ' \n Plate: ' .. kekw)
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
                    else
                        local phoneNumber = string.sub(data[1].phone_number, 0, 3) .. '-' ..string.sub(data[1].phone_number, 4, 6) .. '-' ..string.sub(data[1].phone_number, 7, 10)
                        TriggerClientEvent("chatMessage", source, "DISPATCH", 3,"10-74 (Negative) \n Name: " .. data[1].first_name .. " " .. data[1].last_name .. " \n Phone: " ..phoneNumber .. ' \n Plate: ' .. kekw)
                        TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
                    end
                end)
            end)
        elseif logged[#logged] ~= nil then
            for k, v in ipairs(logged) do
                if v.plate == kekw then
                    TriggerClientEvent("chatMessage", source, "DISPATCH", 3,"10-74 (Negative) \n Name: " .. v.firstname .. " " .. v.lastname .. " \n Phone #: " ..math.random(000, 999) .. '' .. math.random(000, 999) .. '' .. math.random(0000, 9999) ..' \n Plate: ' .. kekw)
                end
            end
        else
            local insert = {
                plate = kekw,
                firstname = firstname[math.random(1, 5)],
                lastname = lastname[math.random(1, 5)]
            }
            TriggerClientEvent("chatMessage", source, "DISPATCH", 3, "10-74 (Negative) \n Name: " .. insert.firstname .. " " .. insert.lastname .. " \n Phone #: " .. math.random(000, 999) .. '' .. math.random(000, 999) .. '' .. math.random(0000, 9999) .. ' \n Plate: ' .. kekw)
            logged[#logged + 1] = insert
            TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
        end
    end)
end)

-- Hire -- 

RegisterServerEvent('rd-rd-police:hire_pd')
AddEventHandler('rd-rd-police:hire_pd', function(pCID, pRank, pCallsign, pDept)
    exports.oxmysql:execute("INSERT INTO jobs_whitelist (cid,job,rank,callsign,dept) VALUES (@cid,@job,@rank,@callsign,@dept)", {
        ['cid'] = pCID,
        ['job'] = 'police',
        ['rank'] = pRank,
        ['callsign'] = pCallsign,
        ['dept'] = pDept
    })
end)

RegisterServerEvent('rd-rd-police:sv:open_hire_menu')
AddEventHandler('rd-rd-police:sv:open_hire_menu', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()

    exports.oxmysql:execute('SELECT rank FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
        print('Rank: ' .. result[1].rank)
        if result[1].rank >= 7 then
			TriggerClientEvent('rd-police:hireNewPerson', src)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not a high enough rank to use this!", 2)
		end
	end)
end)

RegisterServerEvent("911")
AddEventHandler("911", function(args, pStreetName)
    local src = source

    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local job = user:getVar("job")
    local message = ""
    local pName = GetPlayerName(source)
    local identifiers = GetPlayerIdentifiers(source)

    local phonenumber = char.phone_number

    for k, v in ipairs(args) do
        message = message .. " " .. v
    end
    local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

    TriggerClientEvent("GPSTrack:Create", src)
    TriggerClientEvent("animation:phonecall", src)
    TriggerClientEvent("chatMessage", src,
        "911 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 1, tostring(message))

    local connect = {
        {
            ["color"] = color,
            ["title"] = "** riddle [Police] | 911 Call **",
            ["description"] = "Steam Name:"..pName.. " \n Steam ID: "..identifiers[1].. " \n 911 | " .. char.first_name .. " " .. char.last_name .. " \n Message: " .. tostring(message),
        }
    }
    PerformHttpRequest("https://discord.com/api/webhooks/1012082593790951525/jOaujaZf4fXM5XVf8hiVBfylIGS65mGODaGY3G7xvmOMo6KHkyhWjd6xvNDyeCMfQ4OR", function(err, text, headers) end, 'POST', json.encode({username = "riddle | 911 Call", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })

    TriggerEvent('dispatch:svNotify', {
        dispatchCode = "911 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber,
        firstStreet = pStreetName,
        gender = user:getGender(),
        isImportant = false,
        priority = 1,
        dispatchMessage = tostring(message),
        recipientList = {
            police = "police",
            ems = "ems"
        },
        origin = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        }
    })

    local users = exports["rd-base"]:getModule("Player"):GetUsers()

    local emergencyPlayers = {}

    for k, v in pairs(users) do
        local user = exports["rd-base"]:getModule("Player"):GetUser(v)
        local job = user:getVar("job")

        if job == "ems" or job == "police" then
            emergencyPlayers[#emergencyPlayers + 1] = v
        end
    end

    for k, v in ipairs(emergencyPlayers) do
        TriggerClientEvent("callsound", v)
        TriggerClientEvent("chatMessage", v, "911 | (" .. tonumber(src) .. ") " .. char.first_name .. " | " ..
            char.last_name .. " # " .. phonenumber, 1, tostring(message))
    end
end)

RegisterServerEvent("911a")
AddEventHandler("911a", function(args)
    local src = source

    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local job = user:getVar("job")
    local message = ""

    local phonenumber = char.phone_number

    for k, v in ipairs(args) do
        message = message .. " " .. v
    end
    local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

    TriggerClientEvent("GPSTrack:Create", src)
    TriggerClientEvent("animation:phonecall", src)
    TriggerClientEvent("chatMessage", src, "911 | Anonymous", 1, tostring(message))
    TriggerEvent('dispatch:svNotify', {
        dispatchCode = "911 | Anonymous ",
        firstStreet = "Unavailable",
        gender = user:getGender(),
        isImportant = false,
        priority = 1,
        dispatchMessage = tostring(message),
        recipientList = {
            police = "police",
            ems = "ems"
        },
        origin = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        }
    })

    local users = exports["rd-base"]:getModule("Player"):GetUsers()

    local emergencyPlayers = {}

    for k, v in pairs(users) do
        local user = exports["rd-base"]:getModule("Player"):GetUser(v)
        local job = user:getVar("job")

        if job == "ems" or job == "police" then
            emergencyPlayers[#emergencyPlayers + 1] = v
        end
    end

    for k, v in ipairs(emergencyPlayers) do
        TriggerClientEvent("callsound", v)
        TriggerClientEvent("chatMessage", v, "911 | (" .. tonumber(src) .. ") Anonymous", 1, tostring(message))
    end
end)

RegisterServerEvent("311")
AddEventHandler("311", function(args)
    local src = source

    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local job = user:getVar("job")
    local message = ""
    local pName = GetPlayerName(source)
    local identifiers = GetPlayerIdentifiers(source)

    local phonenumber = char.phone_number

    for k, v in ipairs(args) do
        message = message .. " " .. v
    end
    local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

    -- TriggerClientEvent("GPSTrack:Create", src)
    TriggerClientEvent("animation:phonecall", src)
    TriggerClientEvent("chatMessage", src,
        "311 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 4, tostring(message))

        local connect = {
            {
                ["color"] = color,
                ["title"] = "** riddle [Police] | 311 Call **",
                ["description"] = "Steam Name:"..pName.. " \n Steam ID: "..identifiers[1].. " \n 911 | " .. char.first_name .. " " .. char.last_name .. " \n Message: " .. tostring(message),
            }
        }
        PerformHttpRequest("https://discord.com/api/webhooks/1012082637910847600/cKpN2i_Sn8PNYulkz54mPViM_SawPRIVmzrUUfKXXdSY6OeGUvR9n970_1_y2ixT36Tt", function(err, text, headers) end, 'POST', json.encode({username = "riddle | 311 Call", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })

    local users = exports["rd-base"]:getModule("Player"):GetUsers()

    local emergencyPlayers = {}

    for k, v in pairs(users) do
        local user = exports["rd-base"]:getModule("Player"):GetUser(v)
        local job = user:getVar("job")

        if job == "ems" or job == "police" then
            emergencyPlayers[#emergencyPlayers + 1] = v
        end
    end

    for k, v in ipairs(emergencyPlayers) do
        TriggerClientEvent("callsound", v)
        TriggerClientEvent("chatMessage", v, "311 | (" .. tonumber(src) .. ") " .. char.first_name .. " | " ..
            char.last_name .. " # " .. phonenumber, 4, tostring(message))
    end
end)

RegisterServerEvent("311r")
AddEventHandler("311r", function(args)
    local src = source
    -- table.remove(args, 1)

    if not args[1] or not tonumber(args[1]) then
        return
    end
    local target = args[1]

    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    local job = user:getVar("job")

    local canRun = (job == "police" or job == "ems") and true or false
    if not canRun then
        return
    end

    local message = ""

    local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

    for k, v in ipairs(args) do
        if k > 1 then
            message = message .. " " .. v
        end
    end
    TriggerClientEvent("animation:phonecall", src)

    local users = exports["rd-base"]:getModule("Player"):GetUsers()

    local emergencyPlayers = {}

    for k, v in pairs(users) do
        local user = exports["rd-base"]:getModule("Player"):GetUser(v)
        local job = user:getVar("job")

        if job == "ems" or job == "police" then
            emergencyPlayers[#emergencyPlayers + 1] = v
        end
    end

    for k, v in ipairs(emergencyPlayers) do
        TriggerClientEvent("chatMessage", v, "311r -> " .. target .. " | " .. char.first_name .. ' ' .. char.last_name,
            4, tostring(message))
    end

    TriggerClientEvent("chatMessage", target, "311r | (" .. tonumber(src) .. ")", 4, tostring(message))
end)

RegisterServerEvent('rd-police:jailGranted')
AddEventHandler('rd-police:jailGranted', function(args)
    local src = source
    reason = " "
    for argscount = 4, #args do
        reason = reason .. " " .. args[argscount]
    end

    print(tonumber(args[1]))
 
    local player = tonumber(args[1])
    local target = exports["rd-base"]:getModule("Player"):GetUser(player)
    local character = target:getCurrentCharacter()
    local playerName = character.first_name .. ' ' .. character.last_name

    local pdunit = exports["rd-base"]:getModule("Player"):GetUser(src)
    if not pdunit:getVar("job") == "police" then
        local steamid, name = pdunit:getVar("name"), pdunit:getVar("steamid")

        exports["rd-log"]:AddLog("Exploiter", pdunit, "User Attempted to jail player while not on pd", {
            target = playerName,
            reason = reason,
            cid = cid,
            time = tonumber(args[2]),
            src = src
        })
        DropPlayer(src, "")

        return
    end

    TriggerClientEvent('chatMessage', src, "JAILED ", 3, "" .. playerName .. " has been put in jail for " ..
        tonumber(args[2]) .. " month(s) for " .. reason)

    TriggerClientEvent('beginJail', player, false, args[2], playerName, character.id, date)

    local date = os.date("%c")
    TriggerClientEvent("drawScaleformJail", -1, tonumber(args[2]), playerName, character.id, date)

    TriggerEvent("rd:news:newConviction", {
        name = playerName,
        duration = time,
        charges = reason
    })

    TriggerEvent('server-jail-items', character.id, true)
    exports["rd-base"]:getModule("JobManager"):SetJob(target, "unemployed", true)

    -- crimeUser(player,reason,character.id)

end)

RegisterServerEvent('ped:forceTrunkAsk')
AddEventHandler('ped:forceTrunkAsk', function(targettrunk)
    TriggerClientEvent('ped:forcedEnteringVeh', targettrunk)
end)

--[[---------------------------------------------------
						Emotes
--]] ---------------------------------------------------

RegisterServerEvent('police:setEmoteData')
AddEventHandler('police:setEmoteData', function(emoteTable)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local emote = json.encode(emoteTable)
    exports.oxmysql:execute("UPDATE characters SET `emotes` = @emotes WHERE id = @cid", {
        ['emotes'] = emote,
        ['cid'] = char.id
    })
end)

RegisterServerEvent('police:setAnimData')
AddEventHandler('police:setAnimData', function(AnimSet)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local metaData = json.encode(AnimSet)
    exports.oxmysql:execute("UPDATE characters SET `meta` = @metaData WHERE id = @cid", {
        ['metaData'] = metaData,
        ['cid'] = char.id
    })
end)

RegisterServerEvent('police:getAnimData')
AddEventHandler('police:getAnimData', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT meta FROM characters WHERE id = @cid", {
        ['cid'] = char.id
    }, function(result)
        if (result[1]) then
            if not result[1].meta then
                TriggerClientEvent('checkDNA', src)
            else
                local sex = json.decode(result[1].meta)
                if sex == nil then
                    TriggerClientEvent('CheckDNA', src)
                    return
                end
                TriggerClientEvent('emote:setAnimsFromDB', src, result[1].meta)
                print(result[1].meta)
            end
        end
    end)
end)

RegisterServerEvent('police:getEmoteData')
AddEventHandler('police:getEmoteData', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT emotes FROM characters WHERE id = @cid", {
        ['cid'] = char.id
    }, function(result)
        if (result[1]) then
            local emotes = json.decode(result[1].emotes)
            if result[1] ~= nil then
                TriggerClientEvent('emote:setEmotesFromDB', src, emotes)
            else
                local emoteTable = {{
                    ['key'] = {289},
                    ["anim"] = "Handsup"
                }, {
                    ['key'] = {170},
                    ["anim"] = "HandsHead"
                }, {
                    ['key'] = {166},
                    ["anim"] = "Drink"
                }, {
                    ['key'] = {167},
                    ["anim"] = "Lean"
                }, {
                    ['key'] = {168},
                    ["anim"] = "Smoke"
                }, {
                    ['key'] = {56},
                    ["anim"] = "FacePalm"
                }, {
                    ['key'] = {57},
                    ["anim"] = "Wave"
                }, {
                    ['key'] = {289, 21},
                    ["anim"] = "gangsign1"
                }, {
                    ['key'] = {170, 21},
                    ["anim"] = "gangsign3"
                }, {
                    ['key'] = {166, 21},
                    ["anim"] = "gangsign2"
                }, {
                    ['key'] = {167, 21},
                    ["anim"] = "hug"
                }, {
                    ['key'] = {168, 21},
                    ["anim"] = "Cop"
                }, {
                    ['key'] = {56, 21},
                    ["anim"] = "Medic"
                }, {
                    ['key'] = {57, 21},
                    ["anim"] = "Notepad"
                }}

                local emote = json.encode(emoteTable)
                exports.oxmysql:execute("UPDATE characters SET `emotes` = @emotes WHERE id = @cid", {
                    ['emotes'] = emote,
                    ['identifier'] = char.id
                })
                TriggerClientEvent("emote:setEmotesFromDB", src, emoteTable)
            end
        end
    end)
end)

RegisterCommand('bill', function(source, args)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(args[1]))
    local character = user:getCurrentCharacter()
    local user2 = exports["rd-base"]:getModule("Player"):GetUser(src)
    local character2 = user2:getCurrentCharacter()
    exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ?', {character2.id}, function(result)
        if result[1].job == 'police' then
            user:removeBank(tonumber(args[2]))

            TriggerClientEvent('chatMessage', tonumber(args[1]), 'BILL', 4, 'You have $' .. tonumber(user:getBalance()) .. ' in the bank!')

            TriggerClientEvent('chatMessage', src, 'BILL', 4, 'You have billed them $' .. tonumber(args[2]))
            TriggerClientEvent('police:BillLog', src, tonumber(args[2]), tonumber(args[1]))
        end
    end)
end)
