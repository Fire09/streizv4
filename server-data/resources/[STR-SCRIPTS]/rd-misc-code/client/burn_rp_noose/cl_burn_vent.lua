local VentUnlocked = false
local InsideBuilding = false

Citizen.CreateThread(function()
    exports['rd-polytarget']:AddBoxZone('burn_noose_entrance', vector3(2534.3, -339.75, 92.49), 0.8, 2.2, {
        heading=44,
        minZ=92.49,
        maxZ=95.49,
        data = {
            id = '1'
        }
    })

    exports['rd-polytarget']:AddBoxZone('burn_noose_inside_exit', vector3(2154.76, 2921.06, -82.08), 3.1, 2.3, {
        heading=89,
        minZ=-82.08,
        maxZ=-79.58,
        data = {
            id = '1'
        }
    })

    
    exports['rd-interact']:AddPeekEntryByPolyTarget('burn_noose_entrance', {
        {
          event = 'rd-misc-code:burnvent:enter',
          id = 'rd-misc-code:burnvent:enter',
          icon = 'info-circle',
          label = 'climb in',
          parameters = {},
        },
      }, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity, pContext)
          return VentUnlocked
        end,
      })
end)

RegisterNetEvent('rd-misc-code:burnvent:toggle', function(pUnlocked)
    VentUnlocked = pUnlocked
end)

AddEventHandler('rd-misc-code:burnvent:enter', function()
    DoScreenFadeOut(400)
    Wait(600)
    RPC.execute("rd-infinity:setWorld", 'burn_vent', "inactive", false)
    SetEntityCoords(PlayerPedId(), vector3(2356.18,2950.8,-84.79))
    SetEntityHeading(PlayerPedId(), 95.0)
    Wait(400)
    DoScreenFadeIn(1000)
    InsideBuilding = true
end)

local insidePrompt = false
AddEventHandler('rd-polyzone:enter', function(pZone)
    if pZone == 'burn_noose_inside_exit' and InsideBuilding then
        insidePrompt = true
        exports['rd-ui']:showInteraction('[E] Use Elevator')
        Citizen.CreateThread(function()
            while insidePrompt do
                Wait(0)
                if IsDisabledControlJustPressed(0, 38) then
                    insidePrompt = false
                    InsideBuilding = false
                    DoScreenFadeOut(400)
                    Wait(600)
                    RPC.execute("rd-infinity:resetWorld")
                    SetEntityCoords(PlayerPedId(), vector3(2474.84,-341.69,109.53))
                    SetEntityHeading(PlayerPedId(), 163.19)
                    Wait(400)
                    DoScreenFadeIn(1000)
                    break
                end
            end
        end)
    end
end)

AddEventHandler('rd-polyzone:exit', function(pZone)
    if pZone == 'burn_noose_inside_exit' then
        insidePrompt = false
        exports['rd-ui']:hideInteraction()
    end
end)
