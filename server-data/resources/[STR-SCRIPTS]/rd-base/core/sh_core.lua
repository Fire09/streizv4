STX.Core = STX.Core or {}

function STX.Core.ConsoleLog(self, msg, mod)
    if not tostring(msg) then return end
    if not tostring(mod) then mod = "No Module" end
    
    local pMsg = string.format("[ot LOG - %s] %s", mod, msg)
    if not pMsg then return end

end

RegisterNetEvent("rd-base:consoleLog")
AddEventHandler("rd-base:consoleLog", function(msg, mod)
    STX.Core:ConsoleLog(msg, mod)
end)

function getModule(module)
    if not STX[module] then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return STX[module]
end

function addModule(module, tbl)
    if STX[module] then print("Warning: '" .. tostring(module) .. "' module is being overridden") end
    STX[module] = tbl
end

STX.Core.ExportsReady = false

function STX.Core.WaitForExports(self)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if exports and exports["rd-base"] then
                TriggerEvent("rd-base:exportsReady")
                STX.Core.ExportsReady = true
                return
            end
        end
    end)
end

exports("getModule", getModule)
exports("addModule", addModule)
STX.Core:WaitForExports()

-- local webhook = 'https://discord.com/api/webhooks/835907598393933826/6wy-rkKTVajy398VsrBD6iM1gGACKTilHGWyypihQ-dSqYdIJFFBDlZMObB39FxRlfnm' -- Your Discord webhook for logs
-- local webhook2 = 'https://discord.com/api/webhooks/835907709730684928/QKfl8_Q45x3-yHWBspQqdQvC5m-D5BFga_Yy0j3MXuS8EGiSDPGy5fr_HSlI8Qf3Fujm' -- Your Discord webhook for logs
-- local webhook3 = 'https://discord.com/api/webhooks/835907836868689931/NHTCW_7EFMbhxeRVlrFkGaS7gYoAhHV4kiXlOZTigW5M07GhiuYY42ACaQ4o_QGhYgea' -- Your Discord webhook for logs
-- local webhook4 = 'https://discord.com/api/webhooks/835907910268878910/T3ZNbhKQUJ1hE1_ONQh-jNmq0rmX7f5UP6-ZusxgYaLMpQhAGtfw730VwVrspua2RD_V' -- Your Discord webhook for logs
-- local webhook5 = 'https://discordapp.com/api/webhooks/831302419911933953/RfayTWct_EZFbl7fMjAK3Pqr3GqqEtykZEPDej31pCqJnAWMew8_ixUNCnfz7iNpmYql' -- Your Discord webhook for logs

-- local webhook6 = 'https://discord.com/api/webhooks/835908118822256661/VNUWqcdvg1__9ggjjXOzMDm1yeUwKslj9ypQzDDYyFNrcdvQpVSWmQKekRl9yIEIKyDX' -- MDT - Reports Deleted
-- local webhook7 = 'https://discord.com/api/webhooks/835908217191268375/iLeQydtVS2Q7coxTWuiRVidvqvzvMpzAYg5UYx5QSoJINYxIR0YIQRWDrRRFvNY_PlYf' -- MDT - Warrant Deleted

-- local webhook8 = 'https://discord.com/api/webhooks/835908282379403295/pivduudmMYrqFdxeRC3peE-t0hZYZOE8ynSaBhzuKQXQKMSNIDcLuoB38cmjFkCoGAsl' -- Teleporters - Meth Enter / Leave
-- local webhook9 = 'https://discord.com/api/webhooks/835908339425738853/Jc1umQRP3kEIBPLZHiKJ3eyFg3jNPz1AyUIuDXzZUJl_uvlHk2TMLY-m6_peSATwD2T1' -- Teleporters - Coke Enter / Leave
-- local webhook10 = 'https://discord.com/api/webhooks/835908400583934012/_sdxoyDp_EPicWxo3VrdR1X4Xu5bwzRgs0OJ735MMiG2E_8TLShs4bNX2sg_tikUHbcS' -- Teleporters - Recycle Enter / Leave


-- RegisterNetEvent('convienceregister:log')
-- AddEventHandler('convienceregister:log', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "started to a empty a Convience Store Register!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('conviencesafe:log')
-- AddEventHandler('conviencesafe:log', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "started to a empty a Convience Store Safe!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--       PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	

-- end)

-- RegisterNetEvent('stealcommand:log')
-- AddEventHandler('stealcommand:log', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "/steal command used", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook2, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('jewelrobbery:log')
-- AddEventHandler('jewelrobbery:log', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Jewelry Store Robbery", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook3, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('banktruckrobbery:log')
-- AddEventHandler('banktruckrobbery:log', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Bank Truck Robbery", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--   	PerformHttpRequest(webhook4, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)


-- RegisterNetEvent('dmg:log')
-- AddEventHandler('dmg:log', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Damage Exceeded", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }
--     PerformHttpRequest(webhook5, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('rd-mdt:delreport')
-- AddEventHandler('rd-mdt:delreport', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local char = user:getCurrentCharacter()
--     local hexId = user:getVar("hexid")
--     local pCharName = char.first_name .. " " ..char.last_name
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "MDT - Report Deleted", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['fields'] = {
--                 {
--                     ['name'] = '`Character Name`',
--                     ['value'] = pCharName,
--                     ['inline'] = true
--                 },
--                 {
--                     ['name'] = '`Reason For Log`',
--                     ['value'] = "Deleted a MDT Report",
--                     ['inline'] = true
--                 }
--             },
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--   	PerformHttpRequest(webhook6, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('rd-mdt:delwarrant')
-- AddEventHandler('rd-mdt:delwarrant', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local char = user:getCurrentCharacter()
--     local hexId = user:getVar("hexid")
--     local pCharName = char.first_name .. " " ..char.last_name
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "MDT - Warrent Deleted", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['fields'] = {
--                 {
--                     ['name'] = '`Character Name`',
--                     ['value'] = pCharName,
--                     ['inline'] = true
--                 },
--                 {
--                     ['name'] = '`Reason For Log`',
--                     ['value'] = "Deleted a MDT Warrent",
--                     ['inline'] = true
--                 }
--             },
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--   	PerformHttpRequest(webhook7, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('meth:enter')
-- AddEventHandler('meth:enter', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Entered the Meth Lab!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook8, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('meth:leave')
-- AddEventHandler('meth:leave', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Left the Meth Lab!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook8, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('coke:enter')
-- AddEventHandler('coke:enter', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Entered the Coke Lab!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook9, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('coke:leave')
-- AddEventHandler('coke:leave', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Left the Coke Lab!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook9, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('recycle:enter')
-- AddEventHandler('recycle:enter', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Entered the Recycle Plant", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook10, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)

-- RegisterNetEvent('recycle:leave')
-- AddEventHandler('recycle:leave', function()
--     local src = source
--     local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     local hexId = user:getVar("hexid")
--     local pName = GetPlayerName(source)
--     local pDiscord = GetPlayerIdentifiers(src)[3]
--     local LogData = {
--         {
--             ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Left the Recycle Plant!", src, hexId, pDiscord),
--             ['color'] = 2317994,
--             ['author'] = {
--                 ['name'] = "Steam Name: "..pName
--             },
--         }
--     }

--     PerformHttpRequest(webhook11, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })	
-- end)