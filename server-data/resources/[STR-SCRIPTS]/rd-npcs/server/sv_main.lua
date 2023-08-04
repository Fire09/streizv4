-- function name should be lowercase but np devs are dumb
function getPedsWithRandomSpawnPoints()
    local peds = 0

    for i in pairs(Generic.NPCS) do
        if Generic.NPCS[i].position.random then
            peds = peds + 1
        end
    end

    return peds
end

RegisterServerEvent("rd-npcs:location:fetch")
AddEventHandler("rd-npcs:location:fetch", function()    
    -- Peds with random locations
    if #Generic.SpawnLocations < getPedsWithRandomSpawnPoints() then print("^3[STX][NPCS]^7 There are more NPC's than spawnPoints...") return end
    for _, npc in ipairs(Generic.NPCS) do
        if Generic.NPCS[_].position.random then
            Generic.NPCS[_].position.coords = Generic.SpawnLocations[_].xyz
            Generic.NPCS[_].position.heading = Generic.SpawnLocations[_].w
            print(("^3[STX][NPCS]^7 Spawned Random \"^2%s^7\" : \"^4%s, %s, %s^7\""):format(npc.id, Generic.NPCS[_].position.coords.x, Generic.NPCS[_].position.coords.y, Generic.NPCS[_].position.coords.z))
        end
    end

    -- Peds
    GenerateShopKeepers()
    GenerateLiqourKeeper()
    GeneratePaintballVendors()
    GenerateGolfVendors()
    GeneratePaintballSignUp()
    GenerateArenaVendors()
    GenerateArenaGrassSwapper()
    GenerateCasinoInteriorSwaps()
    GenerateSionisMaterials()
    GenerateGalleryInteriorSwaps()
   -- GenerateMiningVendors()
    if isPublic then
        GenerateWeedShopKeepers()
        GenerateJobVehicleNPCs()
    end
    GenerateHOImportVendors()
    GenerateHOImportDriftVendors()
    GenerateCGJewelryVendors()
    GenerateSportShopKeepers()
    GenerateDwDropoffNpcs()
    GenerateDwAdminNpc()
    GenerateDwBumperNpc()
    GeneratePCAGraderNpcs()
    GenerateCasinoHotelVendors()
    GenerateXCoinRedeem()
    GenerateGangSprayVendors()
    GenerateHNOVendors()
    GenerateCasinoMembershipGiver()
    GenerateCasinoRestRoom()
    GenerateCasinoRestRoom2()
    GenerateCasinoJewelStore()
    GenerateCasinoChipSeller()
    GenerateCasinoWheelSpinNpc()
    GenerateCasinoDrinkGiver()
    GenerateWeaponShopKeepers()
    GenerateToolShopKeepers()
    GenerateGemShopLocations()
    GenerateFarmersMarketCraftLocations()
    GenerateFactoryShopLocations()
    GenerateWineryBuyLocations()
    GenerateBennysNPC()
    GeneratePublicLicenseKeepersMale()
    GeneratePublicLicenseKeepersFemale()
    GenerateVehicleShopKeepersDataBike()
    GenerateVehicleShopKeepersDataVeh()
    GenerateVehicleShopKeepersDataVeh2()
    GenerateVehicleShopKeepersDataBoat()
    GenerateVehicleShopKeepersDataAir()
    GeneratemrpdK9Npcs()
    TriggerClientEvent("rd-npcs:set:ped", source, Generic.NPCS)
end)

function GenerateShopKeepers()
    for _, location in ipairs(Generic.ShopKeeperLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("shopkeeper_%s"):format(_),
            name = ("Shop Keeper %s"):format(_),
            pedType = 4,
            model = "mp_m_shopkeep_01",
            scenario = "WORLD_HUMAN_STAND_MOBILE",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isShopKeeper'] = true,
            },
        }
    end
end

function GenerateLiqourKeeper()
    for _, location in ipairs(Generic.LiqourKeeperLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("liqourkeeper_%s"):format(_),
            name = ("Liqour Keeper %s"):format(_),
            pedType = 4,
            model = "mp_m_forgery_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            }
        }
    end
end

function GeneratePaintballVendors()
   for _, location in ipairs(Generic.PaintballVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("paintball_vendor"),
            name = ("Paintball Vendor %s"):format(_),
            pedType = 4,
            model = "a_m_y_beachvesp_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
            --[[
                scenario = "WORLD_HUMAN_SHOKING_POT",
                blip = {
                    color = 43,
                    sprite = 140,
                    scale = 1.0,
                    text = "Paintball Vendor",
                    short = true
                    -- SetBlipAsMissionCreatorBlip(blip,true) ????
                }
            ]]
        }
   end
end

function GenerateGolfVendors()
    for _, keeperLocations in ipairs(Generic.GolfVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("golfclubseller_%s"):format(_),
            name = ("Golf Club Seller %s"):format(_),
            pedType = 4,
            model = "a_f_y_golfer_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = keeperLocations.xyz,
                heading = keeperLocations.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GeneratePaintballSignUp()
    for _, location in ipairs(Generic.PaintballSignupNPC) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("paintball_signup"),
            name = ("Paintball Signup %s"):format(_),
            pedType = 4,
            model = "a_f_y_golfer_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateArenaVendors()
    for _, location in ipairs(Generic.ArenaVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("paintball_arena_map"),
            name = ("Paintball ArenaMap %s"):format(_),
            pedType = 4,
            model = "s_m_y_construct_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateArenaGrassSwapper()
    for _, location in ipairs(Generic.ArenaGrassSwapper) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("paintball_arena_grass_swapper"),
            name = ("Paintball Arena Grass Swapper %s"):format(_),
            pedType = 4,
            model = "s_m_y_construct_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateCasinoInteriorSwaps()
    for _, location in ipairs(Generic.CasinoInteriorSwap) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("casino_interior_swap_%s"):format(_),
            name = ("Casino Interior Swap %s"):format(_),
            pedType = 4,
            model = "s_m_y_casino_01",
            scenario = "",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = '{ "face":{"params":[0,1,0,2],"mode":"component"}, "hair":{"params":[2,1,0,1],"mode":"component"}, "haircolor":{"params":[1,0],"mode":"haircolor"}, "torso":{"params":[11,2,0,1],"mode":"component"}, "undershirt":{"params":[8,0,0,1],"mode":"component"}, "accesory":{"params":[7,0,2,1],"mode":"component"} }',
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateSionisMaterials()
    for _, location in ipairs(Generic.SionisMaterials) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("sionis_material_worker_%s"):format(_),
            name = ("Stonis Materials %s"):format(_),
            pedType = 4,
            model = "s_m_m_lathandy_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
            scenario = "WORLD_HUMAN_CLIPBOARD",
            blip = {
                color = 1,
                sprite = 566,
                scale = 0.7,
                text = "Stonis Industries",
                short = true
            }
        }
    end
end

function GenerateGalleryInteriorSwaps()
    for _, location in ipairs(Generic.GalleryInteriorSwap) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("gallery_interior_swap_%s"):format(_),
            name = ("Gallery Interior Swap %s"):format(_),
            pedType = 4,
            model = "ig_dale",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateMiningVendors()
    for _, location in ipairs(Generic.MiningVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("mining_vendor_%s"):format(_),         
            name = ("Mining Vendor %s"):format(_),
            pedType = 4,
            model = "s_m_y_construct_02",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateHOImportVendors()
    for _, location in ipairs(Generic.HOImportVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("hoimport_vendor_%s"):format(_),         
            name = ("HOImport Vendor %s"):format(_),
            pedType = 4,
            model = "s_m_y_construct_02",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateHOImportDriftVendors()
    for _, location in ipairs(Generic.HOImportDriftVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("hoimport_drift_vendor_%s"):format(_),      
            name = ("HOImport Drift Vendor %s"):format(_),
            pedType = 4,
            model = "s_m_y_construct_02",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateCGJewelryVendors()
    for _, location in ipairs(Generic.CGJewelryVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = "cgjvendor",     
            name = ("Jewelry Vendor %s"):format(_),
            pedType = 4,
            model = "s_m_y_devinsec_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateSportShopKeepers()
    for _, location in ipairs(Generic.SportShopLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("sportshop_keeper_%s"):format(_),  
            name = ("Sport Shop %s"):format(_),
            pedType = 4,
            model = "ig_hunter",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isSportShopKeeper'] = true,
            },
        }
    end
end

function GenerateDwDropoffNpcs()
    for _, location in ipairs(Generic.DwDropOffNpc) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("dwdropoffnpc_%s"):format(_),  
            name = ("Drop Off Npc %s"):format(_),
            pedType = 4,
            model = "csb_customer",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateDwAdminNpc()
    for _, location in ipairs(Generic.DwAdminNpc) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("dwadminnpc_%s"):format(_),  
            name = ("Admin Npc %s"):format(_),
            pedType = 4,
            model = "u_m_y_chip",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateDwFoodShitNpcs()
    for _, location in ipairs(Generic.DwFoodShitNpc) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("dwfoodshitnpc_%s"):format(_),  
            name = ("Food Npc %s"):format(_),
            pedType = 4,
            model = "s_m_y_chef_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateDwBumperNpc()
    for _, location in ipairs(Generic.DwBumperNpc) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("dwbumpernpc_%s"):format(_), 
            name = ("Bumper Npc %s"):format(_),
            pedType = 4,
            model = "u_m_y_chip",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GeneratePCAGraderNpcs()
    for _, location in ipairs(Generic.PCAGraders) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("pcagraders_%s"):format(_), 
            name = ("PCAGraders %s"):format(_),
            pedType = 4,
            model = "a_m_y_vinewood_02",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateCasinoHotelVendors()
    for _, location in ipairs(Generic.CasinoHotelVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("casino_hotel_worker_%s"):format(_), 
            name = ("Casino Hotel Vendor %s"):format(_),
            pedType = 4,
            model = "s_f_y_casino_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateXCoinRedeem()
    for _, location in ipairs(Generic.XCoinRedeem) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("xcoinredeem_%s"):format(_), 
            name = ("XCoinRedeem %s"):format(_),
            pedType = 4,
            model = "hc_hacker",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateGangSprayVendors()
    for _, location in ipairs(Generic.GangSprayVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("gangspray_%s"):format(_),
            name = ("Gang Spray Vendor %s"):format(_),
            pedType = 4,
            model = "g_m_y_famfor_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateHNOVendors()
    for _, location in ipairs(Generic.HNOVendor) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("hnovendor_%s"):format(_),
            name = ("HNOVendor %s"):format(_),
            pedType = 4,
            model = "a_m_y_business_03",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
            scenario = "WORLD_HUMAN_CLIPBOARD",
        }
    end
end

function GenerateCasinoMembershipGiver()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.CasinoLocations[1].npcId,
        name = "Casino Membership Giver",
        pedType = 4,
        model = "s_f_y_casino_01",
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.CasinoLocations[1].coords.xyz,
            heading = Generic.CasinoLocations[1].coords[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
            ['isCasinoMembershipGiver'] = true,
        },
    }
end

function GenerateCasinoRestRoom()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = ("casino_rest_room_%s"):format(_),
        name = "Casino Rest Room",
        pedType = 4,
        model = "s_f_y_casino_01",
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.CasinoLocations[2].coords.xyz,
            heading = Generic.CasinoLocations[2].coords[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateCasinoRestRoom2()
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("casino_rest_room_%s"):format(_),
            name = "Casino Rest Room 2",
            pedType = 4,
            model = "s_f_y_casino_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = Generic.CasinoLocations[3].coords.xyz,
                heading = Generic.CasinoLocations[3].coords[4],
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
end

function GenerateCasinoJewelStore()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = ("casino_jewel_store_%s"):format(_),
        name = "Casino Jewel Store",
        pedType = 4,
        model = "s_m_y_casino_01",
        scenario = "WORLD_HUMAN_GUARD_STAND",
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.CasinoLocations[4].coords.xyz,
            heading = Generic.CasinoLocations[4].coords[4],
            random = false
        },
        appearance = '{ "face":{"params":[0,2,0,2],"mode":"component"}, "hair":{"params":[2,2,0,1],"mode":"component"}, "haircolor":{"params":[1,0],"mode":"haircolor"}, "torso":{"params":[11,1,0,1],"mode":"component"}, "undershirt":{"params":[8,1,0,1],"mode":"component"}, "accesory":{"params":[7,2,2,1],"mode":"component"} }',
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateCasinoChipSeller()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.CasinoLocations[5].npcId,
        name = "Casino Chip Seller",
        pedType = 4,
        model = "s_f_y_casino_01",
        scenario = "WORLD_HUMAN_STAND_IMPATIENT",
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.CasinoLocations[5].coords.xyz,
            heading = Generic.CasinoLocations[5].coords[4],
            random = false
        },
        appearance = '{ "face":{"params":[0,2,0,2],"mode":"component"}, "hair":{"params":[2,1,0,1],"mode":"component"}, "haircolor":{"params":[1,0],"mode":"haircolor"}, "accesory":{"params":[7,2,2,1],"mode":"component"} }',
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
            ['isCasinoChipSeller'] = true,
        },
    }
end

function GenerateCasinoWheelSpinNpc()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.CasinoLocations[6].npcId,
        name = "Casino Wheel Spin Npc",
        pedType = 4,
        model = "s_f_y_casino_01",
        scenario = "WORLD_HUMAN_STAND_IMPATIENT",
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.CasinoLocations[6].coords.xyz,
            heading = Generic.CasinoLocations[6].coords[4],
            random = false
        },
        appearance = '{ "face":{"params":[0,2,0,2],"mode":"component"}, "hair":{"params":[2,2,0,1],"mode":"component"}, "haircolor":{"params":[1,0],"mode":"haircolor"}, "undershirt":{"params":[8,2,0,1],"mode":"component"}, "accesory":{"params":[7,0,2,1],"mode":"component"} }',
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end


function GenerateCasinoDrinkGiver()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.CasinoLocations[7].npcId,
        name = "Casino Drink Giver",
        pedType = 4,
        model = "s_f_y_casino_01",
        scenario = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.CasinoLocations[7].coords.xyz,
            heading = Generic.CasinoLocations[7].coords[4],
            random = false
        },
        appearance = '{ "undershirt":{"params":[8,1,0,1],"mode":"component"}, "accesory":{"params":[7,2,2,1],"mode":"component"} }',
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
            ['isCasinoDrinkGiver'] = true,
        },
    }
end

function GenerateWeaponShopKeepers()
    for _, location in ipairs(Generic.WeaponShopLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("weaponshoplocations_%s"):format(_),
            name = ("Weapon Shop %s"):format(_),
            pedType = 4,
            model = "s_m_y_ammucity_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isWeaponShopKeeper'] = true,
            },
        }
    end
end

function GenerateToolShopKeepers()
    for _, location in ipairs(Generic.ToolShopLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("toolshoplocations_%s"):format(_),
            name = ("Tool Shop %s"):format(_),
            pedType = 4,
            model = "s_m_m_lathandy_01",
            scenario = "WORLD_HUMAN_CLIPBOARD",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isToolShopKeeper'] = true,
            },
        }
    end
end

function GenerateGemShopLocations()
    for _, location in ipairs(Generic.GemShopLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("gemshoplocations_%s"):format(_),
            name = ("Gem Shop %s"):format(_),
            pedType = 4,
            model = "a_m_y_busicas_01",
            scenario = "WORLD_HUMAN_CLIPBOARD",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateWeedShopKeepers()
    for _, location in ipairs(Generic.WeedShopLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("weedshop_keeper_%s"):format(_),
            name = ("Weed Shop %s"):format(_),
            pedType = 4,
            model = "s_m_m_bouncer_02",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isWeedShopKeeper'] = true,
            },
        }
    end
end

function GenerateFarmersMarketCraftLocations()
    for _, location in ipairs(Generic.FarmersMarketCraftLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("farmersmarketcraftlocations_%s"):format(_),
            name = ("Farmers Market Craft %s"):format(_),
            pedType = 4,
            model = "ig_paige",
            scenario = "WORLD_HUMAN_GUARD_STAND",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateFactoryShopLocations()
    for _, location in ipairs(Generic.FactoryShopLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("factoryshoplocations_%s"):format(_),
            name = ("Factory Shop %s"):format(_),
            pedType = 4,
            model = "ig_dale",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GenerateJobVehicleNPCs()
    for _, location in ipairs(Generic.JobVehLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("jobveh_keeper_%s"):format(_),
            name = ("Job Veh %s"):format(_),
            pedType = 4,
            model = "a_m_m_business_01",
            scenario = "WORLD_HUMAN_CLIPBOARD",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isJobVehShopKeeper'] = true,
            },
        }
    end
end

function GenerateWineryBuyLocations()
    for _, location in ipairs(Generic.WineryBuyLocations) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("winery_keeper_goods_%s"):format(_),
            name = ("Winery Buy %s"):format(_),
            pedType = 4,
            model = "a_f_y_business_02",
            scenario = "WORLD_HUMAN_DRINKING",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isWineryShopKeeper'] = true,
            },
        }
    end
end

function GenerateBennysNPC()
    for _, location in ipairs({vector4(-227.08, -1326.74, 29.89, 240.83)}) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("bennysnpc_%s"):format(_),
            name = ("Bennys NPC %s"):format(_),
            pedType = 4,
            model = "a_f_y_hipster_01",
            scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
            },
        }
    end
end

function GeneratePublicLicenseKeepersMale()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.PublicLicenseKeepers[1].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.PublicLicenseKeepers[1].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.PublicLicenseKeepers[1].location.xyz,
            heading = Generic.PublicLicenseKeepers[1].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GeneratePublicLicenseKeepersFemale()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.PublicLicenseKeepers[2].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.PublicLicenseKeepers[2].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.PublicLicenseKeepers[2].location.xyz,
            heading = Generic.PublicLicenseKeepers[2].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateVehicleShopKeepersDataBike()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.VehicleShopKeepersData[1].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.VehicleShopKeepersData[1].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.VehicleShopKeepersData[1].location.xyz,
            heading = Generic.VehicleShopKeepersData[1].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateVehicleShopKeepersDataVeh()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.VehicleShopKeepersData[2].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.VehicleShopKeepersData[2].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.VehicleShopKeepersData[2].location.xyz,
            heading = Generic.VehicleShopKeepersData[2].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateVehicleShopKeepersDataVeh2()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.VehicleShopKeepersData[3].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.VehicleShopKeepersData[3].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.VehicleShopKeepersData[3].location.xyz,
            heading = Generic.VehicleShopKeepersData[3].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateVehicleShopKeepersDataBoat()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.VehicleShopKeepersData[4].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.VehicleShopKeepersData[4].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.VehicleShopKeepersData[4].location.xyz,
            heading = Generic.VehicleShopKeepersData[4].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GenerateVehicleShopKeepersDataAir()
    Generic.NPCS[#Generic.NPCS + 1] = {
        id = Generic.VehicleShopKeepersData[5].id,
        name = "Public License Keepers",
        pedType = 4,
        model = Generic.VehicleShopKeepersData[5].model,
        networked = false,
        distance = 25.0,
        position = {
            coords = Generic.VehicleShopKeepersData[5].location.xyz,
            heading = Generic.VehicleShopKeepersData[5].location[4],
            random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
    }
end

function GeneratemrpdK9Npcs()
    for _, location in ipairs(Generic.mrpdK9Npcs) do
        Generic.NPCS[#Generic.NPCS + 1] = {
            id = ("mrpdK9Npcs_%s"):format(_),
            name = ("mrpd K9 Npcs %s"):format(_),
            pedType = 4,
            model = "a_c_shepherd_np",
            scenario = "WORLD_DOG_SITTING_SHEPHERD",
            networked = false,
            distance = 25.0,
            position = {
                coords = location.xyz,
                heading = location.w,
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isPetshopSeller'] = true,
            },
        }
    end
end