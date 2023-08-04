                --// Union Towing

RegisterServerEvent('rd-jobs:union-towing')
AddEventHandler('rd-jobs:union-towing', function(car)
	local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if car == "towtruck" then
        TriggerClientEvent('rd-jobs:tow-union-bay-2', source, car)
    elseif car == "towtruck2" then
        TriggerClientEvent('rd-jobs:tow-union-bay-2', source, car)
    elseif car == "flatbed" then
        TriggerClientEvent('rd-jobs:tow-union-bay-2', source, car)
    end
end)

RegisterServerEvent('rd-jobs:union-towing-bay-2')
AddEventHandler('rd-jobs:union-towing-bay-2', function(car)
	local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if car == "towtruck" then
        TriggerClientEvent('rd-jobs:tow-union-bay-1', source, car)
    elseif car == "towtruck2" then
        TriggerClientEvent('rd-jobs:tow-union-bay-1', source, car)
    elseif car == "flatbed" then
        TriggerClientEvent('rd-jobs:tow-union-bay-1', source, car)
    end
end)

                    --// Winery 

RegisterServerEvent('winery-payout')
AddEventHandler('winery-payout', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
	end
end)

                --// Burgershot

Registers = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {}
}

RegisterServerEvent('burger_shot:OrderComplete')
AddEventHandler("burger_shot:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("burgershot:retreive:receipt")
AddEventHandler("burgershot:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Burger Shot"})
                    TriggerEvent("burger_shot:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("burger_shot:update:registers")
AddEventHandler("burger_shot:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent("burgershot:update:pay")
AddEventHandler("burgershot:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.oxmysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.oxmysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent('DoLongHudText', src, 'Your paycheck was updated', 1)
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)

                    --// In N Out

RegisterServerEvent("in_n_out:retreive:receipt")
AddEventHandler("in_n_out:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at In N Out"})
                    TriggerEvent("in_n_out:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("in_n_out:update:registers")
AddEventHandler("in_n_out:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent('in_n_out:OrderComplete')
AddEventHandler("in_n_out:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("in_n_out:update:pay")
AddEventHandler("in_n_out:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.oxmysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.oxmysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)

            --// Server Side Cosmic Cannabis

RegisterServerEvent('rd-weedbox:payout')
AddEventHandler('rd-weedbox:payout', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
	end
end)

RegisterServerEvent("cosmic_cannabis:retreive:receipt")
AddEventHandler("cosmic_cannabis:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Cosmic Cannabis"})
                    TriggerEvent("cosmic_cannabis:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("cosmic_cannabis:update:registers")
AddEventHandler("cosmic_cannabis:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent('cosmic_cannabis:OrderComplete')
AddEventHandler("cosmic_cannabis:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("rd-jobs:cosmic_cannabis:update:pay")
AddEventHandler("rd-jobs:cosmic_cannabis:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            TriggerClientEvent('cosmic_cannabis:pay', src, jsonparse["Price"])
            local pPayment = jsonparse["Price"] / 50
            user:addMoney(pPayment)
            exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)


            --// Drift School

RegisterServerEvent('rd-jobs:spawn-drift-car')
AddEventHandler('rd-jobs:spawn-drift-car', function(car)
	local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if car == "cookie60" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "m3tp" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "komodafr" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "skart" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "huralbcamber" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "lynxgpr" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "mads14" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "mbc63" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "s15rbjr" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "mlec" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "hachurac" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "wrxwide" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    elseif car == "zr3806str" then
        TriggerClientEvent('rd-jobs:pull-drift-veh', source, car)
    end
end)

                    --// Radical Coffee

RegisterServerEvent("radical_coffee:retreive:receipt")
AddEventHandler("radical_coffee:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Radical Coffee"})
                    TriggerEvent("radical_coffee:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("radical_coffee:update:registers")
AddEventHandler("radical_coffee:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent('radical_coffee:OrderComplete')
AddEventHandler("radical_coffee:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("radical_coffee:update:pay")
AddEventHandler("radical_coffee:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.oxmysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.oxmysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)


                        --// Pearls

RegisterServerEvent("pearls:retreive:receipt")
AddEventHandler("pearls:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Pearls"})
                    TriggerEvent("pearls:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("pearls:update:registers")
AddEventHandler("pearls:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent('pearls:OrderComplete')
AddEventHandler("pearls:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("pearls:update:pay")
AddEventHandler("pearls:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            TriggerClientEvent('pearls:pay', src, jsonparse["Price"])
            local pPayment = jsonparse["Price"] / 50
            user:addMoney(pPayment)
            exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)

                        -- // Red Circle

RegisterServerEvent("red_circle:retreive:receipt")
AddEventHandler("red_circle:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Red Circle"})
                    TriggerEvent("red_circle:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("red_circle:update:registers")
AddEventHandler("red_circle:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent("red_circle:update:pay")
AddEventHandler("red_circle:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.oxmysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.oxmysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
                TriggerClientEvent('DoLongHudText', src, 'You got paid $' ..jsonparse["Price"].. ' From your work receipt.')
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)

RegisterServerEvent('red_circle:OrderComplete')
AddEventHandler("red_circle:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)









                        --- [START]  Vanilla Unicorn  -- 

RegisterServerEvent("vanilla:retreive:receipt")
AddEventHandler("vanilla:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at the VU"})
                    TriggerEvent("vanilla:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("vanilla:update:registers")
AddEventHandler("vanilla:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent("vanilla:update:pay")
AddEventHandler("vanilla:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.oxmysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.oxmysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)

RegisterServerEvent('vanilla:OrderComplete')
AddEventHandler("vanilla:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

-- Maldinis

RegisterServerEvent('void_maldinis:OrderComplete')
AddEventHandler("void_maldinis:OrderComplete", function(regID, price, comment)
    local insert = {
        owner = source, 
        price = price, 
        comment = comment,
        regID = regID
    }
    Registers[regID] = {}
    table.insert(Registers[regID], insert)
end)

RegisterServerEvent("voirp_maldinis:retreive:receipt")
AddEventHandler("voirp_maldinis:retreive:receipt", function(regID)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    if Registers[regID] then
        for i = 1, #Registers[regID] do
            if Registers[regID][i].regID == regID then
                local amount = Registers[regID][i].price
                if (tonumber(user:getCash()) >= tonumber(amount)) then
                    user:removeMoney(tonumber(amount))
                    local owner = exports["rd-base"]:getModule("Player"):GetUser(Registers[regID][i].owner)
                    local char = owner:getCurrentCharacter()
                    information = {
                        ["Price"] = tonumber(amount),
                        ["Creator"] = char.first_name .. " " ..char.last_name,
                        ["Comment"] = Registers[regID][i].comment
                    }

                    TriggerClientEvent("player:receiveItem", Registers[regID][i].owner, "ownerreceipt", 1, true, information)
                    TriggerClientEvent("player:receiveItem", src, "receipt", 1, true, {["Comment"] = "Thanks for your order at Maldinis Pizzeria"})
                    TriggerEvent("np_maldinis:update:registers", regID)
                else
                    TriggerClientEvent("DoLongHudText", src, "You cant afford this payment", 2)
                end
            end
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Payment not ready..", 2)
    end
end) 

RegisterServerEvent("np_maldinis:update:registers")
AddEventHandler("np_maldinis:update:registers", function(regID)
    for k, v in pairs(Registers[regID]) do
        table.remove(Registers[regID], k)
    end
end)

RegisterServerEvent("np_maldinis:update:pay")
AddEventHandler("np_maldinis:update:pay", function(cid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getVar("character").id
    local invname = 'ply-'..characterId
    exports.oxmysql:execute("SELECT `slot`, `information` FROM user_inventory2 WHERE name = ? AND `item_id` = ? ORDER BY slot DESC", {invname, "ownerreceipt"}, function(data)
        if data[1] then
            local slot = data[1].slot
            local jsonparse = json.decode(data[1].information)
            exports.oxmysql:execute("SELECT `paycheck` FROM characters WHERE id = ?", {characterId}, function(old)
                local before = old[1].paycheck
                exports.oxmysql:execute("UPDATE characters SET `paycheck` = @paycheck WHERE `id` = @id", {
                    ['@paycheck'] = old[1].paycheck + jsonparse["Price"],
                    ['@id'] = characterId
                })
                TriggerClientEvent('DoLongHudText', src, 'Your paycheck was updated by $' .. jsonparse["Price"], 1)
                TriggerClientEvent("Yougotpaid", src, characterId)
                exports.oxmysql:execute('DELETE FROM user_inventory2 WHERE `name`= ? AND `item_id`= ? AND `slot`= ?', {invname, "ownerreceipt", slot})
            end)
        else
            TriggerClientEvent("DoLongHudText", src, "You dont have any work receipts to cash in")
        end
    end)
end)

RegisterServerEvent('CarryPeople:sync')
AddEventHandler('CarryPeople:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('CarryPeople:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('CarryPeople:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)

    -- exports["rd-log"]:AddLog("Civ Jobs", 
    --     source, 
    --     "Carry Player", 
    --     { targetPlayer = GetPlayerName(target) })
end)

RegisterServerEvent('CarryPeople:stop')
AddEventHandler('CarryPeople:stop', function(targetSrc)
	TriggerClientEvent('CarryPeople:cl_stop', targetSrc)

    -- exports["rd-log"]:AddLog("Civ Jobs", 
    --     source, 
    --     "Stop Carry Player", 
    --     { targetPlayer = GetPlayerName(targetSrc) })
    -- Why would you log the carry?
    -- Wanna kill the SQL? its slow enough.
end)

RegisterServerEvent('rd-jobs:galleryPayout')
AddEventHandler('rd-jobs:galleryPayout', function(amount)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()

    user:addMoney(amount)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** Endless RP [Gallery] | Payout Log **",
          ["description"] = "Gallery Payout Log | Amount: $"..amount.." | Character Name: "..charInfo.first_name.." "..charInfo.last_name.." | State ID: "..charInfo.id,
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/1040840915763335208/9t9z_FcFbm1qeanDYo2HXB6ksHldivZmynndK_7E2IbjBOK1h5cqQOqu1Y_JQZJeUNeP", function(err, text, headers) end, 'POST', json.encode({username = "Endless RP | Job Payout Log", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/476423150817771526/1026844730488787045/Endless-2.png"}), { ['Content-Type'] = 'application/json' })
end)