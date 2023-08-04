Citizen.CreateThread(function()

    exports["rd-interact"]:AddPeekEntryByModel({ `np_sprays_cg`, `np_sprays_ballas`, `np_sprays_kingz`, `np_sprays_mandem`, `np_sprays_vagos`, `np_sprays_bbmc`, `np_sprays_bsk`, `np_sprays_hoa`, `np_sprays_nbc`, `np_sprays_seaside`, `np_sprays_angels`, `np_sprays_hydra`, `np_sprays_guild`, `np_sprays_ron`, `np_sprays_michael`, `np_sprays_dicegod`, `np_sprays_gg`, `np_sprays_scu`, `np_sprays_mayhem`, `np_sprays_bcf`, `np_sprays_rust`, `np_sprays_pitchers`, `np_sprays_marabunta`, `np_sprays_yokai`, `np_sprays_ratboy`, `np_sprays_pride`, `np_sprays_rm`, `np_sprays_hidden`, `np_sprays_saints`, `np_sprays_public_bowlcutgang`, `np_sprays_public_dirtybois`, `np_sprays_public_eastsidekingz`, `np_sprays_public_innercircle`, `np_sprays_public_lafamilia`, `np_sprays_public_northsidelegion`, `np_sprays_public_royalblack`, `np_sprays_public_saints`, `np_sprays_public_sinistersoulsmc`, `np_sprays_public_skullgang`, `np_sprays_public_spanonis`, `np_sprays_public_thecontientalfamily`, `np_sprays_public_thelegion`, `np_sprays_public_theroadmen`, }, {{
        event = "rd-graffiti:scrubSprays",
        id = "scrub_graffiti_riddlev",
        icon = "soap",
        label = "Scrub",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
          return exports['rd-objects']:GetObjectByEntity(pEntity) ~= nil
        end,
    })

end)

AddEventHandler("rd-graffiti:scrubSprays", function(args, entity, context)
    local spray = exports['rd-objects']:GetObjectByEntity(entity)
    local itemCheck = exports["rd-inventory"]:hasEnoughOfItem("srubbingcloth", 1)
    local pPlayerPed = PlayerPedId()
    if itemCheck then
        FreezeEntityPosition(pPlayerPed, true);
        TaskStartScenarioInPlace(pPlayerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
        local finished = exports['rd-taskbar']:taskBar(40000, 'Cleaning...')
        if finished == 100 then
            ClearPedTasksImmediately(pPlayerPed)
            ClearPedSecondaryTask(pPlayerPed)
            FreezeEntityPosition(pPlayerPed, false)
    if spray then
        local success = exports['rd-objects']:DeleteObject(spray.id)
        if success then
        end
    else
        TriggerEvent("DoLongHudText", "You need scrubbing cloth.", 2)
    end
    end
end
end)

function DeleteBlipGraffiti()
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
end
    
function CreateBlipGraffiti()
DeleteBlipGraffiti()
local coords = GetEntityCoords(PlayerPedId())
blip = AddBlipForRadius(coords.x, coords.y, coords.z)
SetBlipAlpha(blip,80)
SetBlipColour(blip,5)
SetBlipSprite(blip, 303)
SetBlipScale(blip, 0.7)
SetBlipAsShortRange(blip, false)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("GSF Gang")
EndTextCommandSetBlipName(blip)
end

AddEventHandler("rd-sprays:startPlacingStriez", function(model)
    local sprayC = json.decode(model)
    local model = sprayC.model
    if model == "np_sprays_gsf" then
    local coords = GetEntityCoords(PlayerPedId())
    local blip = AddBlipForRadius(coords.x, coords.y, coords.z , 150.0) -- you can use a higher number for a bigger zone
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 2)
	SetBlipAlpha (blip, 80)
    end
    if model == "np_sprays_cg" then
        local coords = GetEntityCoords(PlayerPedId())
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z , 150.0) -- you can use a higher number for a bigger zone
        SetBlipHighDetail(blip, true)
        SetBlipColour(blip, 1)
        SetBlipAlpha (blip, 80)
        end
        if model == "np_sprays_ballas" then
            local coords = GetEntityCoords(PlayerPedId())
            local blip = AddBlipForRadius(coords.x, coords.y, coords.z , 150.0) -- you can use a higher number for a bigger zone
            SetBlipHighDetail(blip, true)
            SetBlipColour(blip, 7)
            SetBlipAlpha (blip, 80)
            end
            if model == "np_sprays_kingz" then
                local coords = GetEntityCoords(PlayerPedId())
                local blip = AddBlipForRadius(coords.x, coords.y, coords.z , 150.0) -- you can use a higher number for a bigger zone
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, 28)
                SetBlipAlpha (blip, 80)
                end
                if model == "np_sprays_mandem" then
                    local coords = GetEntityCoords(PlayerPedId())
                    local blip = AddBlipForRadius(coords.x, coords.y, coords.z , 150.0) -- you can use a higher number for a bigger zone
                    SetBlipHighDetail(blip, true)
                    SetBlipColour(blip, 26)
                    SetBlipAlpha (blip, 80)
                    end
                    if model == "np_sprays_vagos" then
                        local coords = GetEntityCoords(PlayerPedId())
                        local blip = AddBlipForRadius(coords.x, coords.y, coords.z , 150.0) -- you can use a higher number for a bigger zone
                        SetBlipHighDetail(blip, true)
                        SetBlipColour(blip, 46)
                        SetBlipAlpha (blip, 80)
                        end

end)


