AddEventHandler("explosionEvent", function(sender, ev)
    TriggerClientEvent('rd-vaultrob:lower:vaultdoor', sender)
end)