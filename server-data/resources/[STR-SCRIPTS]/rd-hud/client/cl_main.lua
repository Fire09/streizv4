
RegisterCommand("hud", function()
    SetNuiFocus(true, true)
    SendReactMessage('toggleSettings', {
        show = true
    })
end)

RegisterNUICallback('hideFrame', function()
    SetNuiFocus(false, false)
end)