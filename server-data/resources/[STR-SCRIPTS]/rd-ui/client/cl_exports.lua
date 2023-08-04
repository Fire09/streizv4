local Events = {}

function SendUIMessage(data)
  SendReactMessage('uiMessage', data)
end

exports('SendUIMessage', SendUIMessage)

function RegisterUIEvent(eventName)
    if not Events[eventName] then
        Events[eventName] = true

        RegisterNUICallback(eventName, function (...)
            TriggerEvent(('_stx_uiReq:%s'):format(eventName), ...)
        end)
    end
end

exports('RegisterUIEvent', RegisterUIEvent)

function SetUIFocusCustom(hasKeyboard, hasMouse)
  HasNuiFocus = hasKeyboard or hasMouse

  SetNuiFocus(hasKeyboard, hasMouse)
  SetNuiFocusKeepInput(HasNuiFocus)
end

exports('SetUIFocusCustom', SetUIFocusCustom)


function GetUIFocus()
  return HasFocus, HasCursor
end

exports('GetUIFocus', GetUIFocus)

Citizen.CreateThread(function()
    TriggerEvent('_stx_uiReady')
end)

function cashFlash(pCash, pChange)
  SendUIMessage({
      app = "cash",
      data = {
        cash = pCash,
        amountAdjustment = pChange
        -- duration = 5 // optional duration for fade, default 4 seconds
      },
      source = "rd-nui",
  })
end

exports("cashFlash", cashFlash)

function openApplication(app, data, stealFocus)
  stealFocus = stealFocus == nil and true or false
  SendUIMessage({
      source = "rd-nui",
      app = app,
      show = true,
      data = data or {},
  })
  if stealFocus then
    SetUIFocus(true, true)
  end
end

exports("openApplication", openApplication)

RegisterNetEvent("rd-ui:open-application")
AddEventHandler("rd-ui:open-application", openApplication)

function closeApplication(app, data)
  SendUIMessage({
      source = "rd-nui",
      app = app,
      show = false,
      close = true,
      data = data or {},
  })
  SetUIFocus(false, false)
  TriggerEvent("rd-ui:application-closed", app, { fromEscape = false })
end

exports("closeApplication", closeApplication)

function sendAppEvent(app, data, withExtra)
    local sentData = {
        app = app,
        data = data or {},
        source = "rd-nui",
    }
    if withExtra then
      for k, v in pairs(withExtra) do
        sentData[k] = v
      end
    end
    SendUIMessage(sentData)
end

exports("sendAppEvent", sendAppEvent)

local currSoundId = 0
local function getSoundId()
  currSoundId = currSoundId + 1
  return currSoundId
end
function soundPlay(name, volume, loop)
  local id = getSoundId()
  SendUIMessage({
      source = "rd-nui",
      app = "sounds",
      data = {
        action = 'play',
        id = id,
        name = name,
        loop = loop or false,
        volume = volume or 1.0,
      },
  })
  return id
end

RegisterNetEvent("rd-ui:soundPlay")
AddEventHandler("rd-ui:soundPlay", function(name, volume, loop)
  soundPlay(name, volume, loop)
end)

exports("soundPlay", soundPlay)

function soundVolume(id, volume)
  SendUIMessage({
      source = "rd-nui",
      app = "sounds",
      data = {
        action = "volume",
        id = id,
        volume = volume,
      },
  });
end

exports("soundVolume", soundVolume)

function soundStop(id)
  SendUIMessage({
      source = "rd-nui",
      app = "sounds",
      data = {
        action = 'stop',
        id = id,
      },
  })
end

exports("soundStop", soundStop)