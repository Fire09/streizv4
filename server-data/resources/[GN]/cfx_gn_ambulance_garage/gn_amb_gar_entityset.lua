local interiors = {
    {
        ipl = 'gn_ambulance_carpack_milo',
        coords = { x = 1652.572, y = 3666.607, z = 36.6499 },
        entitySets = {
            { name = 'office_detail', enable = true }, --Do not modify
            { name = 'amb_meca', enable = true }, --Activate the mechanic workshop
            { name = 'amb_lift', enable = false }, --Activate the elevators
        }
    },
    {
        ipl = 'gn_ambulance_pillbox_carpack_milo',
        coords = { x = 329.9281, y = -573.7103, z = 30.07213 },
        entitySets = {
            { name = 'office_detail', enable = true }, --Do not modify
            { name = 'door', enable = true }, --Do not modify
            { name = 'amb_meca', enable = false }, --Activate the mechanic workshop
            { name = 'amb_lift', enable = true }, --Activate the elevators
        }
    },
    {
        ipl = 'gn_ambulance_lsmc_carpack_milo',
        coords = { x = 314.9747, y = -1424.51, z = 31.24785 },
        entitySets = {
            { name = 'office_detail', enable = true }, --Do not modify
            { name = 'door', enable = true }, --Do not modify
            { name = 'amb_meca', enable = false }, --Activate the mechanic workshop
            { name = 'amb_lift', enable = true }, --Activate the elevators
        }
    },
    {
        ipl = 'gn_ambulance_mz_carpack_milo',
        coords = { x = -507.123, y = -334.602, z = 35.7092 },
        entitySets = {
            { name = 'office_detail', enable = true }, --Do not modify
            { name = 'door', enable = true }, --Do not modify
            { name = 'amb_meca', enable = false }, --Activate the mechanic workshop
            { name = 'amb_lift', enable = true }, --Activate the elevators
        }
    },
}

CreateThread(function()
    for _, interior in ipairs(interiors) do
        RequestIpl(interior.ipl)
        local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
        if IsValidInterior(interiorID) then
            for __, entitySet in ipairs(interior.entitySets) do
                if entitySet.enable then
                    EnableInteriorProp(interiorID, entitySet.name)
                    if entitySet.color then
                        SetInteriorPropColor(interiorID, entitySet.name, entitySet.color)
                    end
                else
                    DisableInteriorProp(interiorID, entitySet.name)
                end
            end
            RefreshInterior(interiorID)
        end
    end
end)