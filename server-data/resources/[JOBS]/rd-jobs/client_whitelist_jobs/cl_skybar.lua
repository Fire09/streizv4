-- // Elevators Start // --

RegisterNetEvent('rd-jobs:skybar_elevator_up')
AddEventHandler('rd-jobs:skybar_elevator_up', function()
    local skyBarElevatorDataDown = {
        {
            title = "First Floor",
            description = "Current Floor",
            disabled = true,
        },
        {
            title = "Second Floor",
            description = "Floor to Bar.",
            action = 'rd-jobs:skybar_secondfloor',
        },
    }
    exports["rd-ui"]:showContextMenu(skyBarElevatorDataDown)
end)

RegisterUICallback('rd-jobs:skybar_secondfloor', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    SetEntityCoords(PlayerPedId(), 315.49945, -929.0069, 52.813522)
    SetEntityHeading(PlayerPedId(), 172.85307)
end)

exports["rd-polytarget"]:AddCircleZone("skyhigh_elevator_up_to_main",  vector3(308.87, -930.58, 29.62), 0.35, {
    useZ = true
})

exports["rd-polytarget"]:AddCircleZone("skyhigh_elevator_up_to_main2",  vector3(314.29, -930.79, 29.62), 0.4, {
    useZ = true
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skyhigh_elevator_up_to_main", {
    {
        event = "rd-jobs:skybar_elevator_up",
        id = "skyhigh_elevator_up_to_main",
        icon = "circle",
        label = "Use Elevator",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("skyhigh_elevator_up_to_main2", {
    {
        event = "rd-jobs:skybar_elevator_up",
        id = "skyhigh_elevator_up_to_main2",
        icon = "circle",
        label = "Use Elevator",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_elevator_down')
AddEventHandler('rd-jobs:skybar_elevator_down', function()
    local skyBarElevatorDataUp = {
        {
            title = "First Floor",
            description = "Current Floor",
            action = 'rd-jobs:skybar_first_floor',
        },
        {
            title = "Second Floor",
            description = "Floor to Bar.",
            disabled = true,
        },
    }
    exports["rd-ui"]:showContextMenu(skyBarElevatorDataUp)
end)

RegisterUICallback('rd-jobs:skybar_first_floor', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    SetEntityCoords(PlayerPedId(), 310.07431, -928.9511, 29.471141)
    SetEntityHeading(PlayerPedId(), 177.84962)
end)

exports["rd-polytarget"]:AddCircleZone("skyhigh_elevator_down_to_bottom",  vector3(314.33, -930.5, 52.96), 0.3, {
    useZ = true
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skyhigh_elevator_down_to_bottom", {
    {
        event = "rd-jobs:skybar_elevator_down",
        id = "skyhigh_elevator_down_to_bottom",
        icon = "circle",
        label = "Use Elevator",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

exports["rd-polytarget"]:AddCircleZone("skyhigh_elevator_down_to_bottom2",  vector3(308.88, -930.67, 52.91), 0.35, {
    useZ = true
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skyhigh_elevator_down_to_bottom2", {
    {
        event = "rd-jobs:skybar_elevator_down",
        id = "skyhigh_elevator_down_to_bottom2",
        icon = "circle",
        label = "Use Elevator",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

-- // Elevators End // --

exports["rd-polytarget"]:AddBoxZone("skybar_tray", vector3(294.62, -924.42, 52.82), 0.6, 0.6, {
    name="skybar_tray",
    heading=340,
    --debugPoly=true,
    minZ=49.22,
    maxZ=53.22
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_tray", {
    {
        event = "rd-jobs:skybar_tray",
        id = "skybar_tray",
        icon = "boxes",
        label = "Tray",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_tray')
AddEventHandler('rd-jobs:skybar_tray', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray");
end)

-- // Pour Pints Start // --

exports["rd-polytarget"]:AddBoxZone("skybar_pour_pints", vector3(294.4, -925.2, 52.82), 0.8, 0.4, {
    name="skybar_pour_pints",
    heading=340,
    --debugPoly=true,
    minZ=49.42,
    maxZ=53.42
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_pour_pints", {
    {
        event = "rd-jobs:skybar_pints",
        id = "skybar_pour_pints",
        icon = "circle",
        label = "Pour Pints",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_pints')
AddEventHandler('rd-jobs:skybar_pints', function()
    local skybarPints = {
        {
            title = "Budweiser",
            description = "Pour Budweiser.",
            action = 'rd-jobs:pour_budweiser',
        },
        {
            title = "Carling",
            description = "Pour Carling.",
            action = 'rd-jobs:pour_carling',
        },
        {
            title = "Stella",
            description = "Pour Stella.",
            action = 'rd-jobs:pour_stella',
        },
        {
            title = "Fosters",
            description = "Pour Fosters.",
            action = 'rd-jobs:pour_fosters',
        },
        {
            title = "Jack Daniels",
            description = "Pour Jack Daniels.",
            action = 'rd-jobs:pour_jack',
        },
        {
            title = "Jägermeister",
            description = "Pour Jägermeister",
            action = 'rd-jobs:pour_jagermeister',
        },
        {
            title = "Kamikaze",
            description = "Pour Kamikaze",
            action = 'rd-jobs:pour_kamikaze',
        },
    }
    exports["rd-ui"]:showContextMenu(skybarPints)
end)

RegisterUICallback('rd-jobs:pour_budweiser', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Budweiser')
        if finished == 100 then
            TriggerEvent('player:receiveItem', 'budweiser', 1)
        end
    end
end)

RegisterUICallback('rd-jobs:pour_carling', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Carling')
        if finished == 100 then
            TriggerEvent('player:receiveItem', 'carling', 1)
        end
    end
end)

RegisterUICallback('rd-jobs:pour_stella', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Stella')
        if finished == 100 then
            TriggerEvent('player:receiveItem', 'stella', 1)
        end
    end
end)

RegisterUICallback('rd-jobs:pour_fosters', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
        if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Fosters')
        if finished == 100 then
            TriggerEvent('player:receiveItem', 'fosters', 1)
        end
    end
end)

RegisterUICallback('rd-jobs:pour_jagermeister', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Jägermeisterh')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'shot9', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterUICallback('rd-jobs:pour_kamikaze', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(5000, 'Preparing Kamikaze')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'shot7', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

RegisterUICallback('rd-jobs:pour_jack', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        SetEntityCoords(PlayerPedId(), 294.94372, -925.4436, 52.816883)
        SetEntityHeading(PlayerPedId(), 63.479106)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports['rd-taskbar']:taskBar(5000, 'Pouring Jack Daniels')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'jackdaniels', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work here !', 2)
    end
end)

-- // Pour Pints End // --

-- // Tables Start // --

RegisterNetEvent('rd-jobs:skybar_table_1')
AddEventHandler('rd-jobs:skybar_table_1', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray-1");
end)

exports["rd-polytarget"]:AddBoxZone("skybar_table_1", vector3(295.67, -919.41, 52.71), 1, 1, {
    name="skybar_table_1",
    heading=340,
    --debugPoly=true,
    minZ=48.91,
    maxZ=52.91
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_table_1", {
    {
        event = "rd-jobs:skybar_table_1",
        id = "skybar_table_1",
        icon = "boxes",
        label = "Table",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_table_2')
AddEventHandler('rd-jobs:skybar_table_2', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray-2");
end)

exports["rd-polytarget"]:AddBoxZone("skybar_table_2", vector3(287.98, -926.64, 52.81), 1, 1, {
    name="skybar_table_2",
    heading=340,
    --debugPoly=true,
    minZ=49.01,
    maxZ=53.01
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_table_2", {
    {
        event = "rd-jobs:skybar_table_2",
        id = "skybar_table_2",
        icon = "boxes",
        label = "Table",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_table_3')
AddEventHandler('rd-jobs:skybar_table_3', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray-3");
end)

exports["rd-polytarget"]:AddBoxZone("skybar_table_3", vector3(293.75, -914.07, 52.71), 1, 1, {
    name="skybar_table_3",
    heading=0,
    --debugPoly=true,
    minZ=49.31,
    maxZ=53.31
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_table_3", {
    {
        event = "rd-jobs:skybar_table_3",
        id = "skybar_table_3",
        icon = "boxes",
        label = "Table",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_table_4')
AddEventHandler('rd-jobs:skybar_table_4', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray-4");
end)

exports["rd-polytarget"]:AddBoxZone("skybar_table_4", vector3(295.39, -909.55, 52.71), 1, 1, {
    name="skybar_table_4",
    heading=330,
    --debugPoly=true,
    minZ=49.11,
    maxZ=53.11
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_table_4", {
    {
        event = "rd-jobs:skybar_table_4",
        id = "skybar_table_4",
        icon = "boxes",
        label = "Table",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_table_5')
AddEventHandler('rd-jobs:skybar_table_5', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray-5");
end)

exports["rd-polytarget"]:AddBoxZone("skybar_table_5", vector3(304.06, -918.45, 52.71), 1, 2.2, {
    name="skybar_table_5",
    heading=265,
    --debugPoly=true,
    minZ=49.11,
    maxZ=53.11
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_table_5", {
    {
        event = "rd-jobs:skybar_table_5",
        id = "skybar_table_5",
        icon = "boxes",
        label = "Table",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_table_6')
AddEventHandler('rd-jobs:skybar_table_6', function()
    TriggerEvent("server-inventory-open", "1", "skybar-tray-6");
end)

exports["rd-polytarget"]:AddBoxZone("skybar_table_6", vector3(307.97, -912.81, 52.71), 1.2, 2.0, {
    name="skybar_table_6",
    heading=250,
    --debugPoly=true,
    minZ=49.11,
    maxZ=53.11
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_table_6", {
    {
        event = "rd-jobs:skybar_table_6",
        id = "skybar_table_6",
        icon = "boxes",
        label = "Table",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

-- // Tables End // --

-- // Chairs Start // --

exports["rd-polytarget"]:AddBoxZone("sofa_1_seat_1", vector3(299.59, -918.43, 52.71), 1, 1, {
    name="sofa_1_seat_1",
    heading=0,
    minZ=48.51,
    maxZ=52.51
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_1_seat_1", {
    {
        event = "rd-jobs:sofa1_seat_1",
        id = "sofa_1_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa1_seat_1')
AddEventHandler('rd-jobs:sofa1_seat_1', function()
    SetEntityCoords(PlayerPedId(), 299.65823, -917.7366, 52.707416)
    SetEntityHeading(PlayerPedId(), 4.5911979)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_1_seat_2", vector3(300.67, -918.43, 52.81), 1, 1, {
    name="sofa_1_seat_2",
    heading=0,
    minZ=48.51,
    maxZ=52.51
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_1_seat_2", {
    {
        event = "rd-jobs:sofa1_seat_2",
        id = "sofa_1_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa1_seat_2')
AddEventHandler('rd-jobs:sofa1_seat_2', function()
    SetEntityCoords(PlayerPedId(), 300.8981, -917.9714, 52.707374)
    SetEntityHeading(PlayerPedId(), 348.18777)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_2_seat_1", vector3(294.5, -920.77, 52.81), 1, 1, {
    name="sofa_2_seat_1",
    heading=350,
    --debugPoly=true,
    minZ=48.61,
    maxZ=52.61
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_2_seat_1", {
    {
        event = "rd-jobs:sofa2_seat_1",
        id = "sofa_2_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa2_seat_1')
AddEventHandler('rd-jobs:sofa2_seat_1', function()
    SetEntityCoords(PlayerPedId(), 294.65679, -920.0111, 52.81369)
    SetEntityHeading(PlayerPedId(), 0.0571383)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_2_seat_2", vector3(295.64, -921.09, 52.81), 1, 1, {
    name="sofa_2_seat_2",
    heading=330,
    --debugPoly=true,
    minZ=48.61,
    maxZ=52.61
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_2_seat_2", {
    {
        event = "rd-jobs:sofa2_seat_2",
        id = "sofa_2_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa2_seat_2')
AddEventHandler('rd-jobs:sofa2_seat_2', function()
    SetEntityCoords(PlayerPedId(), 295.87875, -920.4712, 52.81364)
    SetEntityHeading(PlayerPedId(), 334.7713)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_3_seat_1", vector3(290.82, -920.74, 52.82), 1, 1, {
    name="sofa_3_seat_1",
    heading=345,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_3_seat_1", {
    {
        event = "rd-jobs:sofa3_seat_1",
        id = "sofa_3_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa3_seat_1')
AddEventHandler('rd-jobs:sofa3_seat_1', function()
    SetEntityCoords(PlayerPedId(), 290.63076, -921.3533, 52.817691)
    SetEntityHeading(PlayerPedId(), 162.0863)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_3_seat_2", vector3(289.8, -920.35, 52.82), 1, 1, {
    name="sofa_3_seat_2",
    heading=340,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_3_seat_2", {
    {
        event = "rd-jobs:sofa3_seat_2",
        id = "sofa_3_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa3_seat_2')
AddEventHandler('rd-jobs:sofa3_seat_2', function()
    SetEntityCoords(PlayerPedId(), 289.5158, -920.9782, 52.817649)
    SetEntityHeading(PlayerPedId(), 161.65139)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_4_seat_1", vector3(290.02, -923.25, 52.82), 1, 1, {
    name="sofa_4_seat_1",
    heading=335,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_4_seat_1", {
    {
        event = "rd-jobs:sofa4_seat_1",
        id = "sofa_4_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa4_seat_1')
AddEventHandler('rd-jobs:sofa4_seat_1', function()
    SetEntityCoords(PlayerPedId(), 290.32449, -922.663, 52.817703)
    SetEntityHeading(PlayerPedId(), 335.46411)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_4_seat_2", vector3(288.96, -922.93, 52.82), 1, 1, {
    name="sofa_4_seat_2",
    heading=345,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_4_seat_2", {
    {
        event = "rd-jobs:sofa4_seat_2",
        id = "sofa_4_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa4_seat_2')
AddEventHandler('rd-jobs:sofa4_seat_2', function()
    SetEntityCoords(PlayerPedId(), 289.24191, -922.2395, 52.817642)
    SetEntityHeading(PlayerPedId(), 344.19955)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_5_seat_1", vector3(289.14, -925.45, 52.82), 1, 1, {
    name="sofa_5_seat_1",
    heading=350,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_5_seat_1", {
    {
        event = "rd-jobs:sofa5_seat_1",
        id = "sofa_5_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa5_seat_1')
AddEventHandler('rd-jobs:sofa5_seat_1', function()
    SetEntityCoords(PlayerPedId(), 288.90716, -926.1458, 52.817687)
    SetEntityHeading(PlayerPedId(), 175.3488)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_5_seat_2", vector3(288.0, -925.12, 52.82), 1, 1, {
    name="sofa_5_seat_2",
    heading=335,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_5_seat_2", {
    {
        event = "rd-jobs:sofa5_seat_2",
        id = "sofa_5_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa5_seat_2')
AddEventHandler('rd-jobs:sofa5_seat_2', function()
    SetEntityCoords(PlayerPedId(), 287.7807, -925.8229, 52.817638)
    SetEntityHeading(PlayerPedId(), 157.60682)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_6_seat_1", vector3(288.08, -928.41, 52.82), 1, 1, {
    name="sofa_6_seat_1",
    heading=330,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_6_seat_1", {
    {
        event = "rd-jobs:sofa6_seat_1",
        id = "sofa_6_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa6_seat_1')
AddEventHandler('rd-jobs:sofa6_seat_1', function()
    SetEntityCoords(PlayerPedId(), 288.2853, -927.6749, 52.817646)
    SetEntityHeading(PlayerPedId(), 334.2138)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_6_seat_2", vector3(286.99, -928.02, 52.81), 1, 1, {
    name="sofa_6_seat_2",
    heading=345,
    --debugPoly=true,
    minZ=48.61,
    maxZ=52.61
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_6_seat_2", {
    {
        event = "rd-jobs:sofa6_seat_2",
        id = "sofa_6_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa6_seat_2')
AddEventHandler('rd-jobs:sofa6_seat_2', function()
    SetEntityCoords(PlayerPedId(), 287.24633, -927.2843, 52.817687)
    SetEntityHeading(PlayerPedId(), 349.12469)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_7_seat_1", vector3(286.53, -932.81, 52.82), 1, 1, {
    name="sofa_7_seat_1",
    heading=330,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_7_seat_1", {
    {
        event = "rd-jobs:sofa7_seat_1",
        id = "sofa_7_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa7_seat_1')
AddEventHandler('rd-jobs:sofa7_seat_1', function()
    SetEntityCoords(PlayerPedId(), 286.76834, -932.1701, 52.817691)
    SetEntityHeading(PlayerPedId(), 338.8096)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_7_seat_2", vector3(285.41, -932.34, 52.82), 1, 1, {
    name="sofa_7_seat_2",
    heading=345,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_7_seat_2", {
    {
        event = "rd-jobs:sofa7_seat_2",
        id = "sofa_7_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa7_seat_2')
AddEventHandler('rd-jobs:sofa7_seat_2', function()
    SetEntityCoords(PlayerPedId(), 285.54269, -931.7077, 52.817646)
    SetEntityHeading(PlayerPedId(), 352.5653)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_8_seat_1", vector3(286.19, -930.07, 52.82), 1, 1, {
    name="sofa_8_seat_1",
    heading=335,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_8_seat_1", {
    {
        event = "rd-jobs:sofa8_seat_1",
        id = "sofa_8_seat_1",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa8_seat_1')
AddEventHandler('rd-jobs:sofa8_seat_1', function()
    SetEntityCoords(PlayerPedId(), 285.90835, -930.7475, 52.817642)
    SetEntityHeading(PlayerPedId(), 153.30564)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-------------------------------------------------------------------------------------------

exports["rd-polytarget"]:AddBoxZone("sofa_8_seat_2", vector3(287.32, -930.44, 52.82), 1, 1, {
    name="sofa_8_seat_2",
    heading=345,
    --debugPoly=true,
    minZ=48.62,
    maxZ=52.62
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("sofa_8_seat_2", {
    {
        event = "rd-jobs:sofa8_seat_2",
        id = "sofa_8_seat_2",
        icon = "chair",
        label = "Sit",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:sofa8_seat_2')
AddEventHandler('rd-jobs:sofa8_seat_2', function()
    SetEntityCoords(PlayerPedId(), 287.01989, -931.1384, 52.817642)
    SetEntityHeading(PlayerPedId(), 166.52056)
    TriggerEvent('animation:PlayAnimation', 'sitchair4')
end)

-- // Chairs End // --

-- // Snacks Start // --

exports["rd-polytarget"]:AddBoxZone("skybar_grab_snack", vector3(293.91, -926.57, 52.82), 0.8, 1, {
    name="skybar_grab_snack",
    heading=340,
    --debugPoly=true,
    minZ=48.82,
    maxZ=52.82
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("skybar_grab_snack", {
    {
        event = "rd-jobs:skybar_snacks",
        id = "skybar_grab_snack",
        icon = "circle",
        label = "Snacks",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('rd-jobs:skybar_snacks')
AddEventHandler('rd-jobs:skybar_snacks', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("skybar")
    if isEmployed then
        TriggerEvent("server-inventory-open", "0909", "Shop")
    end
end)