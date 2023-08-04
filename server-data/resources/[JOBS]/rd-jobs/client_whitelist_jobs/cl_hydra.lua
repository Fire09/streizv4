exports["rd-polytarget"]:AddCircleZone("hydra_elevator_1",  vector3(-1010.89, -416.26, 33.47), 0.3, {
    useZ = true
})

exports["rd-polytarget"]:AddCircleZone("hydra_elevator_2",  vector3(-1007.47, -423.61, 33.37), 0.25, {
    useZ = true
})

exports["rd-polytarget"]:AddCircleZone("hydra_elevator_3",  vector3(-1011.03, -416.32, 39.73), 0.25, {
    useZ = true
})

exports["rd-polytarget"]:AddCircleZone("hydra_elevator_4",  vector3(-1011.09, -416.34, 50.95), 0.25, {
    useZ = true
})

exports["rd-polytarget"]:AddCircleZone("hydra_elevator_5",  vector3(-1011.09, -416.43, 58.44), 0.25, {
    useZ = true
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("hydra_elevator_5", {{
    event = "hydra_elevator_up_4",
    id = "hydra_elevator_5",
    icon = "fas fa-circle",
    label = "Elevator",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("hydra_elevator_4", {{
    event = "hydra_elevator_up_3",
    id = "hydra_elevator_4",
    icon = "fas fa-circle",
    label = "Elevator",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("hydra_elevator_3", {{
    event = "hydra_elevator_up_2",
    id = "hydra_elevator_3",
    icon = "fas fa-circle",
    label = "Elevator",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("hydra_elevator_2", {{
    event = "hydra_elevator_up",
    id = "hydra_elevator_2",
    icon = "fas fa-circle",
    label = "Elevator",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

exports["rd-interact"]:AddPeekEntryByPolyTarget("hydra_elevator_1", {{
    event = "hydra_elevator_up",
    id = "hydra_elevator_1",
    icon = "fas fa-circle",
    label = "Elevator",
    parameters = {},
}}, {
    distance = { radius = 1.5 },
});

RegisterNetEvent('hydra_elevator_up')
AddEventHandler('hydra_elevator_up', function()
	local menuData = {
		{
            title = "Elevator",
            description = "Hydra Incorporation.",
            key = true,
			children = {
                { title = "Ground Floor", action = "rd-jobs:hydra_ground_floor", key = true, disabled = true},
                { title = "First Floor", action = "rd-jobs:hydra_first_floor", key = true},
                { title = "Second Floor", action = "rd-jobs:hydra_second_floor", key = true},
                { title = "Third Floor", action = "rd-jobs:hydra_third_floor", key = true},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)

RegisterNetEvent('hydra_elevator_up_2')
AddEventHandler('hydra_elevator_up_2', function()
	local menuData = {
		{
            title = "Elevator",
            description = "Hydra Incorporation.",
            key = true,
			children = {
                { title = "Ground Floor", action = "rd-jobs:hydra_ground_floor", key = true},
                { title = "First Floor", action = "rd-jobs:hydra_first_floor", key = true, disabled = true},
                { title = "Second Floor", action = "rd-jobs:hydra_second_floor", key = true},
                { title = "Third Floor", action = "rd-jobs:hydra_third_floor", key = true},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)

RegisterNetEvent('hydra_elevator_up_3')
AddEventHandler('hydra_elevator_up_3', function()
	local menuData = {
		{
            title = "Elevator",
            description = "Hydra Incorporation.",
            key = true,
			children = {
                { title = "Ground Floor", action = "rd-jobs:hydra_ground_floor", key = true},
                { title = "First Floor", action = "rd-jobs:hydra_first_floor", key = true},
                { title = "Second Floor", action = "rd-jobs:hydra_second_floor", key = true, disabled = true},
                { title = "Third Floor", action = "rd-jobs:hydra_third_floor", key = true},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)

RegisterNetEvent('hydra_elevator_up_4')
AddEventHandler('hydra_elevator_up_4', function()
	local menuData = {
		{
            title = "Elevator",
            description = "Hydra Incorporation.",
            key = true,
			children = {
                { title = "Ground Floor", action = "rd-jobs:hydra_ground_floor", key = true},
                { title = "First Floor", action = "rd-jobs:hydra_first_floor", key = true},
                { title = "Second Floor", action = "rd-jobs:hydra_second_floor", key = true},
                { title = "Third Floor", action = "rd-jobs:hydra_third_floor", key = true, disabled = true},
            },
        },
    }
    exports["rd-ui"]:showContextMenu(menuData)
end)

RegisterUICallback('rd-jobs:hydra_first_floor', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['rd-taskbar']:taskBar(5000, 'Calling Elevator')
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityCoords(PlayerPedId(), -1009.162, -416.9665, 39.631774)
        SetEntityHeading(PlayerPedId(), 105.65964)
    end
end)

RegisterUICallback('rd-jobs:hydra_second_floor', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['rd-taskbar']:taskBar(5000, 'Calling Elevator')
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityCoords(PlayerPedId(), -1008.973, -416.7036, 50.854179)
        SetEntityHeading(PlayerPedId(), 105.65964)
    end
end)

RegisterUICallback('rd-jobs:hydra_third_floor', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['rd-taskbar']:taskBar(5000, 'Calling Elevator')
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityCoords(PlayerPedId(), -1009.061, -416.9786, 58.34037)
        SetEntityHeading(PlayerPedId(), 115.46797)
    end
end)

RegisterUICallback('rd-jobs:hydra_ground_floor', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['rd-taskbar']:taskBar(5000, 'Calling Elevator')
    if finished == 100 then
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityCoords(PlayerPedId(), -1008.924, -417.0314, 33.264652)
        SetEntityHeading(PlayerPedId(), 111.24526)
    end
end)

