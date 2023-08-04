local EVENTS = {
    SWITCHER = 1,
    OUTFITS = 2,
}

local MenuData = {
    {
        title = "Outfits",
        description = "Gotta look fresh",
        action = "rd-business:sh_handler",
        key = { event = EVENTS.OUTFITS, switchCharacter = true }
    },
    {
        title = "Character switch",
        description = "Go bowling with your cousin",
        children = {
            { title = "Yes", action = "rd-business:sh_handler", key = { event = EVENTS.SWITCHER, switchCharacter = true } },
            { title = "No", action = "rd-business:sh_handler", key = { event = EVENTS.SWITCHER, switchCharacter = false } },
        }
    },
}

local listening = false
local function listenForKeypress(pEvent)
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) then
                listening = false
                exports["rd-ui"]:hideInteraction()
                exports["rd-ui"]:showContextMenu(MenuData)
            end
            Wait(0)
        end
    end)
end

AddEventHandler("rd-polyzone:enter", function(zone)
    if zone == "saco_log" or zone == "hades_log" or zone == "saco_beach_log" or zone == "little_moscow_log" then
        exports["rd-ui"]:showInteraction("[E] Wardrobe")
        listenForKeypress(zone)
    end
end)

AddEventHandler("rd-polyzone:exit", function(zone)
    if zone == "saco_log" or zone == "hades_log" or zone == "saco_beach_log" or zone == "little_moscow_log" then
        exports["rd-ui"]:hideInteraction()
        listening = false
    end
end)



RegisterUICallback("rd-business:sh_handler", function(data, cb)
    local eventData = data.key
    if eventData.event == EVENTS.SWITCHER and eventData.switchCharacter then
        TransitionToBlurred(500)
        DoScreenFadeOut(500)
        Wait(1000)
        TriggerEvent("rd-base:clearStates")
        exports["rd-base"]:getModule("SpawnManager"):Initialize()
        Wait(1000)
    elseif eventData.event == EVENTS.OUTFITS then
        TriggerEvent('rd-clothing:outfits', true)
    end
    cb({ data = {}, meta = { ok = true, message = "done" } })
end)