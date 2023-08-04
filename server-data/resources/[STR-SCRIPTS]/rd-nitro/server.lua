
RegisterServerEvent('rd-nitro:server:particlefx')
AddEventHandler('rd-nitro:server:particlefx', function(veh)
     TriggerClientEvent('rd-nitro:client:particlefx', -1, veh)
end)

RegisterServerEvent('rd-nitro:server:particlefisfis')
AddEventHandler('rd-nitro:server:particlefisfis', function(type, veh)
     if type == 'fisfisacc' then
          TriggerClientEvent('rd-nitro:client:particlefisfis', -1, 'fisfisac', veh)
     elseif type == 'fisfiskapatt' then
          TriggerClientEvent('rd-nitro:client:particlefisfis', -1, 'fisfiskapat', veh)
     end
end)