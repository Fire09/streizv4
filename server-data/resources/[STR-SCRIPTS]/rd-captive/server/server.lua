RegisterServerEvent('blindfold:server:apply')
AddEventHandler('blindfold:server:apply', function(isBlind,pTarget)
    if isBlind then
        TriggerClientEvent('blindfold:apply' , pTarget , true)
    elseif not isBlind then
        TriggerClientEvent('blindfold:apply' , pTarget , false)
    else 
        error('^9 [BLINDFOLD]',1)
    end
end)