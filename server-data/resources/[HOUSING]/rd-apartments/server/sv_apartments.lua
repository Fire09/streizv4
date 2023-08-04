currentRoomLocks = {
    [1] = {},
    [2] = {},
    [3] = {}
}

currentRoomLockdown = {
    [1] = {},
    [2] = {},
    [3] = {}
}

RPC.register("GetMotelInformation",function(pSource,currentRoomType,currentRoomNumber)
    local data =  Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{["roomnum"] = currentRoomNumber.param,["ptype"] = currentRoomType.param}))
    return data
end)

RPC.register("IsValidRoom",function(pSource,RoomType,RoomNumber)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{
        ["roomnum"] = RoomNumber.param,
        ["ptype"] = RoomType.param
    }))
    local retval = false
    if data[1] then
        retval = true
    end

    return retval
end)

RPC.register("apartment:forclose",function(pSource,RoomType,RoomNumber)
    currentRoomLockdown[RoomType][RoomNumber] = not currentRoomLockdown[RoomType][RoomNumber]
end)

RPC.register("apartment:getOwner",function(pSource,RoomType,RoomNumber)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{
        ["roomnum"] = RoomNumber.param,
        ["ptype"] = RoomType.param
    }))

    return data[1].cid
end)

RPC.register("upgradeApartment",function(pSource,apartmentTargetType,RoomType,RoomNumber)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{
        ["roomnum"] = RoomNumber.param,
        ["ptype"] = RoomType.param
    }))

    SQL.execute("UPDATE character_motel SET building_type=@btype WHERE id=@roomnum",{
        ["roomnum"] = RoomNumber.param,
        ["btype"] = apartmentTargetType.param
    })

    return true
end)

RPC.register("getApartmentInformation",function(pSource)
    return Apart.info
end)

RPC.register("apartment:allCurrentApartmentsOfRoomType",function(pSource, pRoomtype)
    return currentRoomLocks[pRoomtype.param]
end)

RegisterServerEvent("apartment:serverApartmentSpawn")
AddEventHandler("apartment:serverApartmentSpawn",function(roomType,isNew,instance,isSpawn)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.oxmysql:execute("select * from character_motel WHERE cid=@cid",{
        ["cid"] = char.id
    },function(result)
        if #result > 0 then
            if isSpawn then
                TriggerClientEvent("apartments:enterMotel",src,result[1].id,roomType,isSpawn)
            end
            if isNew then
                --TriggerClientEvent("apartments:enterMotel",src,result[1].id,roomType,isSpawn)
            end
            TriggerClientEvent("apartments:apartmentSpawn",src,{roomType = roomType},result[1].id)
        end
        currentRoomLocks[roomType][result[1].id] = true
        TriggerClientEvent("apartments:apartmentLocks",-1,currentRoomLocks)
    end)
end)


RegisterServerEvent("apartment:serverEnterAprts")
AddEventHandler("apartment:serverEnterAprts",function(roomType)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.oxmysql:execute("select * from character_motel WHERE cid=@cid",{
        ["cid"] = char.id
    },function(result)
        if #result > 0 then
            if result[1].building_type == roomType then
                TriggerClientEvent("apartments:enterMotel",src,result[1].id,roomType)
            else
                TriggerClientEvent("DoLongHudText", src, "You don't have a Apartment here", 5)
            end
        end
    end)
end)

RegisterServerEvent("apartment:serverUnlockAprts")
AddEventHandler("apartment:serverUnlockAprts",function(roomType)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.oxmysql:execute("select * from character_motel WHERE cid=@cid",{
        ["cid"] = char.id
    },function(result)
        if #result > 0 then
            if result[1].building_type == roomType then
                TriggerClientEvent("rd-apps:unlocks1",src)
            else
                TriggerClientEvent("rd-apps:unlocks2",src)
            end
        end
    end)
end)

RegisterServerEvent("apartments:ToggleLocks")
AddEventHandler("apartments:ToggleLocks",function(RoomType,RoomNumber)
    currentRoomLocks[RoomType][RoomNumber] = not currentRoomLocks[RoomType][RoomNumber]
    TriggerClientEvent("apartments:apartmentLocks",-1,currentRoomLocks)
end)

RegisterServerEvent("apartment:serverLockdown")
AddEventHandler("apartment:serverLockdown",function(RoomNumber,RoomType)

    print("apartment:serverLockdown", RoomType, RoomNumber)

    print("curLocks", currentRoomLocks[RoomType][RoomNumber])
    print("curLockdown", currentRoomLockdown[RoomType][RoomNumber])

    currentRoomLocks[RoomType][RoomNumber] = not currentRoomLocks[RoomType][RoomNumber]
    currentRoomLockdown[RoomType][RoomNumber] = not currentRoomLockdown[RoomType][RoomNumber]
    
    print("upd")
    
    print("newLocks", currentRoomLocks[RoomType][RoomNumber])
    print("newLockdown", currentRoomLockdown[RoomType][RoomNumber])

    TriggerClientEvent("apartments:apartmentLocks",-1,currentRoomLocks)
    TriggerClientEvent("apartments:apartmentLockDown",-1,currentRoomLockdown)
end)

RegisterServerEvent("apartment:serverLockdownCID")
AddEventHandler("apartment:serverLockdownCID",function(pCid,RoomType)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE cid = @cid", {
        ["cid"] = pCid
    }))

    if not data then return end

    print("got data", data[1].id)

    if currentRoomLocks[RoomType][data[1].id] then
        print("room exist, upd")
        currentRoomLocks[RoomType][data[1].id] = not currentRoomLocks[RoomType][data[1].id]
    else
        print("room no exist, make")
        currentRoomLocks[RoomType][data[1].id] = false
    end

    if currentRoomLockdown[RoomType][data[1].id] then
        print("room exist, upd 2")
        currentRoomLockdown[RoomType][data[1].id] = not currentRoomLockdown[RoomType][data[1].id]
    else
        print("room no exist, make 2")
        currentRoomLockdown[RoomType][data[1].id] = true
    end

    print("trigger events")

    TriggerClientEvent("apartments:apartmentLocks",-1,currentRoomLocks)
    TriggerClientEvent("apartments:apartmentLockDown",-1,currentRoomLockdown)
end)

RegisterServerEvent('rd-apartments:SetNewRouting')
AddEventHandler('rd-apartments:SetNewRouting', function(roomNumber)
    local src = source
    SetPlayerRoutingBucket(src, roomNumber)
end)

RegisterServerEvent('rd-apartments:GetRouting')
AddEventHandler('rd-apartments:GetRouting', function()
    local src = source
    GetPlayerRoutingBucket(src)
end)

RegisterServerEvent('rd-apartments:SetOldRouting')
AddEventHandler('rd-apartments:SetOldRouting', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
end)