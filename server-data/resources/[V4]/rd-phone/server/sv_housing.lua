RPC.register("getHousingData", function(pSource, pCid)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE cid = @cid", {
        ["cid"] = pCid.param
    }))

    if not data then return false, "" end
    local available = {}
    local roomType = "No3"
    if tonumber(data[1].building_type) == 1 then
        --print("building type is 1")
        roomType = "No3"
        available[#available + 1] = {
            id = 2,
            name = "Prosperity",
            price = 80000
        }
        available[#available + 1] = {
            id = 3,
            name = "Pill Box Swiss St",
            price = 210000
        }
    elseif tonumber(data[1].building_type) == 2 then
        roomType = "Prosperity"
        available[#available + 1] = {
            id = 1,
            name = "No3",
            price = 0
        }
        available[#available + 1] = {
            id = 3,
            name = "Pill Box Swiss St",
            price = 210000
        }
    elseif tonumber(data[1].building_type) == 3 then
        roomType = "Pill Box Swiss St"
        available[#available + 1] = {
            id = 1,
            name = "No3",
            price = 0
        }
        available[#available + 1] = {
            id = 3,
            name = "Prosperity",
            price = 80000
        } 
    end

    local propertydata = Await(SQL.execute("SELECT * FROM housing", {}))
    local owned = {}
    local access = {}
    for _, pData in pairs(propertydata) do
        if tonumber(pData.cid) == tonumber(pCid.param) then
            owned[#owned + 1] = {
                propertyname = pData.housingName,
                locked = pData.status,
                cid = pData.cid,
                category = pData.cat,
                property_id = pData.hid
            }
        end
        if pData.keys ~= nil then
        local keys = json.decode(pData.keys)
        for k,v in pairs(keys) do
            if tonumber(v) == tonumber(pCid.param) then
                access[#access + 1] = {
                    propertyname = pData.name,
                    locked = pData.locked,
                    cid = pData.cid,
                    category = pData.cat,
                    property_id = pData.id
                }
            end
        end
    end
    end

    return data[1].id, roomType, available, owned, access
end)