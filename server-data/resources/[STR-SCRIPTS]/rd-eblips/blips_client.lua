local blips_cache = { }
local server_has_heartbeat = false
local blip_types = config.blip_types

-- Clear out all of the users blips if they do not hear from the server for 5 seconds, checked every 15 seconds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15 * 1000)
        server_has_heartbeat = false
        SetTimeout(5 * 1000, function()
            if not server_has_heartbeat then
                for check_follow_id_key, data in pairs(blips_cache) do
                    if not blips_cache[check_follow_id_key].has_server_validated then
                        -- Remove the blip
                        RemoveBlip(data.blip_id)
                        RemoveBlip(data.synced_blip_id)
                        blips_cache[check_follow_id_key] = nil
                    end
                end
            end
        end)
    end
end)

local passes = 0

RegisterNetEvent('rd-eblips:client:syncMyBlips')
AddEventHandler('rd-eblips:client:syncMyBlips', function(blips)
    local me_ped = PlayerPedId()
    server_has_heartbeat = true
    for _, properties in ipairs(blips) do
        local follow_on_source = properties[5]
        local follow_id_key = properties[4] .. '_' .. properties[5]

        if not blips_cache[follow_id_key] then
            blips_cache[follow_id_key] = { properties = { } }
        end

        -- Check if local or not
        blips_cache[follow_id_key].needs_server = true

        local is_networked = NetworkIsPlayerActive(GetPlayerFromServerId(follow_on_source))
        -- Enable for solo testing
        --passes = passes + 1
        --if passes > 10 then print('doing force false on networked') is_networked = false end
        if is_networked then
            local me_player = GetPlayerServerId(PlayerId())
            if config.hide_own_blip and follow_on_source == me_player then
                blips_cache[follow_id_key].ignored = true
            end
            blips_cache[follow_id_key].needs_server = false
            blips_cache[follow_id_key].player_ped = GetPlayerPed(GetPlayerFromServerId(follow_on_source))
        else
            --print('Source ' .. follow_on_source .. ' is not networked')
        end

        if not blips_cache[follow_id_key].ignored then -- Used to hide own blip
            if blips_cache[follow_id_key].is_created and not blips_cache[follow_id_key].needs_removal then
                -- Update
                local blip_id = blips_cache[follow_id_key].blip_id
                blips_cache[follow_id_key].properties = properties
                blips_cache[follow_id_key].has_server_validated = true
                doUpdateBlip(follow_id_key, blip_id, properties)
            else
                -- Create
                local blip_id = doAddBlip(properties)
                blips_cache[follow_id_key].is_created = true
                blips_cache[follow_id_key].blip_id = blip_id
                blips_cache[follow_id_key].properties = properties
                blips_cache[follow_id_key].has_server_validated = true
            end
        end
    end

    -- Require server validation, or delete it. If the blip no longer exists on server
    -- this loop will delete it
    for _, __ in pairs(blips_cache) do
        -- print('checking if should remove', check_follow_id_key, server_blips[check_follow_id_key].has_server_validated)
        if not blips_cache[_].has_server_validated then
            doDebug('Blip has failed validation, removing from map')

            -- Remove the blip
            if blips_cache[_].synced_blip_id then
                doDebug('Removing networked blip that failed validation')
                RemoveBlip(blips_cache[_].synced_blip_id)
                blips_cache[_].synced_blip_id = false
            end

            if blips_cache[_].blip_id then
                doDebug('Removing server blip that failed validation')
                RemoveBlip(blips_cache[_].blip_id)
                blips_cache[_].blip_id = false
            end

            blips_cache[_] = nil
        end

        if blips_cache[_] then
            blips_cache[_].has_server_validated = false
        end
    end
end)

function doUpdateBlip(follow_id_key, blip_id, properties)
    doDebug('Doing update work on existing blip')
    -- Set the blip using coords given by the server
    if blips_cache[follow_id_key].needs_server then -- Requires coords from the server to show blip
        --print('(doUpdateBlip) blip needs server to work')
        -- Hot switch the blip to server side version
        if not blips_cache[follow_id_key].blip_id then
            RemoveBlip(blips_cache[follow_id_key].synced_blip_id)
            doDebug('Hotswitching removing networked blip and creating server based blip')
            local new_blip_id = doAddBlip(properties)
            blips_cache[follow_id_key].synced_blip_id = nil
            blips_cache[follow_id_key].blip_id = new_blip_id
        end

        if blips_cache[follow_id_key].blip_id then
            if DoesBlipExist(blips_cache[follow_id_key].blip_id) then -- Sanity check
                SetBlipCoords(blip_id, properties[1] + 0.001,properties[2] + 0.001,properties[3] + 0.001)
            end
        end
    end
end

function doAddBlip(properties)
    local blip_id = AddBlipForCoord(properties[1] + 0.001,properties[2] + 0.001,properties[3] + 0.001)
    doDebug('Creating new blip for the first time', blip_id)
    setBlipProperties(blip_id, properties)
    return blip_id
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for follow_id_key, data in pairs(blips_cache) do
            -- If the client can communicate with the other client in question, lets do this instead
            --print('does need server?', blips_cache[follow_id_key].needs_server)
            if not blips_cache[follow_id_key].needs_server and not blips_cache[follow_id_key].needs_removal then

                if not blips_cache[follow_id_key].synced_blip_id then
                    doDebug('Hotswitching blip to local networked blip')
                    --print('setting blip ID with local client')
                    -- Remove server synced blip and use local sync
                    if blips_cache[follow_id_key].blip_id then
                        RemoveBlip(blips_cache[follow_id_key].blip_id)
                        blips_cache[follow_id_key].blip_id = nil
                    end

                    if DoesEntityExist(blips_cache[follow_id_key].player_ped) then
                        doDebug('Hotswitching check finished, creating new entity based blip')
                        local new_blip_id = AddBlipForEntity(blips_cache[follow_id_key].player_ped)
                        blips_cache[follow_id_key].synced_blip_id = new_blip_id
                    else
                        print('ERROR - Could not find networked player ped')
                    end
                end

                if GetBlipFromEntity(data.player_ped) then
                    doDebug('Networked blip is synced')
                    -- print('blip is synced')
                    local blip_id = blips_cache[follow_id_key].synced_blip_id

                    local veh = GetVehiclePedIsIn(data.player_ped, false)

                    if veh ~= 0 then
                        SetBlipRotation(blip_id, math.ceil(GetEntityHeading(veh)))
                    end

                    setBlipProperties(blips_cache[follow_id_key].synced_blip_id, data.properties)
                end
            end
        end
    end
end)

function setBlipProperties(blip_id, properties)
    doDebug('Setting blip properties')
    local current_type = GetBlipSprite(blip_id)
    local current_color = GetBlipColour(blip_id)
    local template_type = properties[4]

    local type = config.default_type._type
    local color = config.default_type._color
    local scale = config.default_type._scale
    local alpha = config.default_type._alpha
    local show_local_indicator = config.default_type._show_local_direction
    local show_off_screen = config.default_type._show_off_screen

    if blip_types[template_type]._type then type = blip_types[template_type]._type end
    if blip_types[template_type]._color then color = blip_types[template_type]._color end
    if blip_types[template_type]._scale then scale = blip_types[template_type]._scale end
    if blip_types[template_type]._alpha then alpha = blip_types[template_type]._alpha end
    if blip_types[template_type]._show_local_direction then show_local_indicator = blip_types[template_type]._show_local_direction end
    if blip_types[template_type]._show_off_screen then show_off_screen = blip_types[template_type]._show_off_screen end

    if current_type ~= type or current_color ~= color then
        SetBlipSprite(blip_id, type)
        SetBlipColour(blip_id, color)
        SetBlipScale(blip_id, scale)
        SetBlipAlpha(blip_id, alpha)
        SetBlipAsShortRange(blip_id, 1)
        ShowHeadingIndicatorOnBlip(blip_id, true)
        SetBlipRotation(blip_id, math.ceil(GetEntityHeading(ped)))

        if show_local_indicator then
            ShowHeadingIndicatorOnBlip(blip_id, true)
        end

        if properties[6] then
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(properties[6])
            EndTextCommandSetBlipName(blip_id)
        else
            SetBlipHiddenOnLegend(blip_id)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Something')
            EndTextCommandSetBlipName(blip_id)
        end
    end
end

function doDebug(...)
    if config.debug then
        print(...)
    end
end