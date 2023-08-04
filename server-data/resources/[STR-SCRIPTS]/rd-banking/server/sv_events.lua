

RPC.register("GetTaxLevel", function(pSource, pType)
    if (type(pType) == "string") then
        return getTaxLevelByName(pType)
    elseif (type(pType) == "number") then
        return getTaxLevelById(pType)
    end

    return false, "Invalid type"
end)

RPC.register("PriceWithTaxStrings", function(pSource, pPrice, pTaxLevel)
    return priceWithTaxString(pPrice, pTaxLevel)
end)

RPC.register("GetTaxLevels", function(source, pOnlyEditable)
    return getTaxLevels(pOnlyEditable)
end)

RPC.register("GetTaxHistory", function(source)
    return getTaxHistory()
end)

RPC.register("SetTaxLevel", function(source, pNewTaxLevels)
    return setTaxLevel(pNewTaxLevels)
end)

RPC.register("GetAssetTaxes", function(source, pCharacterId)
    return getAssetTaxes(pCharacterId)
end)

RPC.register("PayAssetTaxes", function(source, pCharacterId, pSourceAccountId, pAssetTaxId, pAssetName)
    return payAssetTaxes(pCharacterId, pSourceAccountId, pAssetTaxId, pAssetName)
end)

RPC.register("CalculateTax", function(pSource, pSalePrice, pTaxLevel)
    return calculateTax(pSalePrice, pTaxLevel)
end)


RPC.register("doStateForfeiture", function(pSource, pAmount)
    return doStateForfeiture(pSource, pAmount)
end)
