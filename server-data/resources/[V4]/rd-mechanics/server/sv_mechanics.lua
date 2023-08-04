BUSINESSES = {}
RECEIVED_RECEIPTS = {}
ACTIVE_PURCHASES = {}

local function initBusinesses()
    local query = "SELECT * FROM _mechanics"
    local queryData = Await(SQL.execute(query))

    for k, v in pairs(queryData) do
        BUSINESSES[v.code] = {}
        BUSINESSES[v.code].id = v.id
        BUSINESSES[v.code].name = v.name
        BUSINESSES[v.code].foodItems = json.decode(v.foodItems)
        BUSINESSES[v.code].menu = json.decode(v.menu)
        BUSINESSES[v.code].safeCash = v.safeCash
        BUSINESSES[v.code].open = v.openHour
        BUSINESSES[v.code].close = v.closeHour
        BUSINESSES[v.code].employees = {}
    end
end

Citizen.CreateThread(function()
    initBusinesses()
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for i = 1, #RECEIVED_RECEIPTS do
            if os.time() - RECEIVED_RECEIPTS[i].time > 3600 then
                table.remove(RECEIVED_RECEIPTS, i)
            end
        end
    end
end)

RegisterNetEvent("rd-mechanics:triggerSilentAlarm")
AddEventHandler("rd-mechanics:triggerSilentAlarm", function(pCoords)
    local src = source
    -- rd-dispatch
end)

STR.register("rd-mechanics:joinJob", function(pSource, pBiz, pType)
    print(pSource, pBiz, pType)
    local src = pSource
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local bizId = BUSINESSES[pBiz].id
    local isEmployed = exports["rd-business"]:IsEmployedAtBusiness(src, {business = {id = bizId} , character = char})
    print(isEmployed)
    if not isEmployed then
        return false, "There are no available positions."
    end

    if (#BUSINESSES[pBiz].employees >= MAX_EMPLOYEES) then
        return false, "There are too many active employees."
    end

    BUSINESSES[pBiz].employees[src] = {name = char.first_name .. " " .. char.last_name, cid = char.id}
    return true, "Clocked in."
end)

STR.register("rd-mechanics:leaveJob", function(pSource, pBiz)
    local src = pSource
    for k, v in pairs(BUSINESSES) do
        if (v.employees[src]) then
            v.employees[src] = nil
        end
    end

    return true, "Clocked out."
end)

STR.register("rd-mechanics:getActiveEmployees", function(pSource, pBiz)
    return BUSINESSES[pBiz].employees
end)

STR.register("rd-mechanics:setWorkHours", function(pSource, pBiz, pOpen, pClose)
    local openHour = ("%s:00"):format(pOpen)
    local closeHour = ("%s:00"):format(pClose)
    BUSINESSES[pBiz].open = openHour
    BUSINESSES[pBiz].close = closeHour

    local query = "UPDATE _mechanics SET openHour = ?, closeHour = ? WHERE code = ?"
    local queryData = Await(SQL.execute(query, openHour, closeHour, pBiz))

    return true
end)

STR.register("rd-mechanics:getWorkHours", function(pSource, pBiz)
    local context = {
        { title = ('Opening Hour: %s'):format(BUSINESSES[pBiz].open), icon = 'business-time', action = nil, key = 'opening' },
        { title = ('Closing Hour: %s'):format(BUSINESSES[pBiz].close), icon = 'store-slash', action = nil, key = 'closing' },
      }

      return context
end)

STR.register("rd-mechanics:getSafeCash", function(pSource, pBiz)
    return getSafeCash(pBiz)
end)

STR.register("rd-mechanics:takeSafeCash", function(pSource, pBiz)
    local safeCash = getSafeCash(pBiz)
    local query = "UPDATE _mechanics SET safeCash = 0 WHERE name = ? LIMIT 1"
    local queryData = Await(SQL.execute(query, pBiz))

    if queryData[1].affectedRows >= 1 then
        user:addMoney(safeCash)
    end

    return
end)

STR.register("rd-mechanics:depositCash", function(pSource, pBiz, pItemInfo)
    local pAmount = pItemInfo.amount
    local query = "UPDATE _mechanics SET safeCash = safeCash + ? WHERE name = ? LIMIT 1"
    local queryData = Await(SQL.execute(query, pAmount, pBiz))

    if queryData[1].affectedRows >= 1 then
        TriggerEvent("inventory:removeItemByMetaKV", pSource, "envelope", 1, "amount", pAmount)
    end

    return
end)

STR.register("rd-mechanics:crackSafe", function(pSource, pBiz)
    local safeCash = getSafeCash(pBiz)
    local query = "UPDATE _mechanics SET safeCash = 0 WHERE name = ? LIMIT 1"
    local queryData = Await(SQL.execute(query, pBiz))

    if queryData[1].affectedRows >= 1 then
        user:addMoney(safeCash)
    end

    return
end)

STR.register("rd-mechanics:startPurchase", function(pSource, pData)
    local pRegisterId = pData.registerId
    local pCost = pData.cost
    local pComment = pData.comment
    ACTIVE_PURCHASES[pRegisterId] = {}
    ACTIVE_PURCHASES[pRegisterId].registerId = pRegisterId
    ACTIVE_PURCHASES[pRegisterId].cost = pCost
    ACTIVE_PURCHASES[pRegisterId].comment = pComment
    ACTIVE_PURCHASES[pRegisterId].charger = pSource

    Wait(100)

    TriggerClientEvent("rd-mechanics:activePurchase", -1, ACTIVE_PURCHASES[pRegisterId])
end)

STR.register("rd-mechanics:completePurchase", function(pSource, pData)
    local purchase = ACTIVE_PURCHASES[pData.registerId]
    purchase.biz = pData.biz
    if not purchase then return end
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cash = user:getCash()
    local success
    local shouldGiveReceipt = true
    

    if (pData.cash) then
        -- must transfer the money into business account not state account
        success = exports["rd-financials"]:DoCashTransaction(src, 1, "Services", price, "Bennys Motorworks", "purchase")
        if not success then
            TriggerClientEvent("DoLongHudText", pSource, "You don't have enough money.", 2)
            TriggerEvent("DoLongHudText", pData.charger, "The purchase at register ".. pData.registerId .." has been failed. (Not enough cash)", 2)
            return false
        end
    else
        -- success = bank accoutn transfer
        -- rd-financials money remove from account
        -- disabled (in client) for now
    end

    local query = "UPDATE _mechanics SET safeCash = safeCash + ? WHERE code = ?"
    local queryData = Await(SQL.execute(query, tonumber(purchase.cost), purchase.biz))

    if queryData.affectedRows >= 1 then
        TriggerEvent("DoLongHudText", pSource, "The purchase has been completed.", 1)
        if (RECEIVED_RECEIPTS[pData.charger] == nil) then
            RECEIVED_RECEIPTS[pData.charger] = {}
        end

        if (#RECEIVED_RECEIPTS[pData.charger] >= MAX_RECEIPTS_PER_HOUR) then
            print("max receipts reached for persn", pData.charger)
            shouldGiveReceipt = false
            TriggerClientEvent("DoLongHudText", pData.charger, ("You have reached the limit of %s receipts in 1 hour."):format(MAX_RECEIPTS_PER_HOUR), 2)
        end

        if (shouldGiveReceipt) then
            local receipt = {
                registerId = purchase.registerId,
                cost = purchase.cost,
                comment = purchase.comment,
                biz = purchase.biz,
                time = os.time()
            }
    
            table.insert(RECEIVED_RECEIPTS[pData.charger], receipt)
    
            -- this code adds the receipt
            TriggerClientEvent("player:receiveItem", pData.charger, "burgerReceipt", 1, true, {location = BUSINESSES[purchase.biz].name})
        end
    end

    TriggerClientEvent("rd-mechanics:closePurchase", -1, purchase.registerId)
    ACTIVE_PURCHASES[purchase.registerId] = nil

    return true
end)

STR.register("rd-mechanics:getTakeoutBox", function(pSource, pData)
    local genId = tostring(math.random(10000, 99999999))
    local invId = "takeout-" .. genId .. ""
    local metaData = {
        inventoryId = invId,
        bagName = pData.name,
        slots = pData.slots,
        weight = pData.weight,
        mechanic = pData.mechanic,
        _hideKeys = {'inventoryId', 'slots', 'weight', 'mechanic', 'bagName'},
      }
    TriggerClientEvent("player:receiveItem", pSource, pData.box_item_id, 1, true, metaData)
end)

function getSafeCash(pBiz)
    local query = "SELECT safeCash FROM _mechanics WHERE name = ?"
    local queryData = Await(SQL.execute(query, pBiz))

    return queryData[1].safeCash
end