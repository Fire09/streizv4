local currOrder = {}
local striezFix = {}

AddEventHandler("rd-jobs:bennys:order", function(pVehicle, pChanges)
    local model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(pVehicle)))
    local orderId = math.random(10000000)

    if model == "NULL" then
        model = GetDisplayNameFromVehicleModel(GetEntityModel(pVehicle))
    end

    currOrder = {
        order = orderId,
        vehicle = model,
        list = pChanges,
        _hideKeys = {"list"},
    }
   -- striezFix = pChanges
    TriggerEvent("player:receiveItem", "bennysorder", 1, false, currOrder)
end)

AddEventHandler("rd-inventory:itemUsed", function(item, metaData)
    local meta = json.decode(metaData)
    if item == "bennysorder" then
        local VehicleClass = exports["rd-vehicles"]:GetVehicleRatingClass(meta.vehicle)
        local orderData = STR.execute('rd-bennys:getOrderData', meta.list, VehicleClass, meta.order, meta.vehicle)
        striezFix = json.decode(metaData)
        exports["rd-ui"]:showContextMenu(orderData)
        return
    end
end)

RegisterUICallback("rd-mechanics:order:view:normal", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleColours(plyVeh, json.decode(striezFix.list.colors[1]), 0)
end)

RegisterUICallback("rd-mechanics:order:view:plateIndex", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleNumberPlateTextIndex(plyVeh, json.decode(striezFix.list.plateIndex))
end)

RegisterUICallback("rd-mechanics:order:view:dashColour", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleDashboardColour(plyVeh, json.decode(striezFix.list.dashColour))
end)

RegisterUICallback("rd-mechanics:order:view:interColour", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleInteriorColour(plyVeh, json.decode(striezFix.list.interColour))
end)

RegisterUICallback("rd-mechanics:order:view:secondary", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleColours(plyVeh, json.decode(striezFix.list.colors[1]), json.decode(striezFix.list.colors[2]))
    SetVehicleColours(plyVeh, json.decode(striezFix.list.extracolors[1]), json.decode(striezFix.list.extracolors[2]))
end)

RegisterUICallback("rd-mechanics:order:view:pearlescent", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    -- print("RAGZI",json.encode(striezFix.list))
    SetVehicleColours(plyVeh, json.decode(striezFix.list.colors[1]), json.decode(striezFix.list.colors[2]))
    SetVehicleExtraColours(plyVeh, json.decode(striezFix.list.extracolors[1]), json.decode(striezFix.list.extracolors[2]))
end)

RegisterUICallback("rd-mechanics:order:view", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    print("RAGZI",json.encode(striezFix.list))
    SetVehicleColours(plyVeh, json.decode(striezFix.list.colors[1]), json.decode(striezFix.list.colors[2]))
    SetVehicleExtraColours(plyVeh, json.decode(striezFix.list.colors[1]), json.decode(striezFix.list.colors[2]))
end)

function ApplyMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if categoryID == 18 then
        ToggleVehicleMod(plyVeh, categoryID, modID)
        originalTurboState = modID
    elseif categoryID == 11 or categoryID == 12 or categoryID== 13 or categoryID == 15 or categoryID == 16 then --Performance Upgrades
        originalCategory = categoryID
        originalMod = modID

        SetVehicleMod(plyVeh, categoryID, modID)
    else
        originalCategory = categoryID
        originalMod = modID

        SetVehicleMod(plyVeh, categoryID, modID)
    end
end

AddEventHandler("rd-selector:selectionChanged", function(data)
    return exports["rd-selector"]:getCurrentSelection(data.selectedEntity)
end)