Citizen.CreateThread(function()
    for id, zone in ipairs(HiveZones) do
        exports["rd-polyzone"]:AddCircleZone("rd-beekeeping:bee_zone", zone[1], zone[2],{
            zoneEvents={"rd-beekeeping:trigger_zone"},
            data = {
                id = id,
            },
        })
    end
end)