CreateThread(function()
	-- Checkin, pillbox
	exports["rd-polyzone"]:AddCircleZone("central_checkin", vector3(352.33, -1400.09, 32.51), 1.0, {
		useZ=true,
	})

	-- Checkin, pillbox
	exports["rd-polyzone"]:AddCircleZone("sandy_checkin", vector3(1672.82, 3665.57, 35.34), 0.75, {
		useZ=true,
	})

	-- Armory, Central
	exports["rd-polyzone"]:AddCircleZone("hospital_armory", vector3(352.91, -1409.45, 32.51), 0.7, {
		useZ=true,
	})

	-- Armory, sandy
	exports["rd-polyzone"]:AddCircleZone("hospital_armory", vector3(1662.81, 3656.53, 35.34), 0.85, {
		useZ=true,
	})

	exports["rd-polyzone"]:AddCircleZone("hospital_armory", vector3(-820.22, -1242.72, 7.34), 0.7, {
		useZ=true,
	})

	-- armory el burro
	exports["rd-polyzone"]:AddCircleZone("hospital_armory", vector3(1211.51, -1475.16, 34.86), 1.0, {
		useZ=true,
	})

	-- Clothing / Personal Lockers, Staff room, Central
	exports["rd-polyzone"]:AddBoxZone("hospital_clothing_lockers_staff", vector3(352.53, -1416.7, 32.5), 0.8, 2.4, {
		heading=320,
		minZ=31.5,
		maxZ=34.3
	})

	exports["rd-polyzone"]:AddBoxZone("hospital_clothing_lockers_staff", vector3(-824.44, -1237.3, 7.34), 5.0, 3.8, {
		heading=320,
		minZ=6.34,
		maxZ=9.34
	})

	-- el burro fd
	exports["rd-polyzone"]:AddBoxZone("elburro_clothing_lockers_staff_char_switcher", vector3(1210.94, -1472.72, 34.85), 1.8, 3.4, {
		name="ebsw",
		heading=0,
		minZ=32.65,
		maxZ=36.65
	})

	-- Character Switcher, Staff room, central
	exports["rd-polyzone"]:AddBoxZone("hospital_character_switcher_staff", vector3(347.4, -1412.45, 32.54), 1.8, 1.2, {
		heading=320,
		minZ=31.74,
		maxZ=34.14
	})

	exports["rd-polyzone"]:AddBoxZone("hospital_character_switcher_staff", vector3(-828.56, -1236.19, 7.38), 1.6, 2.4, {
		heading=321,
		minZ=6.38,
		maxZ=9.18
	})

	-- Character Switcher, Backroom central Ward D
	exports["rd-polyzone"]:AddBoxZone("central_character_switcher_backroom", vector3(377.13, -1423.33, 32.5), 2.6, 4.0, {
		heading=230,
		minZ=31.5,
		maxZ=34.3
	})
	-- Character Switcher, Morgue
	exports["rd-polyzone"]:AddBoxZone("morgue_character_switcher_backroom", vector3(296.61, -1352.36, 24.53), 1.8, 2.0, {
		heading=50,
		minZ=23.53,
		maxZ=26.53
	})
	-- Character Switcher, Parsons
	exports["rd-polyzone"]:AddBoxZone("parsons_character_switcher_backroom", vector3(-1501.62, 857.45, 181.59), 1.8, 2.0, {
		heading=25,
		minZ=180.59,
		maxZ=184.59
	})
	-- Character Switcher, Infirmirary (Prison)
	exports["rd-polyzone"]:AddBoxZone("infirm_char_switcher_backroom", vector3(1765.96, 2598.96, 45.73), 2.0, 2.8, {
		heading=0,
		minZ=44.73,
		maxZ=47.33
	})

	-- Sandy
	exports["rd-polyzone"]:AddCircleZone("sandy_clothing_lockers_staff_char_switcher", vector3(1660.94, 3657.17, 35.34), 1.0, {
		useZ=true,
	})

	-- Central Board Room
	exports["rd-polyzone"]:AddBoxZone("central_board_room", vector3(377.59, -1420.18, 36.52), 8.8, 4.2, {
		heading=50,
		minZ=35.47,
		maxZ=38.87
	})

	-- Central Board Room Changer
	exports["rd-polytarget"]:AddBoxZone("central_board_room_screen", vector3(374.1, -1417.51, 37.35), 2.4, 0.2, {
		heading=320,
		minZ=36.95,
		maxZ=38.15
	})

	exports["rd-interact"]:AddPeekEntryByPolyTarget("central_board_room_screen", {{
		event = "rd-healthcare:changeUrl",
		id = "centralmed_change_url",
		icon = "bell",
		label = "Change URL"
	}}, { distance = { radius = 3.0 } })
end)

ICU_ROOMS = {
	{
		name = _L("healthcare-text-room", "Room") .. " 1",
		coords = vector4(356.71, -1417.50, 36.07, 230.00),
	},
	{
		name = _L("healthcare-text-room", "Room") .. " 2",
		coords = vector4(361.26, -1421.32, 36.07, 230.00),
	},
	{
		name = _L("healthcare-text-room", "Room") .. " 3",
		coords = vector4(365.88, -1425.19, 36.08, 230.00),
	},
	{
		name = _L("healthcare-text-room", "Room") .. " 4 " .. _L("healthcare-text-bed", "Bed") .. " 1",
		coords = vector4(379.00, -1399.13, 36.08, 320.00),
	},
	{
		name = _L("healthcare-text-room", "Room") .. " 4 " .. _L("healthcare-text-bed", "Bed") .. " 2",
		coords = vector4(382.53, -1402.10, 36.08, 320.00),
	},
	{
		name = _L("healthcare-text-room", "Room") .. " 5",
		coords = vector4(372.38, -1394.78, 36.08, 50.00),
	}
}
