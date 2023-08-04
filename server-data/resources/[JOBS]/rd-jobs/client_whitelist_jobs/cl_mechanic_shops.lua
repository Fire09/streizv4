-- Tuner Shop

local tuner_Craft = false
local tuner_Stash = false

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "tuner_craft" then
        tuner_Craft = true     
        TunerCraft()
        local isEmployed = exports["rd-business"]:IsEmployedAt("tuner")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Craft")
        end
    elseif name == "tuner_stash" then
        tuner_Stash = true
        TunerStash()
        local isEmployed = exports["rd-business"]:IsEmployedAt("tuner")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "tuner_craft" then
        tuner_Craft = false
        exports['rd-ui']:hideInteraction()
    elseif name == "tuner_stash" then
        tuner_Stash = false
        exports['rd-ui']:hideInteraction()
    end
end)

function TunerCraft()
	Citizen.CreateThread(function()
        while tuner_Craft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("tuner")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '28', 'Craft')
                end
			end
		end
	end)
end

function TunerStash()
	Citizen.CreateThread(function()
        while tuner_Stash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("tuner")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '1', 'tuner-shop-stash')
                end
			end
		end
	end)
end

-- Harmony 

local Harmony_Craft = false
local Harmony_Stash = false

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "harmony_repairs_craft" then
        Harmony_Craft = true     
        HarmonyCraft()
        local isEmployed = exports["rd-business"]:IsEmployedAt("harmony_repairs")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Craft")
        end
    elseif name == "harmony_repairs_stash" then
        Harmony_Stash = true
        HarmonyStash()
        local isEmployed = exports["rd-business"]:IsEmployedAt("harmony_repairs")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "harmony_repairs_craft" then
        Harmony_Craft = false
        exports['rd-ui']:hideInteraction()
    elseif name == "harmony_repairs_stash" then
        Harmony_Stash = false
        exports['rd-ui']:hideInteraction()
    end
end)

function HarmonyCraft()
	Citizen.CreateThread(function()
        while Harmony_Craft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("harmony_repairs")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '28', 'Craft')
                end
			end
		end
	end)
end

function HarmonyStash()
	Citizen.CreateThread(function()
        while Harmony_Stash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("harmony_repairs")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '1', 'harmony-stash')
                end
			end
		end
	end)
end

-- Hayes


local Hayes_Craft = false
local Hayes_Stash = false

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "hayes_autos_craft" then
        Hayes_Craft = true     
        HayesCraft()
        local isEmployed = exports["rd-business"]:IsEmployedAt("hayes_autos")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Craft")
        end
    elseif name == "hayes_autos_stash" then
        Hayes_Stash = true
        HayesStash()
        local isEmployed = exports["rd-business"]:IsEmployedAt("hayes_autos")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "hayes_autos_craft" then
        Hayes_Craft = false
        exports['rd-ui']:hideInteraction()
    elseif name == "hayes_autos_stash" then
        Hayes_Stash = false
        exports['rd-ui']:hideInteraction()
    end
end)

function HayesCraft()
	Citizen.CreateThread(function()
        while Hayes_Craft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("hayes_autos")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '28', 'Craft')
                end
			end
		end
	end)
end

function HayesStash()
	Citizen.CreateThread(function()
        while Hayes_Stash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("hayes_autos")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '1', 'hayes-stash')
                end
			end
		end
	end)
end

-- Otto's

local ottos_auto_Craft = false
local ottos_auto_Stash = false

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "ottos_auto_craft" then
        ottos_auto_Craft = true     
        OttosCraft()
        local isEmployed = exports["rd-business"]:IsEmployedAt("ottos_auto")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Craft")
        end
    elseif name == "ottos_auto_stash" then
        ottos_auto_Stash = true
        OttosStash()
        local isEmployed = exports["rd-business"]:IsEmployedAt("ottos_auto")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "ottos_auto_craft" then
        ottos_auto_Craft = false
        exports['rd-ui']:hideInteraction()
    elseif name == "ottos_auto_stash" then
        ottos_auto_Stash = false
        exports['rd-ui']:hideInteraction()
    end
end)

function OttosCraft()
	Citizen.CreateThread(function()
        while ottos_auto_Craft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("ottos_auto")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '28', 'Craft')
                end
			end
		end
	end)
end

function OttosStash()
	Citizen.CreateThread(function()
        while ottos_auto_Stash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("ottos_auto")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '1', 'ottos-autos-stash')
                end
			end
		end
	end)
end

-- Poly Zones --

Citizen.CreateThread(function()
    -- Tuner Shop | Start --
    exports["rd-polyzone"]:AddBoxZone("tuner_stash", vector3(128.46, -3014.08, 7.04), 2.5, 2.5, {
        name="tuner_stash",
        heading=0,
        debugPoly=false,
        minZ=5.04,
        maxZ=9.04
    })

    exports["rd-polyzone"]:AddBoxZone("tuner_craft", vector3(143.96, -3051.26, 7.04), 1, 5, {
        name="tuner_craft",
        heading=0,
        --debugPoly=false,
        minZ=5.44,
        maxZ=9.44
    })
    -- Tuner Shop | End --

    -- Harmony Repairs | Start --
    exports["rd-polyzone"]:AddBoxZone("harmony_repairs_stash", vector3(1187.12, 2635.81, 38.4), 1, 1.4, {
        name="harmony_repairs_stash",
        heading=0,
        --debugPoly=false,
        minZ=35.0,
        maxZ=39.0
    })

    exports["rd-polyzone"]:AddBoxZone("harmony_repairs_craft", vector3(1176.23, 2635.29, 37.75), 3, 2, {
        name="harmony_repairs_craft",
        heading=270,
        --debugPoly=false,
        minZ=35.75,
        maxZ=39.75
    })
    -- Harmony Repairs | End --

    -- Hayes Autos | Start --
    exports["rd-polyzone"]:AddBoxZone("hayes_autos_stash", vector3(-1418.49, -454.77, 35.91), 1, 3.0, {
        name="hayes_autos_stash",
        heading=30,
        --debugPoly=false,
        minZ=34.51,
        maxZ=38.51
    })

    exports["rd-polyzone"]:AddBoxZone("hayes_autos_craft", vector3(-1408.17, -447.34, 35.91), 1, 5.0, {
        name="hayes_autos_craft",
        heading=35,
        --debugPoly=false,
        minZ=33.11,
        maxZ=37.11
    })
    -- Hayes Autos | End --

    -- Ottos Autos | Start --
    exports["rd-polyzone"]:AddBoxZone("ottos_auto_stash", vector3(836.478, -813.7635, 26.35), 2, 3.0, {
        name="ottos_auto_stash",
        heading=270,
        --debugPoly=false,
        minZ=23.33,
        maxZ=27.33
    })

    exports["rd-polyzone"]:AddBoxZone("ottos_auto_craft", vector3(836.1036, -819.1221, 26.33258), 2, 3.6, {
        name="ottos_auto_craft",
        heading=0,
        --debugPoly=false,
        minZ=24.33,
        maxZ=28.33
    })
    -- Ottos Autos | End --

    -- Tuner Shop | Start --
    exports["rd-polyzone"]:AddBoxZone("auto_exotics_stash", vector3(547.22, -182.99, 54.49), 5.0, 1, {
        name="auto_exotics_stash",
        heading=0,
        debugPoly=false,
        minZ=51.84,
        maxZ=55.84
    })

    exports["rd-polyzone"]:AddBoxZone("auto_exotics_craft", vector3(546.55, -166.74, 54.49), 5.0, 1, {
        name="auto_exotics_craft",
        heading=270,
        --debugPoly=false,
        minZ=51.84,
        maxZ=55.84
    })
    -- Tuner Shop | End --
end)

local Auto_Exotic_Craft = false
local Auto_Exotic_Stash = false

RegisterNetEvent('rd-polyzone:enter')
AddEventHandler('rd-polyzone:enter', function(name)
    if name == "auto_exotics_craft" then
        Auto_Exotic_Craft = true     
        AutoExoticCraft()
        local isEmployed = exports["rd-business"]:IsEmployedAt("auto_exotics")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Craft")
        end
    elseif name == "auto_exotics_stash" then
        Auto_Exotic_Stash = true
        AutoExoticStash()
        local isEmployed = exports["rd-business"]:IsEmployedAt("auto_exotics")
        if isEmployed then
            exports['rd-ui']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('rd-polyzone:exit')
AddEventHandler('rd-polyzone:exit', function(name)
    if name == "auto_exotics_craft" then
        Auto_Exotic_Craft = false
        exports['rd-ui']:hideInteraction()
    elseif name == "auto_exotics_stash" then
        Auto_Exotic_Stash = false
        exports['rd-ui']:hideInteraction()
    end
end)

function AutoExoticCraft()
	Citizen.CreateThread(function()
        while Auto_Exotic_Craft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("auto_exotics")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '28', 'Craft')
                end
			end
		end
	end)
end

function AutoExoticStash()
	Citizen.CreateThread(function()
        while Auto_Exotic_Stash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["rd-business"]:IsEmployedAt("auto_exotics")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '1', 'auto-exotic-stash')
                end
			end
		end
	end)
end