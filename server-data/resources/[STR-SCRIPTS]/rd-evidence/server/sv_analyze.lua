RegisterNetEvent("rd-evidence:analyze", function()
    local src = source

    local inventory = exports["rd-inventory"]:getInventory("analyze_evidence")
    local item = inventory[1]

    if item and (string.find(item.item_id, "evidence") or item.item_id == "dnaswab") then
        local metadata = json.decode(item.information)

        if metadata.identifier == "FADED" or metadata.identifier == "Scratched off data" then
            TriggerClientEvent("DoLongHudText", src, "It was not possible to analyze this evidence.", 2)
            return
        end

        local updated = false

        if metadata["Estriamento"] then
            if metadata["Estriamento"] == "Não analisado" then
                if math.random(100) <= 70 then
                    metadata["Estriamento"] = metadata.identifier
                else
                    metadata["Estriamento"] = "Inconclusivo"
                end

                updated = true
            else
                TriggerClientEvent("DoLongHudText", src, "This evidence has already been analyzed.", 2)
            end
        elseif metadata["DNA"] then
            if metadata["DNA"] == "Não analisado" then
                if math.random(100) <= 80 or item.item_id == "dnaswab" then
                    metadata["DNA"] = metadata.identifier
                else
                    metadata["DNA"] = "Inconclusivo"
                end

                updated = true
            else
                TriggerClientEvent("DoLongHudText", src, "This evidence has already been analyzed.", 2)
            end
        end

        if updated then
            MySQL.update.await([[
                UPDATE inventory
                SET information = ?
                WHERE id = ?
            ]],
            { json.encode(metadata), item.id })
        end
    else
        TriggerClientEvent("DoLongHudText", src, "No evidence to analyze.", 2)
    end
end)

RegisterNetEvent("rd-evidence:dnaSwab", function(pTarget)
	local src = source

    local cid = exports["rd-base"]:getChar(pTarget, "id")
    if not cid then return end

    local dna = MySQL.scalar.await([[
        SELECT dna
        FROM characters
        WHERE id = ?
    ]],
    { cid })

    local data = {
        ["identifier"] = dna,
        ["DNA"] = "Not analyzed",
        ["_hideKeys"] = { "identifier" },
    }

    TriggerClientEvent("player:receiveItem", src, "dnaswab", 1, true, data)
    TriggerClientEvent("DoLongHudText", pTarget, "A DNA sample was collected!")
end)