RegisterNetEvent("rd-pets:purchasePet")
AddEventHandler("rd-pets:purchasePet", function(params, name)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src) 
    local cid = user:getCurrentCharacter().id
    local price = tonumber(100)
    if not cid then return end

    if user:getCash() >= price then
        user:removeMoney(price)
        if params.type == "k9" then
            TriggerClientEvent("rd-pets:k9create", src, cid, params.model, params.deparment, name, math.random(0, params.variants))
        else
            TriggerClientEvent("rd-pets:petCreate", src, cid, params.model, name, math.random(0, params.variants))
        end
    else
        TriggerClientEvent("DoLongHudText", src, "You do not have $" .. price .. " with you", 2)
    end
end)