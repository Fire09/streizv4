RegisterNetEvent("mka-anchor:passAnchor")
AddEventHandler("mka-anchor:passAnchor", function(veh)
  local src = source

  if priddlev == -1 then
      priddlev = src
  end

    TriggerClientEvent("mka-anchor:passedAnchor", veh, priddlev)
end)