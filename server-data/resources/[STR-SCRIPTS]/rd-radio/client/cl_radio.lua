--[[

    Variables

]]

local isRadioOpen = false
local pRadioChannel = false

function pChannelActive()
  --print("pChannelActive")
  return pRadioChannel
end

exports('pChannel', function()
  --print("pChannel")
  return pChannelActive()
end)
--[[

    Functions

]]

function toggleRadioAnimation(pState)
    local isInTrunk = exports["isPed"]:isPed("intrunk")
    local isDead = exports["isPed"]:isPed("dead")
  
    if isInTrunk then return end
    if isDead then return end
  
    LoadAnimationDic("cellphone@")
  
    if pState then
      TriggerEvent("attachItemRadio","radio01")
      TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
    else
      StopAnimTask(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 1.0)
      TriggerEvent("destroyPropRadio")
    end
  end

  function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

function hasRadio()
    return exports["rd-inventory"]:hasEnoughOfItem("radio", 1, false, true) or exports["rd-inventory"]:hasEnoughOfItem("civradio", 1, false, true)
end

local function formattedChannelNumber(number)
    local power = 10 ^ 1
    return math.floor(number * power) / power
end

function handleConnectionEvent(pChannel)
    local newChannel = formattedChannelNumber(pChannel)

    if type(newChannel) ~= 'number' then return end

    local result = exports['rd-voice']:SetRadioFrequency(newChannel)
    pRadioChannel = true
    return result
end

function openRadio()
    local currentJob = exports["isPed"]:isPed("myjob")

    if exports["isPed"]:isPed("incall") then
        TriggerEvent("DoShortHudText","You can not do that while in a call!",2)
            return
        end

    if not hasRadio() then
        TriggerEvent("DoShortHudText", "Você precisa de um rádio.", 2)
        toggleRadioAnimation(false)
        return
    end

    if not isRadioOpen then
        SetNuiFocus(true, true)
        SendNUIMessage({
            open = true,
            emergency = (currentJob == "police" or currentJob == "ems" or currentJob == "doc")
        })

        toggleRadioAnimation(true)
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            close = true,
            emergency = (currentJob == "police" or currentJob == "ems" or currentJob == "doc")
        })

        toggleRadioAnimation(false)
    end

    isRadioOpen = not isRadioOpen
end

--[[

    Events

]]

RegisterNetEvent("rd-radio:setChannel", function(params)
    handleConnectionEvent(params[1])
    pRadioChannel = true
    SendNUIMessage({
        setChannel = params[1],
    })
end)

RegisterNetEvent("ChannelSet", function(chan)
    pRadioChannel = true
    SendNUIMessage({
        setChannel = chan,
    })
end)

RegisterNetEvent("rd-radio:updateRadioState", function (frequency, powered)
    SendNUIMessage({
        setChannel = frequency,
        setState = powered,
    })
end)

AddEventHandler("rd-inventory:itemUsed", function(item)
    if item ~= "radio" and item ~= "civradio" then return end

    openRadio()
end)

RegisterNetEvent('rd-inventory:itemCheck')
AddEventHandler('rd-inventory:itemCheck', function (item, state, quantity)
    if item ~= "civradio" and item ~= "radio" then return end
    if state or quantity > 0 then return end
    exports["rd-voice"]:SetRadioPowerState(false)
    exports["rd-hud"]:sendAppEvent("radio", { value = 0, state = false })
    TriggerEvent("DoLongHudText", "You have been disconnected from the radio.")
end)

--[[

    NUI

]]

RegisterNUICallback("poweredOn", function(data, cb)
    pRadioChannel = true
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["rd-voice"]:SetRadioPowerState(true)
end)

RegisterNUICallback("poweredOff", function(data, cb)
    pRadioChannel = false
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["rd-voice"]:SetRadioPowerState(false)
end)

RegisterNUICallback("setRadioChannel", function(data, cb)
    TriggerEvent("InteractSound_CL:PlayOnOne", "radioclick", 0.6)
    local success = handleConnectionEvent(data.channel)
    cb(success)
end)

RegisterNUICallback("volumeUp", function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["rd-voice"]:IncreaseRadioVolume()
end)

RegisterNUICallback("volumeDown", function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["rd-voice"]:DecreaseRadioVolume()
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        close = true,
    })

    isRadioOpen = false

    toggleRadioAnimation(false)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["rd-keybinds"]:registerKeyMapping("", "Radio", "Open", "+handheld", "-handheld", ";")
    RegisterCommand("+handheld", openRadio, false)
    RegisterCommand("-handheld", function() end, false)
end)