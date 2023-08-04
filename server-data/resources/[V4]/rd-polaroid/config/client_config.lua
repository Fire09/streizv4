
local ESX, QBCore = nil, nil

Citizen.CreateThread(function()

    function GetDiscordWebhook()
        local result = lib.callback.await('ps-polaroid:server:getWebhook', false)
        return result
    end

    if Config.Framework == 'esx' then

        ESX = exports['es_extended']:getSharedObject()

        RegisterNUICallback('ps-polaroid:ui:haveitem', function(data, cb)
            ESX.TriggerServerCallback('ps-polaroid:ui:haveitem', function(HaveItemCB)
                cb({haveitem = HaveItemCB})
            end, 'paperpolaroid')
        end)

    elseif Config.Framework == 'qbcore' then

        QBCore = exports['qb-core']:GetCoreObject()

        RegisterNUICallback('ps-polaroid:ui:haveitem', function(data, cb)
            local hasItem = QBCore.Functions.HasItem('paperpolaroid')
            cb({haveitem = hasItem})
        end)

    end
end)