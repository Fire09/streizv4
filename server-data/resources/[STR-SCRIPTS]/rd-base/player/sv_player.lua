STX.Users = STX.Users or {}
STX.Player = STX.Player or {}

function STX.Player.GetUser(self, id)
    return STX.Users[id] and STX.Users[id] or false
end

function STX.Player.GetUsers(self)
    local tmp = {}

    for k, v in pairs(STX.Users) do
        tmp[#tmp+1]= k
    end

    return tmp
end

local function GetUser(user)
    return STX.Users[user.source]
end

local function AddMethod(player)
    function player.getVar(self, var)
        return GetUser(self)[var]
    end

    function player.setVar(self, var, data)
        GetUser(self)[var] = data
    end
    
    function player.networkVar(self, var, data)
        self:setVar(var, data)
        TriggerClientEvent("rd-base:networkVar", GetUser(self):getVar("source"), var, data)
    end

    function player.getRank(self)
        return GetUser(self).rank
    end

    function player.setRank(self, rank)
        GetUser(self).rank = rank
        self:networkVar("rank", rank)
    end

    function player.setCharacters(self, data)
        GetUser(self).characters = data
    end

    function player.setCharacter(self, data)
        GetUser(self).character = data
    end

    function player.getCash(self)
        return GetUser(self).character.cash
    end

    function player.getBalance(self)
        return GetUser(self).character.bank
    end

    function player.getDirtyMoney(self)
        return GetUser(self).character.dirty_money
    end

    function player.getGangType(self)
        return GetUser(self).character.gang_type
    end

    function player.getStressLevel(self)
        return GetUser(self).character.stress_level
    end

    function player.getJudgeType(self)
        return GetUser(self).character.judge_type
    end

    function player.alterDirtyMoney(self, amt)
        local characterId = GetUser(self.character.id)

        GetUser(self).character.dirty_money = amt

        STX.DB:UpdateCharacterDirtyMoney(GetUser(self), characterId, amt, function(updatedMoney, err)
            if updatedMoney then
                --We are good here.
            end
        end)
    end

    function player.alterStressLevel(self, amt)
        local characterid = GetUser(self).character.id

        GetUser(self).character.stress_level = amt

        STX.DB:UpdateCharacterStressLevel(GetUser(self), characterId, amt, function(updatedMoney, err)
            if updatedMoney then
                --We are good here.
            end
        end)
    end

    function player.resetDirtyMoney(self)
        local characterid = GetUser(self).character.id

        GetUser(self).character.dirty_money = 0

        STX.DB:UpdateCharacterDirtyMoney(GetUser(self), characterId, 0, function(updatedMoney, err)
            if updatedMoney then
                --We are good here.
            end
        end)
    end

    function player.addMoney(self, amt)
        if not amt or type(amt) ~= "number" then return end
        local cash = GetUser(self):getCash() + amt
        local characterId = GetUser(self).character.id
        local src = GetUser(self).source

        amt = math.floor(amt)

        GetUser(self).character.cash = cash

        STX.DB:UpdateCharacterMoney(GetUser(self), characterId, cash, function(updatedMoney, err) 
            if updatedMoney then
                TriggerClientEvent("banking:addCash", GetUser(self).source, amt)
                TriggerClientEvent("banking:updateCash", GetUser(self).source, GetUser(self):getCash(), amt)
                -- exports["rd-base"]:AddLog("Cash Added", GetUser(self), "Money added to user, amount: " .. tostring(amt))
            end
        end)
    end

    function player.removeMoney(self, amt)
        if not amt or type(amt) ~= "number" then return end
        local cash = GetUser(self):getCash() - amt
        local characterId = GetUser(self).character.id
        local src = GetUser(self).source

        amt = math.floor(amt)

        GetUser(self).character.cash = GetUser(self).character.cash - amt


        STX.DB:UpdateCharacterMoney(GetUser(self), characterId, cash, function(updatedMoney, err) 
            if updatedMoney then
                TriggerClientEvent("banking:removeCash", GetUser(self).source, amt)
                TriggerClientEvent("banking:updateCash", GetUser(self).source, GetUser(self):getCash(), amt)
                -- exports["rd-base"]:AddLog("Cash Removed", GetUser(self), "Money removed from user, amount: " .. tostring(amt))
            end
        end)
    end

    
    function player.removeBank(self, amt)
        if not amt or type(amt) ~= "number" then return end
        local bank = GetUser(self):getBalance() - amt
        local characterId = GetUser(self).character.id
        local src = GetUser(self).source

        amt = math.floor(amt)

        GetUser(self).character.bank = GetUser(self).character.bank - amt

        STX.DB:UpdateCharacterBank(GetUser(self), characterId, bank, function(updatedMoney, err) 
            if updatedMoney then
                TriggerClientEvent("banking:removeBalance", GetUser(self).source, amt)
                TriggerClientEvent("banking:updateBalance", GetUser(self).source, GetUser(self):getBalance(), amt)
                -- exports["rd-base"]:AddLog("Bank Removed", GetUser(self), "Bank removed from user, amount: " .. tostring(amt))
            end
        end)
    end

    function player.addBank(self, amt)
        if not amt or type(amt) ~= "number" then return end
        local bank = GetUser(self):getBalance() + amt
        local characterId = GetUser(self).character.id
        local src = GetUser(self).source

        amt = math.floor(amt)

        GetUser(self).character.bank = bank

        STX.DB:UpdateCharacterBank(GetUser(self), characterId, bank, function(updatedMoney, err) 
            if updatedMoney then
                TriggerClientEvent("banking:addBalance", GetUser(self).source, amt)
                TriggerClientEvent("banking:updateBalance", GetUser(self).source, GetUser(self):getBalance(), amt)
                -- exports["rd-base"]:AddLog("Bank Added", GetUser(self), "Bank added to user, amount: " .. tostring(amt))
            end
        end)
    end

    function player.getNumCharacters(self)
        if not GetUser(self).charactersLoaded or not GetUser(self).characters then return 0 end
        return #GetUser(self).characters
    end

    function player.ownsCharacter(self, id)
        if not GetUser(self).charactersLoaded or not GetUser(self).characters or GetUser(self):getNumCharacters() <= 0 then return false end

        for k,v in ipairs(GetUser(self).characters) do 
            if v.id == id then return true end 
        end

        return false
    end

    function player.getGender(self)
        if not GetUser(self).charactersLoaded or not GetUser(self).characters or not GetUser(self).characterLoaded then return false end

        return GetUser(self).character.gender
    end
        
    function player.getCharacters(self)
        return GetUser(self).characters
    end

    function player.getCharacter(self, id)
        if not GetUser(self).charactersLoaded or not GetUser(self).characters or GetUser(self):getNumCharacters() <= 0 then return false end
        if not GetUser(self):ownsCharacter(id) then return false end

        for k,v in ipairs(GetUser(self).characters) do 
            if v.id == id then return v end
        end

        return false
    end

    function player.getCurrentCharacter(self)
        if not GetUser(self).charactersLoaded or not GetUser(self).characterLoaded or GetUser(self):getNumCharacters() <= 0 then return false end
        return GetUser(self).character
    end

    return player
end

    local function CreatePlayer(src)
        local self = {}

        self.source = src
        self.name = GetPlayerName(src)
        self.hexid = STX.Util:GetHexId(src)
        
        if not self.hexid then
            DropPlayer(src, "Error fetching steamid")
            return
        end

        self.comid = STX.Util:HexIdToComId(self.hexid)
        self.steamid = STX.Util:HexIdToSteamId(self.hexid)
        self.license = STX.Util:GetLicense(src)
        self.ip = GetPlayerEP(src)
        self.rank = "user"

        self.characters = {}
        self.character = {}

        self.charactersLoaded = false
        self.characterLoaded = false

        local methods = AddMethod(self)

        STX.Users[src] = methods

        return methods
    end


function STX.Player.CreatePlayer(self, src, recrate)
    if recreate then STX.Users[src] = nil end
    
    if STX.Users[src] then return STX.Users[src] end

    return CreatePlayer(src)
end

local pos = {}
RegisterServerEvent('rd-base:updatecoords')
AddEventHandler('rd-base:updateCoords', function(x,y,z)
    local src = source
    pos[src] = {x,y,z}
end)

RegisterServerEvent("retreive:licenes:server")
AddEventHandler("retreive:licenes:server", function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    exports.oxmysql:execute('SELECT * FROM user_licenses WHERE cid = ? AND type = ?', {characterId, "Weapon"}, function(callback)
        if callback[1] ~= nil then
            TriggerClientEvent("wtflols", src, callback[1].status)
        end
    end)
end)


RegisterServerEvent("retreive:jail")
AddEventHandler("retreive:jail", function(cid)
    local src = source
    exports.oxmysql:execute("SELECT `jail_time` FROM `characters` WHERE id = ?", {cid}, function(result)
        if result[1].jail_time >= 1 then
            TriggerClientEvent("beginJail2", src, result[1].jail_time, true)
        end
    end)
end)

AddEventHandler("playerDropped", function(reason)
    local src = source
    if reason == nil then reason = "Unknown" end
    local user = STX.Player:GetUser(src)
    local posE = json.encode(pos[src])
    local pSteamName = GetPlayerName(src)
    pos[src] = nil

    local pUser = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = pUser:getVar("character")
    local userjob = user:getVar("job") or "Unemployed"
    if userjob == "police"or userjob == "sheriff" or userjob == "state" then
       -- exports['rd-emergencyjobs']:DisconnectJobUpdater(userjob)
        TriggerEvent("rd-emergencyjobs:log:update", src, "clockoff")
    elseif userjob == "ems" then
       -- exports['rd-emergencyjobs']:DisconnectJobUpdater(userjob)
    end

    STX.Users[src] = nil
    TriggerEvent('rd-base:playerDropped', src, user)
    
end)