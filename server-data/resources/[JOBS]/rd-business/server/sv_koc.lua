local kocInterior = {}

RegisterServerEvent("rd-business:koc:setInteriorSet")
AddEventHandler("rd-business:koc:setInteriorSet",function(pInterior)
  print(pInterior)
  kocInterior = pInterior
  TriggerClientEvent("rd-business:koc:entitySet", -1, kocInterior)
  return kocInterior
end)