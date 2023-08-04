RPC.register('rd-weed:deliverpackage', function()
    TriggerClientEvent('inventory:removeItem', source, 'weedpackage', 1)
end)