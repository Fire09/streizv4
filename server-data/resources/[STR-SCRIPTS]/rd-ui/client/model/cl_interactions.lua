local lastMessage = ""
exports("showInteraction", function(message, type)
    if not type then type = "info" end
    lastMessage = message
    SendUIMessage({
        source = "rd-nui",
        app = "interactions",
        data = {
            message = message,
            show = true,
            type = type,
        }
    })
end)

exports("hideInteraction", function(type)
    type = type and type or "info"
    SendUIMessage({
        source = "rd-nui",
        app = "interactions",
        data = {
            message = lastMessage,
            show = false,
            type = type,
        }
    })
end)

exports("showContextMenu", function(options, position)
    SendUIMessage({
        source = "rd-nui",
        app = "contextmenu",
        show = true,
        data = {
            position = position or "right",
            options = options
        }
    })
    SetUIFocus(true, true)
end)

RegisterNUICallback('rd-ui:context:update', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })
    TriggerEvent('rd-ui:context:update', data)
end)

exports("hideContextMenu", function()
    SendUIMessage({
        source = "rd-nui",
        app = "contextmenu",
        show = false,
        data = {
            position = "right",
            options = nil
        }
    })
    SetUIFocus(false, false)
end)