local activeRegisters = {
    {
        polytarget = {
            vector3(-1196.33, -890.75, 13.98), 0.8, 1.0, {
                heading=35,
                minZ=13.78,
                maxZ=14.78,
            }
        },
        business="burger_shot",
    },
    {
        polytarget = {
            vector3(-1195.26, -892.33, 13.98), 0.6, 1.0, {
                heading=35,
                minZ=13.78,
                maxZ=14.78,
            }
        },
        business="burger_shot",
    },
    {
        polytarget = {
            vector3(-1194.28, -893.9, 13.98), 0.6, 1.0, {
                heading=35,
                minZ=13.78,
                maxZ=14.78,
            }
        },
        business="burger_shot",
    },
    {
        polytarget = {
            vector3(811.16, -750.75, 26.78), 0.7, 1.1, {
                heading=0,
                minZ=23.18,
                maxZ=27.18
            }
        },
        business="maldinis",
    },
    {
        polytarget = {
            vector3(811.15, -752.06, 26.78), 0.7, 1.1, {
                heading=0,
                minZ=23.18,
                maxZ=27.18
            }
        },
        business="maldinis",
    },
    {
        polytarget = {
            vector3(188.18, -243.59, 54.07), 0.5, 0.5, {
                heading=340,
                minZ=50.47,
                maxZ=54.47
            }
        },
        business="cosmic_cannabis",
    },
    {
        polytarget = {
            vector3(188.96, -241.13, 54.07), 0.5, 0.5, {
                heading=340,
                minZ=50.47,
                maxZ=54.47
            }
        },
        business="cosmic_cannabis",
    },
    {
        polytarget = {
            vector3(-171.18, 295.02, 93.76), 0.5, 0.9, {
                heading=0,
                minZ=90.16,
                maxZ=94.16
            }
        },
        business="warriors_table",
    },
    {
        polytarget = {
            vector3(295.88, -923.48, 52.82), 0.8, 0.8, {
                heading=340,
                minZ=49.42,
                maxZ=53.42
            }
        },
        business="skybar",
    },
    {
        polytarget = {
            vector3(296.46, -936.08, 52.81), 0.6, 0.8, {
                heading=5,
                minZ=49.41,
                maxZ=53.41
            }
        },
        business="skybar",
    },
    {
        polytarget = {
            vector3(-931.71, -1180.14, 5.0), 0.8, 0.4, {
                heading=32,
                minZ=1.2,
                maxZ=5.2
            }
        },
        business="cookies",
    },
    {
        polytarget = {
            vector3(-584.08, -1058.72, 22.34), 0.6, 1.2, {
                heading=0,
                minZ=22.34,
                maxZ=22.74,
            }
        },
        business="uwu_cafe",
    },
    {
        polytarget = {
            vector3(-584.02, -1061.48, 22.34), 0.6, 1.0, {
                heading=0,
                minZ=22.34,
                maxZ=22.74,
            }
        },
        business="uwu_cafe",
    },
}

local activePurchases = {}

Citizen.CreateThread(function()
for id,register in ipairs(activeRegisters) do
        local ptId = "np_business_register_" .. id
        exports["rd-polytarget"]:AddBoxZone(ptId, register.polytarget[1], register.polytarget[2], register.polytarget[3], register.polytarget[4])
        exports['rd-interact']:AddPeekEntryByPolyTarget(ptId, {{
            event = "rd-business:registerPurchasePrompt",
            id = ptId .. "_purchase",
            icon = "cash-register",
            label = "make payment",
            parameters = {registerId = id, business = register.business}
        }}, { distance = { radius = 2.0 } })
        exports['rd-interact']:AddPeekEntryByPolyTarget(ptId, {{
            event = "rd-business:registerChargePrompt",
            id = ptId .. "_charge",
            icon = "credit-card",
            label = "Charge Customer",
            parameters = {registerId = id, business = register.business}
        }}, { distance = { radius = 2.0 }, isEnabled = function(pEntity, pContext) return IsEmployedAt(register.business) end})
    end 
end)

AddEventHandler('rd-business:registerPurchasePrompt', function(pParameters, pEntity, pContext)
    local activeRegisterId = pParameters.registerId
    local activeRegister = activePurchases[activeRegisterId]
    if not activeRegister or activeRegister == nil then
        TriggerEvent("DoLongHudText", "No purchase active.")
        return
    end
    local priceWithTax = RPC.execute("PriceWithTaxString", activeRegister.cost, "Goods")
    local acceptContext = {
        {
            title = "Restaurant Purchase",
            description = "$" .. priceWithTax.text .. " | " .. activeRegister.comment,
        },
        {
            title = "Purchase with Bank",
            action = "rd-business:finishPurchasePrompt",
            icon = 'credit-card',
            key = {cost = priceWithTax.cost, comment = activeRegister.comment, registerId = pParameters.registerId, charger = activeRegister.charger, business = pParameters.business, tax = priceWithTax.tax, cash = false},
        },
        {
            title = "Purchase with Cash",
            action = "rd-business:finishPurchasePrompt",
            icon = 'money-bill',
            key = {cost = priceWithTax.cost, comment = activeRegister.comment, registerId = pParameters.registerId, charger = activeRegister.charger, business = pParameters.business, tax = priceWithTax.tax, cash = true},
        }
    }
    exports['rd-ui']:showContextMenu(acceptContext)
end)

AddEventHandler('rd-business:registerChargePrompt', function(pParameters, pEntity, pContext)
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-ui:business:charge',
        key = {registerId = pParameters.registerId, business = pParameters.business},
        items = {
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
        },
        show = true,
    })
end)

--Add to purchases at registerId pos
RegisterNetEvent('rd-business:activePurchase')
AddEventHandler("rd-business:activePurchase", function(data)
    activePurchases[data.registerId] = data
end)

--Remove at registerId pos
RegisterNetEvent('rd-business:closePurchase')
AddEventHandler("rd-business:closePurchase", function(data)
    activePurchases[data.registerId] = nil
end)

RegisterUICallback('rd-business:finishPurchasePrompt', function (data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local success, message = RPC.execute("rd-business:completePurchase", data.key)
    if not success then
        TriggerEvent("DoLongHudText", message, 2)
    end
end)

RegisterUICallback("rd-ui:business:charge", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    exports['rd-ui']:closeApplication('textbox')
    local cost = tonumber(data.values.cost)
    local comment = data.values.comment
    if cost == nil or not cost then return end
    if comment == nil then comment = "" end

    if cost < 1 then cost = 1 end --Minimum $1

    --Send event to everyone indicating a purchase is ready at specified register
    RPC.execute("rd-business:startPurchase", {cost = cost, comment = comment, registerId = data.key.registerId, business = data.key.business})
end)