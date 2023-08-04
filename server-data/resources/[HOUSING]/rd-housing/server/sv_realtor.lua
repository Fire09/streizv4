--[[

    Variables

]]

local defaultInformations = {
    ["origin_offset"] = vector3(0.0, 0.0, 0.0),
    ["backdoor_coordinates"] = {
        ["internal"] = vector3(0.0, 0.0, 0.0),
        ["external"] = vector3(0.0, 0.0, 0.0),
    },
    ["garage_coordinates"] = vector4(0.0, 0.0, 0.0, 0.0),
    ["charChanger_offset"] = vector3(0.0, 0.0, 0.0),
    ["inventory_offset"] = vector3(0.0, 0.0, 0.0),
}

local housingEditing = {}

GetUserByCid = function(cid)
    for index, value in pairs(GetPlayers()) do
        local xPlayer = exports['rd-base']:getModule("Player"):GetUser(tonumber(value))
        local xChar = xPlayer:getCurrentCharacter()
        if xChar.id == tonumber(cid) then
            return xPlayer
        end
    end
end


--[[

    Events

]]

RegisterNetEvent("rd-housing:sell")
AddEventHandler("rd-housing:sell", function(pCid, pPropertyId)
    local src = source

    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local seller = character.id
    if not seller or seller == 0 then
        TriggerClientEvent("DoLongHudText", src, "seller not found", 2)
        return
    end

    TriggerClientEvent("rd-housing:buy", pCid, pPropertyId, seller)
end)

RegisterNetEvent("CheckFurniture")
AddEventHandler("CheckFurniture", function(pData, pPropertyId)
    local src = source

    if housingEditing[pPropertyId] ~= nil then
        TriggerClientEvent("DoLongHudText", src, "Someone's already decorating this property", 2)
    else
        housingEditing[pPropertyId] = src
        TriggerClientEvent("rd-editor:loadEditor", src, pData)
    end
end)

RegisterNetEvent("exitFurniture")
AddEventHandler("exitFurniture", function(pPropertyId)
    if housingEditing[pPropertyId] ~= nil then
        housingEditing[pPropertyId] = nil
    end
end)

AddEventHandler("playerDropped", function()
	local src = source


    for k, v in pairs(housingEditing) do
        if v == src then
            housingEditing[k] = nil
        end
    end
end)
--[[

    RPCs

]]

STR.register("AttemptHousingContract", function(src, pPropertyId, pTotal, pHousingName)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    
    local bank = tonumber(character.bank)
    if bank >= tonumber(pTotal) then
        user:removeBank(tonumber(pTotal))
    else
        return false, "Not enough money."
    end

    local insertId = MySQL.insert.await([[
        INSERT INTO housing (hid, cid, information, objects, last_payment, housingName)
        VALUES (?, ?, ?, ?, UNIX_TIMESTAMP(), ?)
    ]],
    { pPropertyId, cid, json.encode(defaultInformations), "{}", pHousingName })

    if not insertId or insertId < 1 then
        return false, "Database insert eror"
    end

    local insertId2 = MySQL.insert.await([[
        INSERT INTO housing_keys (hid, cid)
        VALUES (?, ?)
    ]],
    { pPropertyId, cid })

    if not insertId2 or insertId2 < 1 then
        return false, "Database insert eror"
    end
    
    local deleteId = MySQL.query.await([[
        DELETE FROM housing_price WHERE hid = ?
    ]], {pPropertyId})

    TriggerClientEvent("rd-housing:loadHousingClient",src)
    return true
end)

STR.register("rd-housing:rent", function(src, pPropertyId, pTotal, pTax)
    local user = exports['rd-base']:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    local cid = character.id
    if not cid or cid == 0 then
        return false, "ID not found"
    end

    --local accountId = exports["rd-base"]:getChar(src, "bankid")
    --local groupBank = exports["rd-groups"]:groupBank("real_estate")

    --if not accountId or not groupBank then
    --    return false, "Erro ao buscar conta"
    --end

    --local bank = exports["rd-financials"]:getBalance(accountId)
    --if bank < pTotal then
    --    return false, "Você não possui $" .. pTotal .. " em sua conta"
    --end

    --local comment = "Pagamento de aluguel da propriedade " .. Housing.info[pPropertyId]["street"]
    --local success, message = exports["rd-financials"]:transaction(accountId, groupBank, pTotal, comment, cid, 5)
    --if not success then
    --    return false, message
    --end

    --exports["rd-financials"]:addTax("Propertys", pTax)

    local insertId = MySQL.insert.await([[
        INSERT INTO housing (hid, cid, information, objects, last_payment)
        VALUES (?, ?, ?, ?, UNIX_TIMESTAMP())
    ]],
    { pPropertyId, cid, json.encode(defaultInformations), "{}" })

    if not insertId or insertId < 1 then
        return false, "Database insert eror"
    end

    TriggerClientEvent("DoLongHudText", src, "You rented " .. Housing.info[pPropertyId]["street"])

    return true, getCurrentOwned(src)
end)

STR.register("updateCurrentSelected", function(pPropertyId, pInformation, pOrigin)
    if pInformation["id"] then
        pInformation["id"] = nil
    end

    local affectedRows = MySQL.update.await([[
        UPDATE housing
        SET information = ?
        WHERE hid = ?
    ]],
    { json.encode(pInformation), pPropertyId })

    if not affectedRows or affectedRows < 1 then
        return false
    end

    local info = pInformation
    local name = Housing.info[pPropertyId]["street"]

    local data = {
        ["houseid"] = pPropertyId,
        ["type"] = "car",
        ["pos"] = info.garage_coordinates,
        ["distance"] = 50,
        ["spaces"] = {info.garage_coordinates}
    }

    --exports["rd-vehicles"]:setGarage(name, data, nil, false)

    return true
end)

local objectName = {}

RegisterServerEvent("objects:GetObjectEditor")
AddEventHandler("objects:GetObjectEditor", function(name)
    objectName = name
    print("RGS",objectName)
end)


STR.register("objects:getObjects", function()
    local data = {}
    data["name"] = objectName
    data["objects"] = {}

    local result = MySQL.scalar.await([[
        SELECT objects
        FROM housing
        WHERE hid = ?
    ]],
    { objectName })

    if result and type(result) == "string" then
        data["objects"] = json.decode(result)
    end

    return data
end)

local rgsHid = {}

RegisterServerEvent("rd-housing:isHousingLockedServer")
AddEventHandler("rd-housing:isHousingLockedServer", function(rgs)
    rgsHid = rgs
end)

STR.register("rd-housing:isHousingLockedServer", function()
    local bank = MySQL.query.await([[
        SELECT * FROM housing
        WHERE hid = ?
    ]],
    { rgsHid })

    return bank[1].status
end)

STR.register("objects:saveObjects", function(src, pDataToSend)
    local data = {}
    data["name"] = pDataToSend["name"]
    data["objects"] = pDataToSend["objects"]

    local result = MySQL.update.await([[
        UPDATE housing
        SET objects = ?
        WHERE hid = ?
    ]],
    { json.encode(pDataToSend["objects"]), pDataToSend["name"] })

    return data
end)

STR.register("rd-housing:owned", function(src)
    local result = MySQL.query.await([[
        SELECT hid
        FROM housing
    ]])

    local houses = {}
    for i, v in ipairs(result) do
        houses[v.hid] = true
    end

    return houses
end)

RegisterNetEvent("rd-housing:getGarages", function()
    local src = source
    local houses = MySQL.query.await([[
        SELECT hid, information
        FROM housing
    ]])

    for i, v in ipairs(houses) do
        local info = json.decode(v.information)
        local name = Housing.info[v.hid]["street"]
        local vector = vector3(info.garage_coordinates["x"], info.garage_coordinates["y"], info.garage_coordinates["z"])
        local heading = info.garage_coordinates["w"]
        local garagedata = json.encode(vector)
        TriggerClientEvent("menu:send:rd-housing:garages", src,json.decode(garagedata),v.hid)
    end
end)