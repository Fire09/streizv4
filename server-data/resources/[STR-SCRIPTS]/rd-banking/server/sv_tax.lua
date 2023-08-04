taxLevels = {}

Citizen.CreateThread(function()
    local taxQuery = "SELECT * FROM _tax_level"
    local taxQuery2 = "SELECT * FROM _tax_category"
    local taxLevelData = Await(SQL.execute(taxQuery))
    local taxCategoryData = Await(SQL.execute(taxQuery2))

    for k, v in pairs(taxLevelData) do
        taxLevels[v.tax_category_id] = {}
        taxLevels[v.tax_category_id].level = v.tax_level
    end

    Wait(2000)

    for _, taxCategory in pairs(taxCategoryData) do
        taxLevels[taxCategory.id].name = taxCategory.name
    end
end)

-- pActualTaxPercentage [Optional]
-- If you set this paramter you will override the currentTaxRateWith whatever you set, i.e. good to use on old transactions
function taxOfSale(pSalesPrice, pTaxCategory, pActualTaxPercentage)
    local taxLevel = --[[pActualTaxPercentage or ]] getTaxLevel(pTaxCategory)
    return math.ceil(pSalesPrice - (pSalesPrice / (1 + (taxLevel / 100))))
end

function calculateTax(pSalesPrice, pTaxCategory)
    local taxLevel = getTaxLevel(pTaxCategory)
    local totalPrice = pSalesPrice + taxOfSale(pSalesPrice, pTaxCategory)

    return totalPrice
end

function purchaseTaxableItem(pSourceAccountId, pTargetAccountId, pPrice, pTaxType, pTransactionNote, pTargetAccountBalanceMinus)
    local price = calculateTax(pPrice, pTaxType)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)

   if user:getCash() < price then
        return { ok = false, message = "Not enough money :(" }
    end
    -- TODO: put tax in state acct
    -- TODO: put balance in pTargetAccountId minus pTargetAccountBalanceMinus
    local result = user:removeMoney(price)--adjustAccountBalance(pSourceAccountId, "remove", price)
    if not result then
        return { ok = false, message = "Could not adjust account balance" }
    end
    return { ok = true, price = price }
end

function cancelTaxableAsset(pAssetType, pAssetId)
    if not pAssetType then return false end
    if not pAssetId then return false end

    local cancelTaxQuery = [[
        DELETE FROM _tax_asset WHERE `asset_type` = ? and `asset_id` = ?
    ]]

    local pResult = Await(SQL.execute(cancelTaxQuery, pAssetType, pAssetId))

    return pResult.affectedRows > 0
end

function priceWithTaxString(pPrice, pTaxCategoryId)
    if not pPrice then return false end
    if not pTaxCategoryId then return false end
    local taxLevel = getTaxLevel(pTaxCategoryId)
    local totalPrice = pPrice + taxOfSale(pPrice, pTaxCategoryId)

    local data = { text = totalPrice..(" Incl. %s tax"):format(taxLevel.."%"), total = totalPrice}

    return data
end

function hasOutStandingTaxPayments(pCharacterId, pAssetType)
    if not pCharacterId then return false end

    local hasDebtQuery = [[
        SELECT TRUE as 'HAS_ANY_DEBT' FROM _tax_payment tp INNER JOIN _tax_asset ta ON ta.id = tp.tax_payment_id WHERE ta.asset_owner_id = ? AND !tp.is_paid
    ]]

    if pAssetType then
        hasDebtQuery = hasDebtQuery .. " AND asset_type = ?"
    end

    hasDebtQuery = hasDebtQuery .. " LIMIT 1"

    return Await(SQL.scalar(hasDebtQuery, pCharacterId, pAssetType)) or false
end

function getTaxLevelById(pTaxCategoryId)
    local categoryId = tonumber(pTaxCategoryId)
    if taxLevels[categoryId] then
        return taxLevels[categoryId].level
    else
        return 0
    end
end

function getTaxLevelByName(pTaxCategoryName)
    if not pTaxCategoryName then return false end

    for k, v in pairs(taxLevels) do
        if v.name == pTaxCategoryName then
            return v.level
        end
    end

    print("[1] No tax level found for "..pTaxCategoryName)

    return 0
end

function getTaxCategoryIdByName(pTaxCategoryName)
    if not pTaxCategoryName then return false end

    for k, v in pairs(taxLevels) do
        if v.name == pTaxCategoryName then
            return k
        end
    end

    print("[2] No tax level found for "..pTaxCategoryName)

    return 0
end

function getTaxLevel(pTaxCategory)
    if (type(pTaxCategory) == "number") then
        return getTaxLevelById(pTaxCategory)
    elseif (type(pTaxCategory) == "string") then
        return getTaxLevelByName(pTaxCategory)
    end

    return 0
end

exports("GetTaxLevel", getTaxLevel)
exports("GetTaxLevelById", getTaxLevelById)
exports("PriceWithTaxString", priceWithTaxString)
exports("CalculateTax", calculateTax)
exports("TaxOfSale", taxOfSale)
exports("GenerateTaxableAsset", generateTaxableAsset)
exports("CancelTaxableAsset", cancelTaxableAsset)
exports("purchaseTaxableItem", purchaseTaxableItem)
exports("HasOutstandingTaxPayments", hasOutStandingTaxPayments)