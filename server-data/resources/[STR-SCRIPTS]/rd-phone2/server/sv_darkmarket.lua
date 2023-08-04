RPC.register("getDarkMarketProducts", function(pSource, pZone)
    local data = Await(SQL.execute("SELECT * FROM dark_market WHERE zone = @zone", {
        ["zone"] = pZone.param
    }))

    if not data then return false end

    return data
end)

RPC.register("purchaseProduct", function(pSource, pCid, pProductId)
    local productData = Await(SQL.execute("SELECT * FROM dark_market WHERE id = @id", {
        ["id"] = pProductId.param
    }))

    local cryptoData = Await(SQL.execute("SELECT * FROM user_crypto WHERE cryptoid = @cryptoid AND cryptocid = @cryptocid", {
        ["cryptoid"] = productData[1].cryptoid,
        ["cryptocid"] = pCid.param
    }))

    local cryptoamount = tonumber(cryptoData[1].cryptoamount)
    local productprice = tonumber(productData[1].product_price)

    if productprice > cryptoamount then
        return false, "Not enough crypto."
    end

    takeCrypto(pCid.param, productData[1].product_price, productData[1].cryptoid)

    local itemid = tostring(productData[1].product_itemid)

    if not productData then return false, "Error" end

    local data1 = Await(SQL.execute("INSERT INTO pickups (cid, itemid) VALUES (@cid, @itemid)", {
        ["cid"] = pCid.param,
        ["itemid"] = itemid
    }))

    if not data1 then return false, "Error" end

    return true
end)