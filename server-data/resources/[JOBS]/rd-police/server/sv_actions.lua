RegisterNetEvent("police:remmaskGranted")
AddEventHandler("police:remmaskGranted", function(pTarget)
    TriggerClientEvent("police:remmaskAccepted", pTarget)
end)

RegisterNetEvent("police:targetCheckInventory")
AddEventHandler("police:targetCheckInventory", function(pTarget, pFrisk)
    local src = source
	local user2 = exports["rd-base"]:getModule("Player"):GetUser(pTarget)
    local cid = user2:getCurrentCharacter()
    if not cid then return end

    if pFrisk then
        local inv = exports["rd-inventory"]:getInventory("ply-" ..cid.id)

        local hasWeapons = false

        for i, v in ipairs(inv) do
            if tonumber(v.item_id) then
                hasWeapons = true
                break
            end
        end

        if hasWeapons then
            TriggerClientEvent("chatMessage", src, "FRISK", 1, "Found Weapon")
        else
            TriggerClientEvent("chatMessage", src, "FRISK", 1, "Weapon not found")
        end
    else
        TriggerClientEvent("DoLongHudText", pTarget, "You are being searched")
        TriggerClientEvent("server-inventory-open", src, "1", ("ply-" ..cid.id))
    end
end)

RegisterNetEvent("police:targetCheckInventoryPerson")
AddEventHandler("police:targetCheckInventoryPerson", function(pTarget, pFrisk)
    local src = source
	local user2 = exports["rd-base"]:getModule("Player"):GetUser(pTarget)
    local cid = user2:getCurrentCharacter()
    if not cid then return end
        TriggerClientEvent("DoLongHudText", pTarget, "You are being searched")
        TriggerClientEvent("server-inventory-open", src, "1", ("ply-" ..cid.id))
end)

RegisterNetEvent("police:rob")
AddEventHandler("police:rob", function(pTarget)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local cash = user:getCash(pTarget)
        
    if cash > 0 then
        if user:removeMoney(pTarget, cash) then 
            user:addMoney(src, cash)
        end
    end
end)

RegisterNetEvent("police:gsr")
AddEventHandler("police:gsr", function(pTarget)
	local src = source

    local shotRecently = RPC.execute(pTarget, "police:gsr")

    if shotRecently then
        TriggerClientEvent("DoLongHudText", src, "We found gunpowder residue")
    else
        TriggerClientEvent("DoLongHudText", src, "We did not find any powder residue.")
    end
end)

RegisterServerEvent('police:checkBank')
AddEventHandler('police:checkBank', function(target)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(target)
    local char = user:getCurrentCharacter()
    balance = user:getBalance()
    local strng = " Bank: " .. balance
    TriggerClientEvent("DoLongHudText", src, strng)
end)


RegisterNetEvent("rd-jail:giveTicket", function(pTarget, pAmount, pComment)
    local src = source

    local cid = exports["rd-base"]:getChar(pTarget, "id")
    if not cid then
        TriggerClientEvent("DoLongHudText", src, "cid not found?", 2)
        return
    end

    local accountId = exports["rd-base"]:getChar(pTarget, "bankid")

    local success, message = exports["rd-financials"]:transaction(accountId, 1, pAmount, pComment, cid, 8)
    if not success then
        return false, TriggerClientEvent("DoLongHudText", src, message, 2)
    end

    TriggerClientEvent("DoLongHudText", src, "Fine sent successfully!")
    TriggerClientEvent("rd-phone:notification", pTarget, "fas fa-university", "Bank", "You received a fine of $" .. pAmount, 5000)
end)