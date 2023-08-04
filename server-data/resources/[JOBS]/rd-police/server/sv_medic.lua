RegisterNetEvent("reviveGranted")
AddEventHandler("reviveGranted", function(_src)
    local src = source
    if _src then src = _src end

    TriggerClientEvent("reviveFunction", src)
end)

RegisterNetEvent("ems:healplayer")
AddEventHandler("ems:healplayer", function(target)
    local src = source

    TriggerClientEvent("DoLongHudText", src, "Curing the Player")
	TriggerClientEvent("DoLongHudText", target, "You are starting to feel better.!")

    TriggerClientEvent("ems:healpassed", target)
end)