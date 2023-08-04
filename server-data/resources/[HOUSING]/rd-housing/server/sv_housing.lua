--[[

    Variables

]]

Housing.currentHousingLocks = {}
Housing.currentHousingLockdown = {}
Housing.BuisnessLocations = {}
Housing.Players = {}

--[[

    Functions

]]

GetUserByCid = function(cid)
    for index, value in pairs(GetPlayers()) do
        local xPlayer = exports['rd-base']:getModule("Player"):GetUser(tonumber(value))
        local xChar = xPlayer:getCurrentCharacter()
        if xChar.id == tonumber(cid) then
            return xPlayer
        end
    end
end


function getCurrentOwned(src)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid then return {} end

    local result = MySQL.query.await([[
        SELECT hid, DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP()), FROM_UNIXTIME(last_payment)) AS last_payment
        FROM housing
        WHERE cid = ?
    ]],
    { cid })
    local owned = {}

    for i, v in ipairs(result) do
        local tax = Housing.info[v.hid]["price"]

        owned[v.hid] = {
            house_id = v.hid,
            house_name = Housing.info[v.hid]["street"],
            house_price = tax,
            last_payment = v.last_payment,
            raggsySex = v.cid
        }
    end

    return owned
end

STR.register("rd-housing:isThisPropertyOwned", function(propertyId)

    local result = MySQL.query.await([[
        SELECT * FROM housing WHERE hid = ?
    ]],
    { propertyId })
    if result ~= nil and result[1] ~= nil then 
        return true 
    end
    return false
end)
function currentKeys(src)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid then return {} end

    local result = MySQL.query.await([[
        SELECT k.hid, DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP()), FROM_UNIXTIME(h.last_payment)) AS last_payment
        FROM housing_keys k
        INNER JOIN housing h ON h.hid = k.hid
        WHERE k.cid = ?
    ]],
    { cid })

    local owned = {}

    for i, v in ipairs(result) do
        local tax = Housing.info[v.hid]["price"]

        owned[v.hid] = {
            house_id = v.hid,
            house_name = Housing.info[v.hid]["street"],
            house_price = tax,
            last_payment = v.last_payment
        }
    end

    return owned
end

--[[

    Exports

]]

exports("getCurrentOwned", getCurrentOwned)
exports("currentKeys", currentKeys)

--[[

    Events

]]

RegisterNetEvent("rd-housing:enterHouse")
AddEventHandler("rd-housing:enterHouse", function(pPropertyId)
    local src = source
    Housing.Players[src] = pPropertyId
end)

RegisterNetEvent("rd-housing:leftHouse")
AddEventHandler("rd-housing:leftHouse", function(pPropertyId)
    local src = source
    Housing.Players[src] = nil
end)

STR.register("getCurrentOwned", function(src)
    return getCurrentOwned(src)
end)

STR.register("currentKeys", function(src)
    return currentKeys(src)
end)

STR.register("getCurrentLockdown", function(src)
    return Housing.currentHousingLockdown
end)

STR.register("getBuisnessLocations", function(src)
    return Housing.BuisnessLocations
end)

STR.register("getCurrentSelected", function(src, pPropertyId)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id

    local finished = true

    local _information = MySQL.scalar.await([[
        SELECT information
        FROM housing
        WHERE hid = ?
    ]],
    { pPropertyId })

    local housingInformation = {}
    if _information and type(_information) == "string" then
        housingInformation = json.decode(_information)
        for k, v in pairs(housingInformation) do
            if k == "backdoor_coordinates" then
                for k2, v2 in pairs(v) do
                    housingInformation[k][k2] = vector3(v2.x, v2.y, v2.z)
                end
            elseif k == "garage_coordinates" then
                if v.w then
                    housingInformation[k] = vector4(v.x, v.y, v.z, v.w)
                else
                    housingInformation[k] = vector3(v.x, v.y, v.z)
                end
            else
                housingInformation[k] = vector3(v.x, v.y, v.z)
            end
        end
    end

    local currentHousingLocks = Housing.currentHousingLocks

    local keys = currentKeys(src)
    for k, v in pairs(keys) do
        currentHousingLocks[k] = false
    end

    local _result = MySQL.scalar.await([[
        SELECT id
        FROM housing
        WHERE hid = ? AND cid = ?
    ]],
    { pPropertyId, cid })

    local isResult = false
    if _result then
        isResult = true
    end

    local housingLockdown = Housing.currentHousingLockdown

    local housingRobbed = Housing.housingBeingRobbed

    local robTargets = {}
    if Housing.housingRobTargets[pPropertyId] ~= nil then
        robTargets = Housing.housingRobTargets[pPropertyId]
    end

    local robLocations = {}
    if Housing.robPosLocations[pPropertyId] ~= nil then
        robLocations = Housing.robPosLocations[pPropertyId]
    end

    local alarm = false
    if Housing.alarm[pPropertyId] ~= nil then
        alarm = Housing.alarm[pPropertyId]
    end

    local currentAccess = {}

    return finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess
end)

STR.register("rd-phone:getHouseKeys", function(src, pHouseId)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid then return {} end

    local keys = MySQL.query.await([[
        SELECT k.hid as house_id, k.cid AS player_cid, CONCAT(c.first_name," ",c.last_name) as player_name
        FROM housing_keys k
        INNER JOIN characters c ON c.id = k.cid
        WHERE k.hid = ?
    ]],
    { pHouseId })

    for i, v in ipairs(keys) do
        keys[i]["house_name"] = Housing.info[v.house_id]["street"]
    end

    return keys
end)

STR.register("rd-phone:giveKey", function(src, pHouseId, pPlayerId)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid then return false, "ID não encontrado" end

    local user2 = exports['rd-base']:getModule("Player"):GetUser(pPlayerId)
    local character2 = user2:getCurrentCharacter()
    local playerCid = character2.id
    if not cid then return false, "ID não encontrado" end

    local hasKey = MySQL.scalar.await([[
        SELECT id
        FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, playerCid })

    if hasKey then
        return false, "O player já possui a chave desta casa."
    end

    local insertId = MySQL.insert.await([[
        INSERT INTO housing_keys (hid, cid)
        VALUES (?, ?)
    ]],
    { pHouseId, playerCid })

    if not insertId or insertId < 1 then
        return false, "Database insert eror"
    end

    TriggerClientEvent("rd-phone:notification", pPlayerId, "fas fa-key", "Keys", "Você recebeu a chave da propriedade " .. Housing.info[pHouseId]["street"], 5000)
    TriggerClientEvent("rd-housing:refresh", pPlayerId)

    return true, "Chave recebida"
end)

STR.register("rd-phone:removeKey", function(src, pHouseId, pPlayerId)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid then return false end

    local affectedRows = MySQL.update.await([[
        DELETE FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, pPlayerId })

    if affectedRows and affectedRows > 0 then
        local pPlayerId = GetUserByCid(pPlayerId)
        if pPlayerId > 0 then
            TriggerClientEvent("rd-housing:refresh", pPlayerId)
        end

        return true
    end

    return false
end)

STR.register("rd-phone:payHouse", function(src, pHouseId)
    if not pHouseId or not src then return false, "pHouseId or src not found" end

    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
   -- if not cid then return false, "cid not found" end

   -- local price = Housing.info[pHouseId]["price"]
  --  local tax = price
   -- local priceTotal = tax.total

   -- local accountId = exports["rd-base"]:getChar(src, "bankid")
   -- local bank = exports["rd-financials"]:getBalance(accountId)
   -- if bank < priceTotal then
   --     return false, "Você não tem $" .. priceTotal .. " em sua conta"
    --end

    --local groupBank = exports["rd-groups"]:groupBank("real_estate")

    --local comment = "Pagamento de aluguel da propriedade " .. Housing.info[pHouseId]["street"]
    --local success, message = exports["rd-financials"]:transaction(accountId, groupBank, price, comment, cid, 5)
    --if not success then
      --  return false, message
    --end

    --exports["rd-financials"]:addTax("Propertys", tax.tax)

    local affectedRows = MySQL.update.await([[
        UPDATE housing
        SET last_payment = last_payment + 604800
        WHERE hid = ?
    ]],
    { pHouseId })

    if not affectedRows or affectedRows < 1 then
        return false, "affectedRows ~= 1"
    end

    return true, ":)"
end)

STR.register("rd-phone:removeSharedKey", function(src, pHouseId)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid then return false end

    local affectedRows = MySQL.update.await([[
        DELETE FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, cid })

    if affectedRows and affectedRows > 0 then
        TriggerClientEvent("rd-housing:refresh", src)
        return true
    end

    return false
end)

STR.register("unlockProperty", function(src, pHouseId)
    if Housing.currentHousingLocks[pHouseId] ~= nil and Housing.currentHousingLocks[pHouseId] == false then
        return false, Housing.currentHousingLocks
    end

    Housing.currentHousingLocks[pHouseId] = false

    local result = MySQL.update.await([[
        UPDATE housing
        SET status = ?
        WHERE hid = ?
    ]],
    { "Unlock", pHouseId })

    return true, Housing.currentHousingLocks
end)

STR.register("lockProperty", function(src, pHouseId)
    if Housing.currentHousingLocks[pHouseId] == nil then
        return false, Housing.currentHousingLocks
    end

    Housing.currentHousingLocks[pHouseId] = nil

    local result = MySQL.update.await([[
        UPDATE housing
        SET status = ?
        WHERE hid = ?
    ]],
    { "Lock", pHouseId })

    return true, Housing.currentHousingLocks
end)

STR.register('property:getOwnerRaw', function(source, propertyId)
    exports.oxmysql:execute("SELECT `cid` FROM `housing` WHERE hid = @hid", {['hid'] = propertyId}, function(data)
        if data[1] == nil then
            TriggerClientEvent("housing:OwnerSee", source)
        else
            TriggerClientEvent("housing:OwnerSee", source, tonumber(data[1].cid))
        end
    end)
    return owner
end)

STR.register('property:getOwner', function(result)
    return result
end)