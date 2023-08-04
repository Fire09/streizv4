RegisterServerEvent('mka-grapple:createRope')
AddEventHandler('mka-grapple:createRope', function(grappleid, dest)
    TriggerClientEvent('mka-grapple:ropeCreated', source, grappleid, dest)
end)

RegisterServerEvent('mka-grapple:destroyRope')
AddEventHandler('mka-grapple:destroyRope', function(grappleid)
    TriggerClientEvent('mka-grapple:ropeDestroyed:'..tostring(grappleid), source)
end)