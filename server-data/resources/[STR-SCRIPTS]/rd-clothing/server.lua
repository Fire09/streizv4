local raggsyFirstCreateChar = false

RegisterNetEvent("riddlev:FirstCreateChar")
AddEventHandler("riddlev:FirstCreateChar", function(pSrc)
    raggsyFirstCreateChar = true
end)

RegisterNetEvent("riddlev:FirstCreateCharFalse")
AddEventHandler("riddlev:FirstCreateCharFalse", function(pSrc)
    raggsyFirstCreateChar = false
end)

RPC.register("rd-clothing:saveSkin",function(pSource,data)
    local save = TriggerClientEvent("rd-clothing:save", pSource)
    return save, true
end)

RPC.register("clothing:purchasecash",function(pSource,pPrice)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    if user:getCash() >= pPrice.param then
        if not raggsyFirstCreateChar then 
        user:removeMoney(pPrice.param)
        else
            return true
        end
    else
        -- print("raggsy and riddle")
    end
    return true
end)

RPC.register("clothing:bankpurchase",function(pSource,pPrice)
	local pSrc = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)
    if user:getBalance() >= pPrice.param then
        if not raggsyFirstCreateChar then 
		user:removeBank(pPrice.param)
        else
         return true
        end
    else
        -- print("raggsy and riddle")
    end
    return true
end)

RPC.register("rd-clothing:getTextureNames",function(source,cb,name)
    local data = LoadResourceFile(GetCurrentResourceName(), "./client/names.json")
    data = json.decode(data)

    if data then
        cb(data[1][name])
    else 
        cb({})
    end
    return true
end)