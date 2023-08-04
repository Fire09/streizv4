SIGNED_IN = false
CURRENT_mechanic = nil
SERVER_CODE = 'wl'

local activePurchases = {}

local debugMode = GetConvar('sv_environment', 'prod') == 'debug'

function isSignedOn()
    return SIGNED_IN or CURRENT_mechanic == 'prison_cooks'
end

function signOff()
    SIGNED_IN = false
    TriggerEvent("DoLongHudText", "Clocked out.")
end

AddEventHandler('rd-mechanics:signOnPrompt', function(pParameters, pEntity, pContext)
    local biz = pContext.zones['mechanic_sign_on'].biz
    local type = pContext.zones['mechanic_sign_on'].type
    SIGNED_IN, message = STR.execute("rd-mechanics:joinJob", biz, type)
    TriggerEvent("DoLongHudText", message)
end)

AddEventHandler('rd-mechanics:signOffPrompt', function(pParameters, pEntity, pContext)
    local biz = pContext.zones['mechanic_sign_on'].biz
    STR.execute("rd-mechanics:leaveJob", biz)
    signOff()
end)

RegisterNetEvent('rd-mechanics:forceLeaveJob', function()
    signOff()
end)

AddEventHandler('rd-mechanics:viewActiveEmployees', function(pParameters, pEntity, pContext)
    local biz = pContext.zones['mechanic_sign_on'].biz
    local employees = STR.execute('rd-mechanics:getActiveEmployees', biz)

    local mappedEmployees = {}
    
    if employees == nil then
        table.insert(mappedEmployees, {
            title = "Nobody is clocked in currently",
            description = "",
        })
        exports['rd-ui']:showContextMenu(mappedEmployees)
        return 
    end

    for _, employee in pairs(employees) do
        local fancyLocationName = GetBusinessConfig(biz).name
        table.insert(mappedEmployees, {
            title = string.format("%s (%s)", employee.name, employee.cid),
            description = string.format("Clocked in at %s", fancyLocationName),
        })
    end
    if #mappedEmployees == 0 then
        table.insert(mappedEmployees, {
            title = "Nobody is clocked in currently",
        })
    end

    exports['rd-ui']:showContextMenu(mappedEmployees)
end)

AddEventHandler('rd-mechanics:makePayment', function(pParameters, pEntity, pContext)
    local id, biz
    local isNotmechanic = false

    if pParameters and pParameters.isEditorPeek then
        id = exports["rd-housing"]:getOwnerOfCurrentProperty()
        biz = exports["rd-housing"]:getCurrentPropertyID()
        isNotmechanic = true
    else
        id = pContext.zones['mechanic_registers'].id
        biz = pContext.zones['mechanic_registers'].biz
    end

    if id == nil or biz == nil then return end

    local activeRegisterId = id
    local activeRegister = activePurchases[activeRegisterId]
    if not activeRegister or activeRegister == nil then
        TriggerEvent("DoLongHudText", "No purchase active.")
        return
    end
    local priceWithTax = STR.execute("PriceWithTaxString", activeRegister.cost, "Goods")

    local acceptContext = {
        {
            title = "mechanic Purchase",
            description = "$" .. priceWithTax.total .. " | " .. activeRegister.comment,
        },
        {
            title = "Purchase with Bank",
            action = "rd-mechanics:finishPurchasePrompt",
            icon = 'credit-card',
            key = {cost = priceWithTax.total, comment = activeRegister.comment, registerId = id, charger = activeRegister.charger, biz = biz, cash = false},
        },
        {
            title = "Purchase with Cash",
            action = "rd-mechanics:finishPurchasePrompt",
            icon = 'money-bill',
            key = {cost = priceWithTax.total, comment = activeRegister.comment, registerId = id, charger = activeRegister.charger, biz = biz, cash = true},
        }
    }
    exports['rd-ui']:showContextMenu(acceptContext)
end)

RegisterUICallback('rd-mechanics:finishPurchasePrompt', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local success = STR.execute("rd-mechanics:completePurchase", data.key)
    if not success then
        TriggerEvent("DoLongHudText", "The purchase could not be completed.")
    end
end)

AddEventHandler('rd-mechanics:chargeCustomer', function(pParameters, pEntity, pContext)
    local id, biz

    if pParameters.isEditorPeek then
        id = exports["rd-housing"]:getOwnerOfCurrentProperty()
        biz = exports["rd-housing"]:getCurrentPropertyID()
    else
        id = pContext.zones['mechanic_registers'].id
        biz = pContext.zones['mechanic_registers'].biz
    end

    if id == nil or biz == nil then return end

    local elements = {
     {
            icon = "dollar-sign",
            label = "Cost",
            name = "cost",
        },
        {
            icon = "pencil-alt",
            label = "Comment",
            name = "comment",
        },
    }

    local prompt = exports['rd-ui']:OpenInputMenu(elements)

    if not prompt then return end

    local cost = tonumber(prompt.cost)
    local comment = prompt.comment
    --check if cost is actually a number
    if cost == nil or not cost then return end
    if comment == nil then comment = "" end

    if cost < 5 then cost = 5 end --Minimum $10

    --Send event to everyone indicating a purchase is ready at specified register
    STR.execute("rd-mechanics:startPurchase", {cost = cost, comment = comment, registerId = id})
end)

RegisterNetEvent('rd-mechanics:activePurchase', function(data)
    activePurchases[data.registerId] = data
end)

RegisterNetEvent('rd-mechanics:closePurchase', function(data)
    activePurchases[data.registerId] = nil
end)

AddEventHandler('rd-polyzone:enter', function(pZone, pData)
    if pZone == 'mechanic_buff_zone' then
        CURRENT_mechanic = pData.id
        TriggerEvent("rd-buffs:inDoubleBuffZone", true, pData.id)
        checkForHeadset()
    end

    if pZone == 'mechanic_bs_drivethru' then
        enterDriveThru()
    end
end)

AddEventHandler('rd-polyzone:exit', function(pZone, pData)
    if pZone == 'mechanic_buff_zone' then
        if SIGNED_IN then
            SIGNED_IN = false
            STR.execute("rd-mechanics:leaveJob", CURRENT_mechanic)
            TriggerEvent("DoLongHudText", "You went too far away! Clocked out.")
        end
        CURRENT_mechanic = nil
        TriggerEvent("rd-buffs:inDoubleBuffZone", false)
        turnOffHeadset()
    end

    if pZone == 'mechanic_bs_drivethru' then
        exitDriveThru()
    end
end)

AddEventHandler("rd-mechanics:silentAlarm", function()
    local finished = exports["rd-taskbar"]:taskBar(4000, "Pressing Alarm")
    if finished ~= 100 then return end
   -- TriggerServerEvent("rd-mechanics:triggerSilentAlarm", GetEntityCoords(PlayerPedId()))
    TriggerEvent("rd-dispatch:mechanics", GetEntityCoords(PlayerPedId()))
end)
