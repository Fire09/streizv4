STX.DB = STX.DB or {}

function STX.DB.CreateNewPlayer(self, src, callback)
    local hexid = STX.Util:GetHexId(src)
    callback = callback and callback or function() return end

    local data = {
        hexid = hexid,
        communityid = STX.Util:HexIdToComId(hexid),
        steamid = STX.Util:HexIdToSteamId(hexid),
        license = STX.Util:GetLicense(src),
        name = GetPlayerName(src),
        rank = "user"
    }

    for k,v in pairs(data) do
        if not v or v == "" then
            callback(false, true)
            return
        end
    end

    local q = [[INSERT INTO users (hex_id, steam_id, community_id, license, name, rank)
                VALUES(@hexid, @steamid, @comid, @license, @name, @rank);]]
    local v = {
        ["hexid"] = data.hexid,
        ["steamid"] = data.steamid,
        ["comid"] = data.communityid,
        ["license"] = data.license,
        ["rank"] = data.rank,
        ["name"] = data.name
    }    

    exports.oxmysql:execute(q, v, function(rowsChanged)
        if not rowsChanged or not rowsChanged.changedRows then callback(false, true) return end

        local created = rowsChanged and true or false
        callback(created)
    end)
end
function STX.DB.CreateNewCharacter(self, src, data2, hexid, ph, hardcore, lifer, callback)
    local hexid = hexid
    callback = callback and callback or function() return end
    local hd = hardcore
    local data = data2
    for k,v in pairs(data) do
        if not v or v == "" then
            callback(false, true)
            return
        end
    end

    local q = [[INSERT INTO characters (owner, first_name, last_name, dob, gender, phone_number, story, hardcore, jail_time, jail_time_mobster)
                VALUES(@owner, @first_name, @last_name, @dob, @gender, @phone_number, @story, @hardcore, @jail_time, @jail_time_mobster);]]
    local v = {
        ["owner"] = hexid,
        ["first_name"] = data.firstname,
        ["last_name"] = data.lastname,
        ["dob"] = data.dob,
        ["gender"] = data.gender,
        ["phone_number"] = ph,
        ["story"] = data.story,
        ["hardcore"] = hardcore,
        ["jail_time"] = lifer,
        ["jail_time_mobster"] = lifer
    }

    exports.oxmysql:execute(q, v, function(rowsChanged)
        -- print(json.encode(rowsChanged))
        -- if not rowsChanged or not rowsChanged.changedRows then callback(false, true) return end

        -- local created = rowsChanged and true or false
        if rowsChanged then
            if rowsChanged.affectedRows < 1 then 
                callback(false, true)
                return
            end
        end
            callback(true, false)
    end)
end

    
function STX.DB.PlayerExistsDB(self, src, callback)
    local hexId = STX.Util:GetHexId(src)
    callback = callback and callback or function() return end
    
    if not hexId or hexId == "" then callback(false, true) return end

    local q = [[SELECT hex_id FROM users WHERE hex_id = @id LIMIT 1;]]
    local v = {["id"] = hexId}

    exports.oxmysql:execute(q, v, function(results)
        if not results then callback(false, true) return end

        local exists = (results and results[1]) and true or false

        callback(exists)
    end)
end

function STX.DB.PhoneNumberExists(self, src, phone_number, callback)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)

    callback = callback and callback or function() return end

    if not user then callback(false, true) print("error error") return end

    local hexId = user:getVar("hexid")

    if not hexId or hexid == "" then callback(false, true) print('another error') return end

    local q = [[SELECT phone_number FROM characters WHERE owner = @id;]]
    local v = {
        ["id"] = hexid,
        ["phone_number"] = phone_number
    }


    exports.oxmysql:execute(q, v, function(results)
        if not results then callback(false, true) print('error error EXORTS') return end


        local exists = (results and results[1]) and true or false
        callback(exists)
    end)
end



function STX.DB.FetchPlayerData(self, src, callback)
    local hexId = STX.Util:GetHexId(src)
    callback = callback and callback or function() return end

    if not hexId or hexId == "" then callback(false, true) return end

    local q = [[SELECT id, hex_id, steam_id, community_id, name, rank FROM users WHERE hex_id = @id;]]
    local v = {["id"] = hexId}

    exports.oxmysql:execute(q, v, function(results)
        if not results then callback(false, true) return end
        results = results[1] and results or {}

        
        local fetched = (results and results[1]) and results[1] or false

        callback(fetched)
    end)
end

function STX.DB.FetchCharacterData(self, user, callback)
    callback = callback and callback or function() return end

    if not user then callback(false, true) return end

    local hexId = user:getVar("hexid")

    if not hexId or hexid == "" then callback(false, true) return end

    local q = [[SELECT id, owner, first_name, last_name, date_created, cash, bank, phone_number, dob, story, gender, new, deleted, jail_time, stress_level FROM characters WHERE owner = @owner]]
    local v = {["owner"] = hexId}

    exports.oxmysql:execute(q,v, function(results)
        if not user then callback(false, true) print('we have error') return end
        results = results[1] and results or {}
        callback(results)
    end)
end

function STX.DB.DeleteCharacter(self, user, id, callback)
    callback = callback and callback or function() return end

    if not user then callback(false, true) return end

    local hexId = user:getVar("hexid")

    if not hexId or hexId == "" then callback(false, true) return end
    if not id or type(id) ~= "number" then callback(false, true) return end

    local q = [[DELETE FROM characters WHERE owner = @hexid and id = @id;]]
    local v = {
        ["hexid"] = hexId,
        ["id"] = id
    }

    exports.oxmysql:execute(q, v, function(rowsChanged)
    if not rowsChanged.changedRows then callback(false, true) return end

    local deleted = rowsChanged and true or false

    callback(deleted)
     end)
end

-- function STX.DB.DeleteCharacter(self, user, id, callback)
--     callback = callback and callback or function() return end

--     if not user then callback(false, true) return end

--     local hexId = user:getVar("hexid")

--     if not hexId or hexId == "" then callback(false, true) return end
--     if not id or type(id) ~= "number" then callback(false, true) return end

--     local q = [[UPDATE characters SET deleted = 1, deleteion_data = NOW() WHERE owner = @hexid and id = @id;]]
--     local v = {
--         ["hexid"] = hexId,
--         ["id"] = id
--     }

--     exports.oxmysql:execute(q, v, function(rowsChanged)
--     if not rowsChanged.changedRows then callback(false, true) return end

--     local deleted = rowsChanged and true or false

--     callback(deleted)
--      end)
-- end

function STX.DB.UpdateCharacterStressLevel(self, user, characterId, newLevel, callback)
    callback = callback and callback or function() return end
    if not user then callback(false,true) return end
    if not characterId or type(characterId) ~= "number" then callback(false, true) return end

    if not user:ownsCharacter(characterId) then callback(false, true) return end

    local hexId = user:getVar("hexid")
    if not hexId or hexId == "" then callback(false, true) return end

    local q = [[UPDATE characters SET stress_level = @stress_level WHERE owner = @hexid AND id = @characterId;]]
    local v = {
        ["stress_level"] = newLevel,
        ["hexid"] = hexId,
        ["characterId"] = characterId
    }
    exports.oxmysql:execute(q, v, function(rowsChanged)
        if not rowsChanged.changedRows then callback(true,false) return end
        local updated = rowsChanged and true or false
        callback(updated)
    end)
end


function STX.DB.UpdateCharacterDirtyMoney(self, user, characterId, amount, callback)
callback = callback and callback or function() return end
    if not user then callback(false,true) return end
    if not characterId or type(characterId) ~= "number" then callback(false, true) return end

    if not user:ownsCharacter(characterId) then callback(false, true) return end

    local hexId = user:getVar("hexid")
    if not hexId or hexId == "" then callback(false, true) return end

    local q = [[UPDATE characters SET dirty_money = @dirty_money WHERE owner = @hexid AND id = @characterId;]]
    local v = {
        ["dirty_money"] = amount,
        ["hexid"] = hexId,
        ["characterId"] = characterId
    }
    exports.oxmysql:execute(q, v, function(rowsChanged)
        if not rowsChanged.changedRows then callback(false, true) return end
        local updated = rowsChanged and true or false
        callback(updated)
    end)
end


function STX.DB.UpdateCharacterMoney(self, user, characterId, amount, callback)
    callback = callback and callback or function() return end
        if not user then callback(false,true) return end
        if not characterId or type(characterId) ~= "number" then callback(false, true) return end
    
        if not user:ownsCharacter(characterId) then callback(false, true) return end
    
        local hexId = user:getVar("hexid")
        if not hexId or hexId == "" then callback(false, true) return end
    
        local q = [[UPDATE characters SET cash = @cash WHERE owner = @hexid AND id = @characterId;]]
        local v = {
            ["cash"] = amount,
            ["hexid"] = hexId,
            ["characterId"] = characterId
        }
        exports.oxmysql:execute(q, v, function(rowsChanged)
            if not rowsChanged.changedRows then callback(false, true) return end
            local updated = rowsChanged and true or false
            callback(updated)
        end)
end

function STX.DB.UpdateCharacterBank(self, user, characterId, amount, callback)
    callback = callback and callback or function() return end
        if not user then callback(false,true) return end
        if not characterId or type(characterId) ~= "number" then callback(false, true) return end
    
        if not user:ownsCharacter(characterId) then callback(false, true) return end
    
        local hexId = user:getVar("hexid")
        if not hexId or hexId == "" then callback(false, true) return end
    
        local q = [[UPDATE characters SET bank = @bank WHERE owner = @hexid AND id = @characterId;]]
        local v = {
            ["bank"] = amount,
            ["hexid"] = hexId,
            ["characterId"] = characterId
        }
        exports.oxmysql:execute(q, v, function(rowsChanged)
            if not rowsChanged.changedRows then callback(false, true) return end
            local updated = rowsChanged and true or false
            callback(updated)
        end)
end

function STX.DB.UpdateControls(self, src, controlsTable, callback)
    callback = callback and callback or function() return end
        local user = exports["rd-base"]:getModule("Player"):GetUser(src)
        if not user then callback(false,true) return end
    
        local hexId = user:getVar("hexid")
        if not hexId or hexId == "" then callback(false, true) return end
    
        local q = [[UPDATE users SET controls = @controls WHERE hex_id = @hexid;]]
        local v = {
            ["controls"] = json.encode(controlsTable),
            ["hexid"] = hexId
        }
        exports.oxmysql:execute(q, v, function(rowsChanged)
            if not rowsChanged.changedRows then callback(false, true) return end
            local updated = rowsChanged and true or false
            callback(updated)
        end)
end


function STX.DB.GetControls(self, src, callback)
    callback = callback and callback or function() return end
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
        Citizen.Wait(3000)
        if not user then callback(false, true) return end

        local hexId = user:getVar("hexid")

        if not hexId or hexid == "" then callback(false, true) return end

        local q = [[SELECT controls FROM users WHERE hex_id = @hex_id;]]
        local v = {["hex_id"] = hexid}

        exports.oxmysql:execute(q,v, function(results)
            if not user then callback(false, true) return end
            results = results[1] and results or {}
            callback(results)
        end)
end

    
function STX.DB.UpdateSettings(self, src, settingsTable, callback)
    callback = callback and callback or function() return end
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
        if not user then callback(false,true) return end
    
        local hexId = user:getVar("hexid")
        if not hexId or hexId == "" then callback(false, true) return end
    
        local q = [[UPDATE users SET settings = @settings WHERE hex_id = @hexid;]]
        local v = {
            ["settings"] = json.encode(settingsTable),
            ["hexid"] = hexId
        }
        exports.oxmysql:execute(q, v, function(rowsChanged)
            if not rowsChanged.changedRows then callback(false, true) return end
            local updated = rowsChanged and true or false
            callback(updated)
        end)
end


function STX.DB.GetSettings(self, src, callback)
    callback = callback and callback or function() return end
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if not user then callback(false, true) return end

    local hexId = user:getVar("hexid")

    if not hexId or hexid == "" then callback(false, true) return end

    local q = [[SELECT settings FROM users WHERE hex_id =@id;]]
    local v = {["id"] = hexid}

    exports.oxmysql:execute(q,v, function(results)
        if not user then callback(false, true) return end
        results = results[1] and results or {}
        callback(results)
    end)
end
