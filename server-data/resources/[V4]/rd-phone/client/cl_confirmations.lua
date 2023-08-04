local PendingConfirmations = {}

RegisterNUICallback("rd-ui:genericNotificationResponse", function(data, cb)
    local response = data._data
    if not PendingConfirmations[response.confirmationId] then return end

    PendingConfirmations[response.confirmationId]:resolve(data.action == "accept")

    PendingConfirmations[response.confirmationId] = nil
end)

function DoPhoneConfirmation(pTimeOut, pTitle, pText, pIcon, pBgColor, pCallback)
    local serverid = GetPlayerServerId(PlayerId())
    local promise = promise:new()

    PendingConfirmations[#PendingConfirmations+1] = promise

    local id = #PendingConfirmations

    SendReactMessage('setNotify', {
        app = "phone",
        data = {
            action = "generic-confirmation",
            appName = "home-screen",
            title = pTitle,
            text = pText,
            icon = { name = pIcon or "home", color = "white" },
            bgColor = pBgColor or "rgba(39, 48, 53, 255)",
            onAccept = "rd-ui:genericNotificationResponse",
            onReject = "rd-ui:genericNotificationResponse",
            _data = { confirmationId =  id },
            timeOut = pTimeOut or 10
        },
        serverid = serverid
    })

    Citizen.SetTimeout(30000, function()
        promise:resolve(false)
    end)

    local result = Citizen.Await(promise)

    if (pCallback) then pCallback(result) end

    return result
end

exports('DoPhoneConfirmation', DoPhoneConfirmation)

function DoPhoneNotification(app, title, body, showIfActive)
  local serverid = GetPlayerServerId(PlayerId())
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = app,
      title = title,
      body = body,
      show_even_if_app_active = showIfActive
    }
  })
end

RegisterNetEvent('rd-phone:client:gasOffer')
AddEventHandler('rd-phone:client:gasOffer', function(data, cb)
print("halve")
TriggerEvent("showPaymentNotify2")
end)

exports('DoPhoneNotification', DoPhoneNotification)