function StartPhoneCall(callerId, targetId, callId)
    TriggerClientEvent("rd:voice:phone:call:start", callerId, targetId, callId)
    TriggerClientEvent("rd:voice:phone:call:start", targetId, callerId, callId)
end

function StopPhoneCall(callerId, targetId, callId)
    TriggerClientEvent("rd:voice:phone:call:end", callerId, targetId, callId)
    TriggerClientEvent("rd:voice:phone:call:end", targetId, callerId, callId)
end

function LoadPhoneModule()
    exports('StartPhoneCall', StartPhoneCall)
    exports('StopPhoneCall', StopPhoneCall)

    AddEventHandler("rd-inventory:droppedItem", function(pServerId, pItemName)
        Wait(2000)
        if pItemName == "mobilephone" then
            local phoneCount = exports["rd-inventory"]:getQuantity(pServerId, pItemName)
            if phoneCount < 0 then
                TriggerClientEvent('rd-inventory:itemCheck', playpServerIderId, pItemName, false, 0)
            end
        end
    end)

    AddEventHandler("rd:voice:phone:call:start", StartPhoneCall)
    AddEventHandler("rd:voice:phone:call:end", StopPhoneCall)

    TriggerEvent("rd:voice:phone:ready")

    Debug("[Phone] Module Loaded")
end
