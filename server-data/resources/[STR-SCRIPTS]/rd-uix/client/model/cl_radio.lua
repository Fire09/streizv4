RegisterNUICallback("rd-uix:hudUpdateRadioSettings", function(data, cb)
    exports["rd-base"]:getModule("SettingsData"):setSettingsTableGlobal({ ["tokovoip"] = data.settings }, true)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
end)

RegisterNUICallback("rd-uix:hudUpdateKeybindSettings", function(data, cb)
    exports["rd-base"]:getModule("DataControls"):encodeSetBindTable(data.controls)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
end)