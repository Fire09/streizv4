local usingAnimProp, currentAnimProp = false, nil

local naturalMaterials = {
    GetHashKey('ROCK_9'),
    GetHashKey('ROCK_MOSSY_10'),
    GetHashKey('STONE_11'),
    GetHashKey('COBBLESTONE_12'),
    GetHashKey('SANDSTONE_SOLID_16'),
    GetHashKey('SANDSTONE_BRITTLE_17'),
    GetHashKey('SAND_LOOSE_18'),
    GetHashKey('SAND_COMPACT_19'),
    GetHashKey('SAND_WET_20'),
    GetHashKey('SAND_TRACK_21'),
    GetHashKey('SAND_DRY_DEEP_23'),
    GetHashKey('SAND_WET_DEEP_24'),
    GetHashKey('ICE_24'),
    GetHashKey('SNOW_LOOSE_26'),
    GetHashKey('SNOW_COMPACT_27'),
    GetHashKey('SNOW_DEEP_28'),
    GetHashKey('GRAVEL_SMALL_31'),
    GetHashKey('GRAVEL_LARGE_32'),
    GetHashKey('GRAVEL_DEEP_33'),
    GetHashKey('DIRT_TRACK_35'),
    GetHashKey('MUD_HARD_36'),
    GetHashKey('MUD_SOFT_38'),
    GetHashKey('MUD_DEEP_40'),
    GetHashKey('MARSH_41'),
    GetHashKey('MARSH_DEEP_42'),
    GetHashKey('SOIL_43'),
    GetHashKey('CLAY_HARD_44'),
    GetHashKey('CLAY_SOFT_45'),
    GetHashKey('GRASS_LONG_46'),
    GetHashKey('GRASS_47'),
    GetHashKey('GRASS_SHORT_48'),
}

local function benchHandler(pBenchType)
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, true) then
        return false
    end

    if IsPedArmed(ped, 7) then
        SetCurrentPedWeapon(ped, 0xA2719263, true)
    end

    if IsEntityPlayingAnim(ped, animDict, animation, 3) then
        ClearPedSecondaryTask(ped)
    else
        local pos = GetEntityCoords(ped)
        TaskStartScenarioAtPosition(
                    ped,
                    'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER',
                    pos.x + 0.0,
                    pos.y + 0.0,
                    pos.z - 0.5,
                    GetEntityHeading(ped),
                    0,
                    true,
                    true
                )
        TriggerEvent("destroyProp")
        usingAnimProp = true
    end
    Wait(500)
    local benchTypeToAttach = {
        ['wood'] = 'woodbench',
        ['stone'] = 'stonebench',
        ['metal'] = 'metalbench',
    }
    TriggerEvent("attachItem", benchTypeToAttach[pBenchType])
end

local benchTypeToObject = {
    ['wood'] = 'prop_bench_04',
    ['stone'] = 'prop_ld_bench01',
    ['metal'] = 'prop_snow_bench_01',
}

local benchModelToItem = {
    [`prop_bench_04`] = 'woodbench2',
    [`prop_ld_bench01`] = 'stonebench2',
    [`prop_snow_bench_01`] = 'metalbench2',
}

local function benchObjectHandler(pBenchType, pItem)
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, true) then
        return false
    end

    if IsPedArmed(ped, 7) then
        SetCurrentPedWeapon(ped, 0xA2719263, true)
    end

    local id = exports['rd-objects']:PlaceAndSaveObject(
        benchTypeToObject[pBenchType],
        { isPlacedBench = true },
        {
            collision = true,
            adjustZ = true,
            colZOffset = 0.5,
        },
        function (coords, materialHash, entity)
            return true
        end,
        'objects',
        60 * 10
    )
    if not id then
        return false
    end
    TriggerEvent('inventory:removeItem', pItem, 1)
    return false
end

local itemHandlers = {
    ['lawnchair'] = function(info)
        local animDict = "timetable@reunited@ig_10"
        local animation = "base_amanda"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 1, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "lawnchair")
        return true
    end,
    ['lawnchair2'] = function(info)
        local animDict = "timetable@ron@ig_3_couch"
        local animation = "base"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 1, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "lawnchair2")
        return true
    end,
    ['pailshovel'] = function(info)
        local validSand = {
            [-1595148316] = true,
            [1288448767] = true,
        }
        local sandcastles = {
            `prop_beach_sandcas_01`,
            `prop_beach_sandcas_03`,
            `prop_beach_sandcas_04`,
            `prop_beach_sandcas_05`,
        }

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        local offsetCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 1.5, 0)
        local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(offsetCoords.x, offsetCoords.y, offsetCoords.z, offsetCoords.x, offsetCoords.y, offsetCoords.z - 2, 1, 0, 4)
        local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
        if not hit then return end
        if not validSand[materialHash] then return end

        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
        local finished = exports["rd-taskbar"]:taskBar(15000, "Building Sandcastle", false, true, false, false, nil, 5.0, ped)
        ClearPedTasks(ped)
        if finished == 100 then
            local sandcastle = sandcastles[math.random(1, #sandcastles)]
            RequestModel(sandcastle)
            while not HasModelLoaded(sandcastle) do
                Wait(0)
            end
            local obj = CreateObject(sandcastle, endCoords, true, false, false)
            SetTimeout(120000, function()
                SetEntityAsMissionEntity(obj, true, true)
                Sync.DeleteObject(obj)
            end)
        end
        return false
    end,
    ['stopsign'] = function(info)
        local animDict = "amb@world_human_janitor@male@base"
        local animation = "base"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "stopsign")
        return true, animDict, animation
    end,
    ['black_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "black_guitar")
        return true, animDict, animation
    end,
    ['puppers_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "puppers_guitar")
        return true, animDict, animation
    end,
    ['abstract_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "abstract_guitar")
        return true, animDict, animation
    end,
    ['purple_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "purple_guitar")
        return true, animDict, animation
    end,
    ['green_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "green_guitar")
        return true, animDict, animation
    end,
    ['white_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "white_guitar")
        return true, animDict, animation
    end,
    ['pink_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "pink_guitar")
        return true, animDict, animation
    end,
    ['dark_red_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "dark_red_guitar")
        return true, animDict, animation
    end,
    ['hubcaps_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "hubcaps_guitar")
        return true, animDict, animation
    end,
    ['anime_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "anime_guitar")
        return true, animDict, animation
    end,
    ['yellow_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "yellow_guitar")
        return true, animDict, animation
    end,
    ['blue_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "blue_guitar")
        return true, animDict, animation
    end,
    ['acoustic_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "acoustic_guitar")
        return true, animDict, animation
    end,
    ['roots_acoustic_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "roots_acoustic_guitar")
        return true, animDict, animation
    end,
    ['cross_acoustic_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "cross_acoustic_guitar")
        return true, animDict, animation
    end,
    ['black_acoustic_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "black_acoustic_guitar")
        return true, animDict, animation
    end,
    ['washed_acoustic_guitar'] = function(info)
        local animDict = "amb@world_human_musician@guitar@male@idle_a"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
        end
        TriggerEvent("attachItem", "washed_acoustic_guitar")
        return true, animDict, animation
    end,
    ['woodbench'] = function(info)
        return benchHandler('wood')
    end,
    ['stonebench'] = function(info)
        return benchHandler('stone')
    end,
    ['metalbench'] = function(info)
        return benchHandler('metal')
    end,
    ['metalbench2'] = function(info)
        return benchObjectHandler('metal', 'metalbench2')
    end,
    ['woodbench2'] = function(info)
        return benchObjectHandler('wood', 'woodbench2')
    end,
    ['stonebench2'] = function(info)
        return benchObjectHandler('stone', 'stonebench2')
    end,
    ['tent'] = function(info)
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        local tents = {
            "prop_skid_tent_01",
            "prop_skid_tent_03"
        }
        local id = exports['rd-objects']:PlaceAndSaveObject(
            tents[math.random(1, #tents)],
            { isTent = true },
            {
                forceGroundSnap = true,
                zOffset = -0.915,
            },
            function (coords, materialHash, entity)
                for _,material in ipairs(naturalMaterials) do
                    if materialHash == material then
                        return true
                    end
                end
                return false
            end
        )
        if not id then
            return false
        end
        TriggerEvent('inventory:removeItem', 'tent', 1)
        return false
    end,
    ['letterbox'] = function(info)
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end
        --get user's properties
        local properties = exports['rd-housing']:getHousingData()

        local cid = exports['isPed']:isPed('cid')
        local _, employment  = RPC.execute("GetEmploymentInformation", cid)
        print(employment.business_id)
       -- print("BUSINNES", employment.business_id, employment.business_name)
        local elements = {}
        local propertyOptions = {}
        for _,property in pairs(properties) do
            propertyOptions[#propertyOptions+1] = {
                name=property.name,
                id=property.id
            }
        end
        elements[#elements+1] = {
            _type='select',
            name='property',
            label='Select Property',
            options=propertyOptions
        }
        local businessOptions = {}
        for _,business in pairs(employment) do
            businessOptions[#businessOptions+1] = {
                name=business.business_name,
                id=business.business_id
            }
        end
        elements[#elements+1] = {
            _type='select',
            name='business',
            label='Select Business',
            options=businessOptions
        }

        local foundInfo
        local checkCoords
        local mailType
        local name
        if elements then
            local prompt2 = exports['rd-ui']:OpenInputMenu(elements)
            if not prompt2 then
                return false
            end
            if prompt2.business then
                mailType = 'business'
            elseif prompt2.property then
                mailType = 'property'
            end
            local plyCoords = GetEntityCoords(PlayerPedId())
            if mailType == 'property' then
                local housingTable = exports['rd-housing']:retriveHousingTable()
                local property = housingTable[prompt2.property]
                foundInfo = prompt2.property
                name = property.Street
                checkCoords = vector3(property[1].x, property[1].y, property[1].z)
                if #(checkCoords - plyCoords) > 50.0 then
                    TriggerEvent('DoLongHudText', 'Too far away from property.', 2)
                    return
                end
            elseif mailType == 'business' then
                local selectedBusinessCode
                for _,business in pairs(employment) do
                    if business.id == prompt2.business then
                        foundInfo = business.code
                        selectedBusinessCode = business.code
                        name = business.name
                        break
                    end
                end
                if selectedBusinessCode == nil then
                    TriggerEvent('DoLongHudText', 'Invalid business.', 2)
                    return false
                end

                local objects = exports["rd-objects"]:GetVisibleObjects("objects")
                local isStashCloseEnough = false
                for i, v in ipairs(objects) do
                    if v.data and v.data.metadata then
                        if v.data.metadata.storageSize ~= nil and
                           v.data.metadata.businessCode == selectedBusinessCode and
                           #(vector3(v.x, v.y, v.z) - plyCoords) < 75.0
                        then
                            isStashCloseEnough = true
                            break
                        end
                    end
                end

                if not isStashCloseEnough then
                    TriggerEvent('DoLongHudText', 'No stash found that is close enough.', 2)
                    return false
                end
            end
        end

        local models = {
            "prop_letterbox_01",
            "prop_letterbox_02",
            "prop_letterbox_03",
        }

        local model = models[math.random(1, #models)]
        local results = exports['rd-objects']:PlaceObject(
            model,
            {
                forceGroundSnap = true,
                zOffset = -0.05,
            },
            function (coords, materialHash, entity)
                local roll = GetEntityRoll(entity)
                local pitch = GetEntityPitch(entity)
                local dist = checkCoords and #(GetEntityCoords(entity) - checkCoords) or 0
                local onRoad = IsPointOnRoad(coords.x, coords.y, coords.z)
                return roll < 25.0 and roll > -25.0 and pitch < 25.0 and pitch > -25.0 and dist < 35.0 and not onRoad
            end
        )
        if not results[1] then
            return false
        end

        local objId = RPC.execute('rd-usableprops:placeLetterbox', model, results[2].coords, results[2].rotation, mailType, foundInfo, name)
        if objId then
            TriggerEvent('inventory:removeItem', 'letterbox', 1)
        end
        return false
    end,
    ['storesign'] = function(info)
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end
        --get user's properties
        local properties = exports['rd-housing']:getHousingData()

        local elements = {}
        local propertyOptions = {}
        for _,property in pairs(properties) do
            if property.cat == 'shop' then
                propertyOptions[#propertyOptions+1] = {
                    name=property.name,
                    id=property.id
                }
            end
        end
        elements[#elements+1] = {
            _type='select',
            name='property',
            label='Select Property',
            options=propertyOptions
        }
        
        local foundInfo
        local checkCoords
        local name
        if elements then
            local prompt2 = exports['rd-ui']:OpenInputMenu(elements)
            if not prompt2 then
                return false
            end

            local plyCoords = GetEntityCoords(PlayerPedId())

            local housingTable = exports['rd-housing']:retriveHousingTable()
            local property = housingTable[prompt2.property]
            foundInfo = prompt2.property
            name = property.Street
            checkCoords = vector3(property[1].x, property[1].y, property[1].z)
            if #(checkCoords - plyCoords) > 50.0 then
                TriggerEvent('DoLongHudText', 'Too far away from property.', 2)
                return
            end
            
        end

        local model = "np_sfsign_open"
        local results = exports['rd-objects']:PlaceObject(
            model,
            {
                forceGroundSnap = true,
                zOffset = -0.05,
            },
            function (coords, materialHash, entity)
                local roll = GetEntityRoll(entity)
                local pitch = GetEntityPitch(entity)
                local dist = checkCoords and #(GetEntityCoords(entity) - checkCoords) or 0
                local onRoad = IsPointOnRoad(coords.x, coords.y, coords.z)
                return roll < 25.0 and roll > -25.0 and pitch < 25.0 and pitch > -25.0 and dist < 35.0 and not onRoad
            end
        )
        if not results[1] then
            return false
        end

        local objId = RPC.execute('rd-usableprops:placeStoreSign', model, results[2].coords, results[2].rotation, foundInfo, name)
        if objId then
            TriggerEvent('inventory:removeItem', 'storesign', 1)
        end
        return false
    end,
    ['phonebomb'] = function(info)
        local target = exports['rd-target']:GetCurrentEntity()

        if not target or target == 0 then
            local prop = GetHashKey('prop_bomb_01')
            -- Place as an object
            local result = exports['rd-objects']:PlaceObject(prop, {
                forceGroundSnap = true,
                distance = 3.0,
            })
            if not result or not result[1] then
                return
            end
            local meta = json.decode(info)
            RPC.execute('rd-usableprops:plantPhoneBombProp', meta, prop, result[2].coords, result[2].rotation)
            return
        end

        if not IsEntityAVehicle(target) then
            TriggerEvent('DoLongHudText', 'Can only be placed on vehicles.', 2)
            return
        end

        local ped = PlayerPedId()
        TriggerEvent('animation:cancel')
        TriggerEvent('animation:PlayAnimation', 'mechanic4')
        local finished = exports['rd-taskbar']:taskBar(20000, 'Placing Device', false, true, false, false, nil, 3.0, PlayerPedId())
        ClearPedTasks(ped)
        if finished == 100 and exports['rd-inventory']:hasEnoughOfItem('phonebomb', 1, false, true) then
            local meta = json.decode(info)
            RPC.execute('rd-usableprops:plantPhoneBomb', NetworkGetNetworkIdFromEntity(target), meta)
        end
    end,
    ['movementsensor'] = function(info)
        local prop = GetHashKey('prop_prototype_minibomb')
        local length = 0.0
        local result = exports['rd-objects']:PlaceObject(prop, {
            distance = 3.0,
            alignToSurface = true,
            surfaceOffset = 0.025
        }, function(pCoords, pMaterial, pEntity)
            local forward = GetOffsetFromEntityInWorldCoords(pEntity, 0.0, -3.5, 0.0)
            DrawLine(pCoords.x, pCoords.y, pCoords.z, forward.x, forward.y, forward.z, 0, 255, 0, 255)
            local raycast = StartExpensiveSynchronousShapeTestLosProbe(pCoords.x, pCoords.y, pCoords.z, forward.x, forward.y, forward.z, 17, pEntity, 4)
            local _,hit,endCoords, _, _ = GetShapeTestResult(raycast)
            if hit and endCoords ~= vector3(0,0,0) then
                length = #(endCoords - vector3(pCoords.x, pCoords.y, pCoords.z))
                print(length)
            else
                length = 3.5
            end
            return true
        end)
        if not result or not result[1] then
            return
        end
        local ped = PlayerPedId()

        local prompt = exports['rd-ui']:OpenInputMenu({
            {
                label = 'Enter Name',
                icon = 'pencil-alt',
                name = 'name',
            }
        }, function(values)
            return values.name and values.name:len() > 0
        end)
        if not prompt then return end

        TriggerEvent('animation:cancel')
        TaskGoStraightToCoord(ped, result[2].coords.x, result[2].coords.y, result[2].coords.z, 1.0, -1, result[2].rotation.z, 1.0)
        Wait(1000)
        TriggerEvent('animation:PlayAnimation', 'mechanic4')
        local finished = exports['rd-taskbar']:taskBar(7500, 'Placing Device', false, true, false, false, nil, 3.0, PlayerPedId())
        ClearPedTasks(ped)
        if finished == 100 and exports['rd-inventory']:hasEnoughOfItem('movementsensor', 1, false, true) then
            RPC.execute('rd-usableprops:placeMovementSensor', prop, result[2].coords, result[2].rotation, prompt.name, length)
        end
    end,
    ['bugsweeper'] = function(info)
        for i = 1, 5 do
            PlaySound(-1, '5_SEC_WARNING', 'HUD_MINI_GAME_SOUNDSET', false, 0, true)
            Wait(500)
        end
        PlaySound(-1, 'On_Call_Player_Join', 'DLC_HEISTS_GENERAL_FRONTEND_SOUNDS', false, 0, true)
        local tech = RPC.execute("rd-usableprops:getNearbyTech")
        if not tech or #tech == 0 then
            TriggerEvent('DoLongHudText', 'Nothing found...', 2)
            return
        end

        local context = {}
        for _,entry in pairs(tech) do
            context[#context+1] = {
                title = entry.descriptor,
                description = 'Distance: ' .. entry.distance .. 'm',
            }
        end

        exports['rd-ui']:showContextMenu(context)
        return false
    end,
    ['cryptominer'] = function(info, invName, itemSlot)
        RPC.execute("rd-usableprops:checkCryptoMiner", info, itemSlot)
        return false
    end,
    ['npolaroid_camera2'] = function(info)
        local animDict = "anim@mp_player_intupperphotography"
        local animation = "idle_a"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
            usingAnimProp = false
        else
            TaskPlayAnim(ped, animDict, animation, 8.0, -8, -1, 49, 0, false, false, false)
            TriggerEvent("destroyProp")
            TriggerEvent("attachItem", "npolaroid_camera")
            STX.Events.emit('rd-polaroid-capture:camera:start')
            usingAnimProp = true
        end
        return true, animDict, animation
    end,
    ['pride_flag'] = function(info)
        return UsePrideFlag(info)
    end,
    ['grandfatherclock'] = function(info)
        local results = exports['rd-objects']:PlaceObject(
            `vw_prop_vw_valet_01a`,
            {
                forceGroundSnap = true,
            },
            function (coords, materialHash, entity)
                local roll = GetEntityRoll(entity)
                local pitch = GetEntityPitch(entity)
                local dist = checkCoords and #(GetEntityCoords(entity) - checkCoords) or 0
                local onRoad = IsPointOnRoad(coords.x, coords.y, coords.z)
                return roll < 25.0 and roll > -25.0 and pitch < 25.0 and pitch > -25.0 and dist < 35.0 and not onRoad
            end
        )
        if not results[1] then
            return false
        end

        local coords = {
            x = results[2].coords.x,
            y = results[2].coords.y,
            z = results[2].coords.z
        }
        local clockCoords = GetObjectOffsetFromCoords(coords.x + 0.0, coords.y + 0.0, coords.z + 0.0, results[2].rotation.z + 0.0, 0.0, 0.3, 0.95)

        local objId = RPC.execute('rd-usableprops:placeClock', results[2].coords, results[2].rotation, clockCoords)
        if objId then
            TriggerEvent('inventory:removeItem', 'grandfatherclock', 1)
        end
        return false
    end,
    ['sstrident'] = function(info)
        local animDict = "amb@world_human_janitor@male@base"
        local animation = "base"

        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, true) then
            return false
        end

        if IsPedArmed(ped, 7) then
            SetCurrentPedWeapon(ped, 0xA2719263, true)
        end

        LoadAnimDict(animDict)

        if IsEntityPlayingAnim(ped, animDict, animation, 3) then
            ClearPedSecondaryTask(ped)
        else
            local animLength = GetAnimDuration(animDict, animation)
            TaskPlayAnim(ped, animDict, animation, 1.0, 1.0, animLength, 49, 0, 0, 0, 0)
            TriggerEvent("destroyProp")
            usingAnimProp = true
            TriggerServerEvent("fx:trident")
        end
        TriggerEvent("attachItem", "sstrident")
        return true, animDict, animation
    end,
}

AddEventHandler('animation:gotCanceled', function()
    if usingAnimProp then
        handleStopUsingProp()
        usingAnimProp = false
    end
end)

function handleStopUsingProp()
    if currentAnimProp ~= nil and currentAnimProp == "npolaroid_camera" then
        STX.Events.emit('rd-polaroid-capture:camera:stop')
        currentAnimProp = nil
    end
end

AddEventHandler('rd-inventory:itemUsed', function(item, info, invName, itemSlot)
    if itemHandlers[item] then
        local doPropCheck, animDict, anim = itemHandlers[item](info, invName, itemSlot)
        if doPropCheck then
            currentAnimProp = item
            Citizen.CreateThread(function(x)
                while usingAnimProp do
                    Wait(1000)
                    if (not animDict and not IsUsingSittingAnimation()) or (animDict and not IsEntityPlayingAnim(PlayerPedId(), animDict, anim, 3)) or IsPedInAnyVehicle(PlayerPedId(), true) then
                        usingAnimProp = false
                        handleStopUsingProp()
                        ClearPedSecondaryTask(PlayerPedId())
                        TriggerEvent("destroyProp")
                    end
                end
            end)
        end
    end
end)

function IsUsingSittingAnimation()
    local sittingAnims = {
        {"timetable@ron@ig_5_p3", "ig_5_p3_base"},
        {"timetable@reunited@ig_10", "base_amanda"},
        {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy"},
        {"timetable@maid@couch@", "base"},
        {"timetable@ron@ig_3_couch", "base"}
    }
    local player = PlayerPedId()
    local isSitting = false
    for _,anims in ipairs(sittingAnims) do
        if IsEntityPlayingAnim(player, anims[1], anims[2], 3) then
            isSitting = true
        end
    end
    return isSitting
end

local function getMailboxInfo(pEntity)
    local object = exports['rd-objects']:GetObjectByEntity(pEntity)
    if not object then
        return false
    end

    local mailType = object.data.metadata.type
    if not mailType then
        return false
    end

    return object.data.metadata.id, mailType, object
end

local function isPD()
    local job = exports["rd-base"]:getModule("LocalPlayer"):getVar("job")
    return job == 'police' or job == 'judge'
end

local deletedObjects = {}
local PaidMeters = {}

Citizen.CreateThread(function()
    exports["rd-interact"]:AddPeekEntryByModel({ `prop_sign_road_01a` }, {{
        event = "rd-usableprops:stealStopSign",
        id = "rd-usableprops:stealStopSign",
        icon = "hammer",
        label = "Steal!",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
          return deletedObjects[pEntity] == nil
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ 2108567945, -1940238623 }, {{
        event = "rd-usableprops:payParkingMeter",
        id = "rd-usableprops:parking_pay",
        icon = "dollar-sign",
        label = "pay for meter ($5)",
        parameters = { price = 5 },
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
          return PaidMeters[pEntity] == nil
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `prop_skid_tent_01`, `prop_skid_tent_03` }, {{
        event = "rd-usableprops:pickupTent",
        id = "rd-usableprops:pickup_tent",
        icon = "arrow-up",
        label = "pickup tent",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
          return exports['rd-objects']:GetObjectByEntity(pEntity) ~= nil
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `prop_bench_04`, `prop_ld_bench01`, `prop_snow_bench_01` }, {{
        event = "rd-usableprops:pickupBench",
        id = "rd-usableprops:pickup_bench",
        icon = "arrow-up",
        label = "pickup bench",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity, pContext)
          return pContext.meta and pContext.meta.data.metadata and pContext.meta.data.metadata.isPlacedBench
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `prop_letterbox_01`, `prop_letterbox_02`, `prop_letterbox_03`, `prop_letterbox_04`, `prop_postbox_01a` }, {{
        event = "rd-usableprops:openMail",
        id = "rd-usableprops:open_mailbox",
        icon = "envelope",
        label = "deposit mail",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
            local info = getMailboxInfo(pEntity)
            return info
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({`np_sfsign_open`, `np_sfsign_closed` }, {{
        event = "rd-usableprops:switchSign",
        id = "rd-usableprops:switch_sign",
        icon = "hammer",
        label = "Switch Sign",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
            local object = exports['rd-objects']:GetObjectByEntity(pEntity)
            if not object then
                return false
            end
            return exports['rd-housing']:hasPropertyAccess(object.data.metadata.id, true)
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({`np_sfsign_open`, `np_sfsign_closed` }, {{
        event = "rd-usableprops:removeStoreSign",
        id = "rd-usableprops:remove_sign",
        icon = "arrow-up",
        label = "Remove Sign",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
            local object = exports['rd-objects']:GetObjectByEntity(pEntity)
            if not object then
                return false
            end
            return exports['rd-housing']:hasPropertyAccess(object.data.metadata.id, true)
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `prop_letterbox_01`, `prop_letterbox_02`, `prop_letterbox_03`, `prop_postbox_01a` }, {{
        event = "rd-usableprops:checkMail",
        id = "rd-usableprops:check_mailbox",
        icon = "envelope-open",
        label = "check mail",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
            local info, mailType = getMailboxInfo(pEntity)
            local job = exports['isPed']:isPed('myjob')
            return (mailType == 'business' and (exports['rd-business']:HasPermission(info, 'stash_access') or isPD())) or
            (mailType == 'property' and exports['rd-housing']:hasPropertyAccess(info, true)) or
            (mailType == 'mrpd' and isPD()) or
            (mailType == 'pillbox' and (job == 'ems' or job == 'doctor'))
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `prop_letterbox_01`, `prop_letterbox_02`, `prop_letterbox_03` }, {{
        event = "rd-usableprops:removeMailbox",
        id = "rd-usableprops:remove_mailbox",
        icon = "trash-alt",
        label = "remove mailbox",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity)
            local info, mailType = getMailboxInfo(pEntity)
            return mailType == 'business' and (exports['rd-business']:HasPermission(info, 'stash_access')) or
            (mailType == 'property' and exports['rd-housing']:hasPropertyAccess(info, false))
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `prop_prototype_minibomb` }, {{
        event = "rd-usableprops:hackSensor",
        id = "rd-usableprops:hackSensor",
        icon = "laptop",
        label = "hack",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity, pContext)
          return pContext.meta and pContext.meta.data.metadata.sensor
        end,
    })

    exports["rd-interact"]:AddPeekEntryByModel({ `vw_prop_vw_valet_01a` }, {{
        event = "rd-usableprops:pickupClock",
        id = "rd-usableprops:pickup_clock",
        icon = "arrow-up",
        label = "pickup",
        parameters = {},
    }}, {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity, pContext)
          return pContext.meta and pContext.meta.data.metadata and pContext.meta.data.metadata.isPlacedClock
        end,
    })

   -- STX.Procedures.execute('rd-datagrid:subscribe', 'storesigns')
   -- STX.Procedures.execute('rd-datagrid:subscribe', 'mailboxes')
   -- STX.Procedures.execute('rd-datagrid:subscribe', 'tech')
end)

AddEventHandler("rd-usableprops:stealStopSign", function(pArgs, pEntity, pContext)
    LoadAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    local ped = PlayerPedId()
    TaskPlayAnim(ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, -8.0, -1, 1, 0, false, false, false)
    local finished = exports["rd-taskbar"]:taskBar(15000, "Stealing", false, true, false, false, nil, 5.0, ped)
    ClearPedTasks(ped)
    if finished == 100 then
        local playerCoords = GetEntityCoords(ped, true)
        DeleteEntityAtCoords(-949234773, playerCoords)
        TriggerEvent("player:receiveItem", "stopsign", 1)
    end
end)

function DeleteEntityAtCoords(pModel, pCoords)
    local object = GetClosestObjectOfType(pCoords, 1.0, pModel, false, false, false)
    if DoesEntityExist(object) then
        SetEntityAsMissionEntity(object, true, true)
        DeleteEntity(object)
        deletedObjects[object] = true
    end
end

RegisterNetEvent("rd-usableprops:deleteEntity", DeleteEntityAtCoords)

function LoadAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        local timeout = false

        RequestAnimDict(animDict)

        Citizen.SetTimeout(5000, function()
            timeout = true
        end)

        while not HasAnimDictLoaded(animDict) and not timeout do
            Citizen.Wait(0)
        end
    end
end

AddEventHandler("rd-usableprops:payParkingMeter", function(args, entity, context)
    PaidMeters[entity] = true
    local success = RPC.execute('rd-usableprops:payParkingMeter', args.price)
    if success then
        local pos = GetEntityCoords(entity)
        TriggerServerEvent("rd-scenes:addScene", {
            coords = vector3(pos.x, pos.y, pos.z + 1.0),
            offsetCoords = vector3(pos.x, pos.y, pos.z),
            skipLosCheck = true,
            text = '$ PAID',
            distance = 3.0,
            color = 'green',
            caret = true,
            font = 4,
            solid = false,
            background = {
              r = 80,
              g = 80,
              b = 80,
              alpha = 155
            }
          })
    end
end)

AddEventHandler("rd-usableprops:pickupTent", function(args, entity, context)
    local tent = exports['rd-objects']:GetObjectByEntity(entity)
    if tent then
        local success = exports['rd-objects']:DeleteObject(tent.id)
        if success then
            TriggerEvent("player:receiveItem", "tent", 1)
        end
    end
end)

AddEventHandler("rd-usableprops:pickupBench", function(args, entity, context)
    local bench = exports['rd-objects']:GetObjectByEntity(entity)
    if bench then
        local success = exports['rd-objects']:DeleteObject(bench.id)
        if success then
            TriggerEvent("player:receiveItem", benchModelToItem[bench.data.model], 1)
        end
    end
end)

AddEventHandler("rd-usableprops:switchSign", function(args, entity, context)
    local model = 'np_sfsign_open'
    if context.model == 2037823845 then
        model = 'np_sfsign_closed'
    end
    local objId = context.meta.id
    
    RPC.execute('rd-usableprops:swapStoreSign', model, objId)
    
end)

AddEventHandler('rd-usableprops:removeStoreSign', function(args, entity, context)
    TriggerEvent("animation:PlayAnimation","mechanic3")
    local finished = exports['rd-taskbar']:taskBar(15000, "Removing Store Sign", false, true, false, false, nil, 5.0, PlayerPedId())
    ClearPedTasks(PlayerPedId())
    if finished == 100 then
        local obj = exports['rd-objects']:GetObjectByEntity(entity)
        if not obj then
            return
        end
        exports["rd-objects"]:DeleteObject(obj.id)
    end
end)

local waitForClose = false
local closeData = {}
AddEventHandler("rd-usableprops:openMail", function(args, entity, context)
    local info, mailType, object = getMailboxInfo(entity)
    waitForClose = RPC.execute('rd-usableprops:openMailbox', info, mailType, object.id)
    if waitForClose then
        closeData = {
            info = info,
            mailType = mailType,
            objId = object.id
        }
    end
end)

AddEventHandler("rd-usableprops:checkMail", function(args, entity, context)
    if isPD() and mailType == 'business' then
        local prompt = exports['rd-ui']:OpenInputMenu({
            { label = "Auth Code", name = "password", type = "password" },
        }, function(values)
            return values.password and values.password:len() > 0
        end)
        if not prompt then return end
    end
    local info, mailType, object = getMailboxInfo(entity)
    RPC.execute('rd-usableprops:checkMailbox', info, mailType, object.id)
end)

AddEventHandler('rd-inventory:closed', function(pName)
    if waitForClose and pName == 'mailtemp:' .. closeData.mailType .. ':' .. closeData.objId then
        RPC.execute('rd-usableprops:closeMailbox', closeData.info, closeData.mailType, closeData.objId)
        waitForClose = false
        closeData = {}
    end
end)

AddEventHandler('rd-usableprops:removeMailbox', function(args, entity, context)
    TriggerEvent("animation:PlayAnimation","mechanic3")
    local finished = exports['rd-taskbar']:taskBar(15000, "Removing mailbox", false, true, false, false, nil, 5.0, PlayerPedId())
    ClearPedTasks(PlayerPedId())
    if finished == 100 then
        local obj = exports['rd-objects']:GetObjectByEntity(entity)
        if not obj then
            return
        end
        exports["rd-objects"]:DeleteObject(obj.id)
    end
end)

AddEventHandler('rd-objects:objectCreated', function(pObject, handle)
    if pObject.data.metadata.mail then
        FreezeEntityPosition(handle, false)
    end

    if pObject.data.metadata.sensor then
        SensorCreated(pObject, handle)
    end
end)

AddEventHandler('rd-objects:objectDeleted', function(pObject, handle)
    if pObject.data.metadata.sensor then
        SensorRemoved(pObject, handle)
    end
end)

AddEventHandler("rd-usableprops:pickupClock", function(args, entity, context)
    local clock = exports['rd-objects']:GetObjectByEntity(entity)
    if clock then
        local success = exports['rd-objects']:DeleteObject(clock.id)
        exports['rd-objects']:DeleteObject(clock.data.metadata.linkedObject)
        if success then
            TriggerEvent("player:receiveItem", 'grandfatherclock', 1)
        end
    end
end)

-- AddEventHandler('rd-spawn:characterSpawned', function(pCharacterId)
   -- RPC.execute('rd-usableprops:checkMailAlerts', pCharacterId)
-- end)

function map_range(s, a1, a2, b1, b2)
    return b1 + (s - a1) * (b2 - b1) / (a2 - a1)
end
