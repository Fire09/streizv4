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




exports("hideContextMenu", function(options, position)
    SetNuiFocus(false, false)
    SetUIFocus(false, false)
end)