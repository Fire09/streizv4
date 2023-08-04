RegisterServerEvent("rd-storage:requestStorages")
AddEventHandler("rd-storage:requestStorages", function()
    local src = source 
    local resultS = Await(SQL.execute("SELECT * FROM _storages", {}))
    local loadStorage = {}

    for k, v in pairs(resultS) do
        v.coordinates = json.decode(v.coordinates)
        if v.despawn_at == nil then
            table.insert(loadStorage, v)
        end
    end

    TriggerClientEvent("rd-storage:loadStorages", src, loadStorage)
end)

RegisterServerEvent("rd-storage:breakInStorageFailed")
AddEventHandler("rd-storage:breakInStorageFailed", function(closestStash, itemUsed)
    print("breakInStorageFailed", closestStash, itemUsed)
    local src = source
end)

RegisterServerEvent("rd-storage:breakInStorage")
AddEventHandler("rd-storage:breakInStorage", function(closestStash, itemUsed)
    print("breakInStorage", closestStash, itemUsed)
    local src = source
    local resultS = Await(SQL.execute("SELECT * FROM _storages WHERE id = @id", {
        ["@id"] = closestStash
    }))

    TriggerClientEvent("server-inventory-open", src, "1", string.format("mobile-stash-%s_%s", Config.crates[resultS[1].size].invPrefix, closestStash))
end)

RegisterServerEvent("rd-storage:getRemainingLife")
AddEventHandler("rd-storage:getRemainingLife", function(closestStash)
    local src = source
    local resultS = Await(SQL.execute("SELECT * FROM _storages WHERE id = @id", {
        ["@id"] = closestStash
    }))

    if ((os.time() - resultS[1].placed_at) / 60) >= Config.crates[resultS[1].size].duration then
        SQL.execute("UPDATE _storages SET despawn_at = @despawn_at WHERE id = @id", {
            ["@id"] = closestStash,
            ["@despawn_at"] = os.date()
        })

        TriggerClientEvent("DoLongHudText", src, "It has expired", 2)
    else
        TriggerClientEvent("DoLongHudText", src, "Looks almost brand new", 1)
    end
end)

RegisterServerEvent("rd-storage:repairStorage")
AddEventHandler("rd-storage:repairStorage", function(closestStash, chargesLeft, pSlots)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local resultS = Await(SQL.execute("SELECT * FROM _storages WHERE id = @id", {
        ["@id"] = closestStash
    }))

    itemInfo = {
        charges = chargesLeft - Config.crates[resultS[1].size].repairCharges,
    }

    SQL.execute("UPDATE _storages SET placed_at = @placed_at WHERE id = @id", {
        ["@placed_at"] = os.time(), --will set default timestamp
        ["@id"] = closestStash
    })
    
    TriggerEvent("server-update-item", char.id, "craterepairkit", pSlots, json.encode(itemInfo))
end)

RegisterServerEvent("rd-storage:lockStorage")
AddEventHandler("rd-storage:lockStorage", function(keyCode, crateId, pBoolean)
    local src = source 

    SQL.execute("UPDATE _storages SET is_locked = @is_locked, key_code = @key_code WHERE id = @id", {
        ["@is_locked"] = true,
        ["@key_code"] = keyCode,
        ["@id"] = crateId
    })

    if pBoolean then
        TriggerClientEvent("inventory:removeItem", src, "mobilecratekeylock", 1)
    else
        TriggerClientEvent("inventory:removeItem", src, "mobilecratelock", 1)
    end

    TriggerClientEvent("rd-storage:updateLockState", src, crateId, true, keyCode)
end)

RegisterServerEvent("rd-storage:destroyStash")
AddEventHandler("rd-storage:destroyStash", function(closestStash)
    local src = source 

    SQL.execute("UPDATE _storages SET despawn_at = @despawn_at WHERE id = @id", {
        ["@id"] = closestStash,
        ["@despawn_at"] = os.date()
    })
    
    local resultS = Await(SQL.execute("SELECT * FROM _storages", {}))
    local destroyStash = {}

    for k, v in pairs(resultS) do
        if v.despawn_at ~= nil then
            table.insert(destroyStash, v.id)
        end
    end

    TriggerClientEvent("rd-storage:clearStorages", src, destroyStash)
end)

RegisterServerEvent("rd-storage:prepareStorage")
AddEventHandler("rd-storage:prepareStorage", function(isSelecting, cid, coordinates, heading)
    local src = source 

    SQL.execute("INSERT INTO _storages (size, placed_by, placed_at, coordinates) VALUES (@size, @placed_by, @placed_at, @coordinates)", {
        ["@size"] = isSelecting,
        ["@placed_by"] = cid,
        ["@placed_at"] = os.time(),
        ["@coordinates"] = json.encode({ x = coordinates.x, y = coordinates.y, z = coordinates.z, h = heading })
    })

    local resultS = Await(SQL.execute("SELECT * FROM _storages", {}))

    for k, v in pairs(resultS) do 
        v.coordinates = json.decode(v.coordinates)

        TriggerClientEvent("rd:storage:prepareNewStorage", src, v)
        TriggerClientEvent("DoLongHudText", src, "Go to the location to place it down!", 1)
    end
end)