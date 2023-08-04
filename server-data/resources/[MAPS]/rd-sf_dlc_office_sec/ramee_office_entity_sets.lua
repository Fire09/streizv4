local interiors = {

    {
        ipl = 'np_sf_office_ramee',
        coords = { x = -1004.56537, y =  -755.484863, z = 55.0024719 },
        entitySets = {
            { name = 'entity_set_armoury', enable = false },
            { name = 'entity_set_standard_office', enable = true },
            { name = 'entity_set_blocker', enable = false },
            { name = 'entity_set_wpaper_1', enable = false },
            { name = 'entity_set_wpaper_2', enable = false },
            { name = 'entity_set_wpaper_3', enable = false },
            { name = 'entity_set_wpaper_4', enable = false },
            { name = 'entity_set_wpaper_5', enable = false },
            { name = 'entity_set_wpaper_6', enable = false },
            { name = 'entity_set_wpaper_7', enable = false },
            { name = 'entity_set_wpaper_8', enable = false },
            { name = 'entity_set_wpaper_9', enable = true },
            { name = 'entity_set_moving', enable = false },
            { name = 'entity_set_tint_ag', enable = false },
            { name = 'entity_set_spare_seats', enable = false },
            { name = 'entity_set_player_seats', enable = true },
            { name = 'entity_set_player_desk', enable = false },
            { name = 'entity_set_m_golf_intro', enable = false },
            { name = 'entity_set_m_setup', enable = false },
            { name = 'entity_set_m_nightclub', enable = false },
            { name = 'entity_set_m_yacht', enable = false },
            { name = 'entity_set_m_promoter', enable = false },
            { name = 'entity_set_m_limo_photo', enable = false },
            { name = 'entity_set_m_limo_wallet', enable = false },
            { name = 'entity_set_m_the_way', enable = false },
            { name = 'entity_set_m_billionaire', enable = false },
            { name = 'entity_set_m_families', enable = false },
            { name = 'entity_set_m_ballas', enable = false },
            { name = 'entity_set_m_hood', enable = false },
            { name = 'entity_set_m_fire_booth', enable = false },
            { name = 'entity_set_m_50', enable = false },
            { name = 'entity_set_m_taxi', enable = false },
            { name = 'entity_set_m_gone_golfing', enable = false },
            { name = 'entity_set_m_motel', enable = false },
            { name = 'entity_set_m_construction', enable = false },
            { name = 'entity_set_m_hit_list', enable = false },
            { name = 'entity_set_m_tuner', enable = false },
            { name = 'entity_set_m_attack', enable = false },
            { name = 'entity_set_m_vehicles', enable = false },
            { name = 'entity_set_m_trip_01', enable = false },
            { name = 'entity_set_m_trip_02', enable = false },
            { name = 'entity_set_m_trip_03', enable = false },
            { name = 'entity_set_disc_01', enable = false },
            { name = 'entity_set_disc_02', enable = false },
            { name = 'entity_set_disc_03', enable = false },
            { name = 'entity_set_disc_04', enable = false },
            { name = 'entity_set_disc_05', enable = false },
            { name = 'entity_set_disc_06', enable = false },
            { name = 'entity_set_art_1', enable = false },
            { name = 'entity_set_art_2', enable = false },
            { name = 'entity_set_art_3', enable = false },
            { name = 'entity_set_frost_glass', enable = false },
            { name = 'entity_set_ramee', enable = true },
        }
    },
}    
CreateThread(function()
    for _, interior in ipairs(interiors) do
        if not interior.ipl or not interior.coords or not interior.entitySets then
            print('Error while loading interior.')
            return
        end
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
    print("Interior data loaded.")
end)