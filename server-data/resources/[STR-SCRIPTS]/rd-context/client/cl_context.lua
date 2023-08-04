--[[

    Functions

]]

function showContext(data)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data,
    })
end


--[[

    Exports

]]

exports("showContext", showContext)

--[[

    Events

]]

RegisterNetEvent("rd-context:showContext")
AddEventHandler("rd-context:showContext", showContext)

RegisterNetEvent("rd-context:preLoadImages")
AddEventHandler("rd-context:preLoadImages", function(images)
    SendNUIMessage({
        action = "LOAD_IMAGES",
        data = images,
    })
end)

--[[

    NUI

]]

RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    TriggerEvent(data.action, data.params)
    cb("ok")
end)

RegisterNUICallback("cancel", function(data, cb)
    SetNuiFocus(false)
    cb("ok")
    Wait(800)
    TriggerEvent("attachedItems:block", false)
end)