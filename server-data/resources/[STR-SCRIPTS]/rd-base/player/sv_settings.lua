RegisterServerEvent("rd-base:sv:player_settings_set")
AddEventHandler("rd-base:sv:player_settings_set", function(settingsTable)
    local src = source
    STX.DB:UpdateSettings(src, settingsTable, function(UpdateSettings, err)
            if UpdateSettings then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("rd-base:sv:player_settings")
AddEventHandler("rd-base:sv:player_settings", function()
    local src = source
    STX.DB:GetSettings(src, function(loadedSettings, err)
        if loadedSettings ~= nil then 
            TriggerClientEvent("rd-base:cl:player_settings", src, loadedSettings) 
        else 
            TriggerClientEvent("rd-base:cl:player_settings",src, nil) 
        end
    end)
end)
