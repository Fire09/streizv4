RegisterServerEvent("rd-base:sv:player_control_set")
AddEventHandler("rd-base:sv:player_control_set", function(controlsTable)
    local src = source
    STX.DB:UpdateControls(src, controlsTable, function(UpdateControls, err)
            if UpdateControls then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("rd-base:sv:player_controls")
AddEventHandler("rd-base:sv:player_controls", function()
    local src = source
    STX.DB:GetControls(src, function(loadedControls, err)
        if loadedControls ~= nil then 
            TriggerClientEvent("rd-base:cl:player_control", src, loadedControls) 
        else 
            TriggerClientEvent("rd-base:cl:player_control",src, nil)
        end
    end)
end)
