VehiclesConfig = {
    {
        ["Job"] = "police",
        ["Label"] = "Veiculos Policiais",
        ["Spawn"] = vector4(435.76, -976.08, 25.52, 90.85),
        ["Garage"] = "MRPD",

        ["Vehicles"] = {
            { name = "Ford Crown Victoria", model = "npolvic", price = 5000, first_free = true },
            { name = "Ford Explorer", model = "npolexp", price = 5000, first_free = true },
            { name = "Ford Mustang", model = "npolstang", price = 5000, first_free = true },
            { name = "Dodge Charger", model = "npolchar", price = 5000, first_free = true },
            { name = "Dodge Challenger", model = "npolchal", price = 5000, first_free = true },
            { name = "Chevrolet Corvette", model = "npolvette", price = 5000, first_free = true },
            { name = "MM (Moto)", model = "npolmm", price = 5000, first_free = true },
        },

        ["NPC"] = {
            id = "police_vehicles",
            name = "Veiculos Policiais",
            model = "s_m_y_cop_01",
            networked = false,
            distance = 50.0,
            position = {
                coords = vector3(441.43, -974.95, 24.7),
                heading = 180.62,
                random = false,
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ["isNPC"] = true,
                ["isPoliceVehicleSeller"] = true,
            },
            scenario = "WORLD_HUMAN_COP_IDLES",
        },
    },
    {
        ["Job"] = "cid",
        ["Label"] = "Veiculos Policiais",
        ["Spawn"] = vector4(-1098.49, -830.4, 3.24, 36.05),
        ["Garage"] = "VBPD",

        ["Vehicles"] = {
            { name = "Ford Crown Victoria", model = "npolvic", price = 5000, first_free = true },
            { name = "Ford Explorer", model = "npolexp", price = 5000, first_free = true },
            { name = "Ford Mustang", model = "npolstang", price = 5000, first_free = true },
            { name = "Dodge Charger", model = "npolchar", price = 5000, first_free = true },
            { name = "Dodge Challenger", model = "npolchal", price = 5000, first_free = true },
            { name = "Chevrolet Corvette", model = "npolvette", price = 5000, first_free = true },

            { name = "Baller Undercover", model = "ucballer", price = 5000, first_free = true },
            { name = "Banshee Undercover", model = "ucbanshee", price = 5000, first_free = true },
            { name = "Buffalo Undercover", model = "ucbuffalo", price = 5000, first_free = true },
            { name = "Comet Undercover", model = "uccomet", price = 5000, first_free = true },
            { name = "Coquette Undercover", model = "uccoquette", price = 5000, first_free = true },
            { name = "Primo Undercover", model = "ucprimo", price = 5000, first_free = true },
            { name = "Rancher Undercover", model = "ucrancher", price = 5000, first_free = true },
            { name = "Washington Undercover", model = "ucwashington", price = 5000, first_free = true },

            { name = "MM (Moto)", model = "npolmm", price = 5000, first_free = true },
            { name = "Retinue (???)", model = "npolretinue", price = 5000, first_free = true },
        },

        ["NPC"] = {
            id = "police_vehicles_cid",
            name = "Veiculos Policiais",
            model = "s_f_y_cop_01",
            networked = false,
            distance = 50.0,
            position = {
                coords = vector3(-1102.05, -828.0, 2.76),
                heading = 303.22,
                random = false,
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ["isNPC"] = true,
                ["isPoliceVehicleSeller"] = true,
            },
            scenario = "WORLD_HUMAN_COP_IDLES",
        },
    },
}