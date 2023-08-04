-- TODO;
-- Generate random ID when harvesting to target meta id, like laptops.

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(10000)
--         local data = Await(SQL.execute("SELECT * FROM user_inventory2 WHERE name NOT LIKE @wanted AND item_id = @item_id", {
--             ["wanted"] = "ply",
--             ["item_id"] = "wetbud"
--         }))
    
--         if data[1] ~= nil then
--         for i = 1, #data do
--             local str = data[i].name
--             if string.find(str, "motel") or string.find(str, "warehouse") or string.find(str, "housing") then
    
--             local information = data[i].information
--             local metaData = json.decode(information)
--             local timestamp = tonumber(metaData.timestamp)
--             local unix = os.time()
--             local wantedunix = timestamp + 3600000 -- 1 hour
--             if unix > wantedunix then
--                 local data = Await(SQL.execute("UPDATE user_inventory2 SET item_id = @item_id WHERE id = @id", {
--                     ["item_id"] = "driedbud",
--                     ["id"] = data[i].id
--                 }))
--             end
    
--             end
--         end
--     end
--     end
--     end)
    
    Citizen.CreateThread(function()
        while true do
        Citizen.Wait(600000)
        print("[rd-weed] Plants Updated")
        local plants = Await(SQL.execute("SELECT * FROM weed_plants"))
        weedplants = {}
        for i = 1, #plants do
            strain = {n = plants[tonumber(i)].n, p = plants[tonumber(i)].p, k = plants[tonumber(i)].k, water = plants[tonumber(i)].water}
            weedplants[#weedplants + 1] = {
                ["id"] = plants[tonumber(i)].id,
                ["x"] = plants[tonumber(i)].x, 
                ["y"] = plants[tonumber(i)].y, 
                ["z"] = plants[tonumber(i)].z,
                ["gender"] = plants[tonumber(i)].gender,
                ["timestamp"] = plants[tonumber(i)].timestamp,
                ["strain"] = strain,
                ["last_harvest"] = plants[tonumber(i)].last_harvest
          }
        end
        TriggerClientEvent("rd-weed:trigger_zone", -1, 1, weedplants)
        end
    end)
    
    RPC.register("rd-weed:getPlants", function(pSource)
        local plants = Await(SQL.execute("SELECT * FROM weed_plants"))
    
        weedplants = {}
        for i = 1, #plants do
            strain = {n = plants[tonumber(i)].n, p = plants[tonumber(i)].p, k = plants[tonumber(i)].k, water = plants[tonumber(i)].water}
            weedplants[#weedplants + 1] = {
                ["id"] = plants[tonumber(i)].id,
                ["x"] = plants[tonumber(i)].x, 
                ["y"] = plants[tonumber(i)].y, 
                ["z"] = plants[tonumber(i)].z,
                ["gender"] = plants[tonumber(i)].gender,
                ["timestamp"] = plants[tonumber(i)].timestamp,
                ["strain"] = strain,
                ["last_harvest"] = plants[tonumber(i)].last_harvest
          }
        end
        
        TriggerClientEvent("rd-weed:trigger_zone", pSource, 1, weedplants)
    
        return weedplants
    end)
    
    RPC.register("rd-weed:plantSeed", function(pSource, pCoords, pTypeMod)
        local coords = pCoords.param
        local typemod = pTypeMod.param
        local timestamp = os.time()
    
        local data = Await(SQL.execute("INSERT INTO weed_plants (timestamp, x, y, z, gender, water, n, p, k) VALUES (@timestamp, @x, @y, @z, @gender, @water, @n, @p, @k)", {
            ["timestamp"] = timestamp,
            ["x"] = coords.x,
            ["y"] = coords.y,
            ["z"] = coords.z,
            ["gender"] = 0, --0/2 = female, 1 = male
            ["water"] = typemod.water,
            ["n"] = typemod.n,
            ["p"] = typemod.p,
            ["k"] = typemod.k
        }))
    end)
    
    RPC.register("rd-weed:addWater", function(pSource, pData)
        local data = pData.param
    
        local update = Await(SQL.execute("UPDATE weed_plants SET water = water + @water WHERE id = @id", {
            ["water"] = PlantConfig.WaterAdd,
            ["id"] = data.id
        }))
    
        return true
    end)
    
    RPC.register("rd-weed:addFertilizer", function(pSource, pData)
        local data = pData.param
        local type = data.type
    
        if type == "n" then
        local update = Await(SQL.execute("UPDATE weed_plants SET n = n + @amount WHERE id = @id", {
            ["amount"] = PlantConfig.FertilizerAdd,
            ["id"] = data.id
        }))
        elseif type == "p" then
        local update = Await(SQL.execute("UPDATE weed_plants SET p = p + @amount WHERE id = @id", {
            ["amount"] = PlantConfig.FertilizerAdd,
            ["id"] = data.id
        }))
        elseif type == "k" then
        local update = Await(SQL.execute("UPDATE weed_plants SET k = k + @amount WHERE id = @id", {
            ["amount"] = PlantConfig.FertilizerAdd,
            ["id"] = data.id
        }))
        end
    
        return true
    end)
    
    RPC.register("rd-weed:harvestPlant", function(pSource, pId, pStrain)
        local time = os.time()
        local plant = pStrain.param
        --    local update = Await(SQL.execute("UPDATE weed_plants SET timestamp = @timestamp, last_harvest = @last_harvest, maleseeds = @maleseeds WHERE id = @id", {
        local update = Await(SQL.execute("UPDATE weed_plants SET timestamp = @timestamp, last_harvest = @last_harvest WHERE id = @id", {
            ["timestamp"] = time,
            ["last_harvest"] = time,
            ["id"] = pId.param
        }))
    
        TriggerClientEvent("player:receiveItem", pSource, 'wetbud', 1, false, {
            _hideKeys = { "timestamp" },
            timestamp = time,
            strain = plant.strain,
            quality = plant.quality
        })
    
        local plants = Await(SQL.execute("SELECT * FROM weed_plants"))
    
        weedplants = {}
        for i = 1, #plants do
            strain = {n = plants[tonumber(i)].n, p = plants[tonumber(i)].p, k = plants[tonumber(i)].k, water = plants[tonumber(i)].water}
            weedplants[#weedplants + 1] = {
                ["id"] = plants[tonumber(i)].id,
                ["x"] = plants[tonumber(i)].x, 
                ["y"] = plants[tonumber(i)].y, 
                ["z"] = plants[tonumber(i)].z,
                ["gender"] = plants[tonumber(i)].gender,
                ["timestamp"] = plants[tonumber(i)].timestamp,
                ["strain"] = strain,
                ["last_harvest"] = plants[tonumber(i)].last_harvest
          }
        end
        
        TriggerClientEvent("rd-weed:trigger_zone", pSource, 1, weedplants)
    
        return true
    end)
    
    RPC.register("rd-weed:removePlant", function(pSource, pData, pFertilizer)
        local data = pData.param
        local select = Await(SQL.execute("SELECT maleseeds FROM weed_plants WHERE id = @id", {
            ["id"] = data.id
        }))
        local delete = Await(SQL.execute("DELETE FROM weed_plants WHERE id = @id", {
            ["id"] = data.id
        }))
    
        if select[1].maleseeds > 0 then
        local maleseeds = select[1].maleseeds
        local seeds = 1 * maleseeds
        TriggerClientEvent("player:receiveItem", pSource, "maleseed", seeds)
        math.randomseed(os.time())
        local femaleChance = 10
        if femaleChance > math.random() then
            TriggerClientEvent("player:receiveItem", pSource, "femaleseed", math.random(1,2))
        end
        end
    
        local plants = Await(SQL.execute("SELECT * FROM weed_plants"))
    
        weedplants = {}
        if plants[1] ~= nil then
        for i = 1, #plants do
            strain = {n = plants[tonumber(i)].n, p = plants[tonumber(i)].p, k = plants[tonumber(i)].k, water = plants[tonumber(i)].water}
            weedplants[#weedplants + 1] = {
                ["id"] = plants[tonumber(i)].id,
                ["x"] = plants[tonumber(i)].x, 
                ["y"] = plants[tonumber(i)].y, 
                ["z"] = plants[tonumber(i)].z,
                ["gender"] = plants[tonumber(i)].gender,
                ["timestamp"] = plants[tonumber(i)].timestamp,
                ["strain"] = strain,
                ["last_harvest"] = plants[tonumber(i)].last_harvest
          }
        end
        end
    
        TriggerClientEvent("rd-weed:trigger_zone", pSource, 1, weedplants)
    
        return true
    end)
    
    RPC.register("rd-weed:addMaleSeed", function(pSource, pData)
        local data = pData.param
        local update = Await(SQL.execute("UPDATE weed_plants SET maleseeds = maleseeds + @amount WHERE id = @id", {
            ["id"] = data.id
        }))
    end)
    
    