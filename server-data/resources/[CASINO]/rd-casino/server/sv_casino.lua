RPC.register('rd-casino:purchaseMembershipCard',function(pCid)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if user:getCash() >= 250 then
          user:removeMoney(250)
          return true
    end
end)

RegisterServerEvent('rd-casino:purchaseChips')
AddEventHandler("rd-casino:purchaseChips", function(amount)
local src = source
local user = exports["rd-base"]:getModule("Player"):GetUser(src)
local cid = user:getCurrentCharacter().id
if user:getCash() >= tonumber(amount) then
    exports.oxmysql:execute("SELECT * FROM characters WHERE `id` = @cid",{["@cid"] = cid},function(lsl)
        if lsl[1] ~= nil then
            local lslIsTrash = lsl[1].casinoChips + tonumber(amount)
            exports.oxmysql:execute("UPDATE characters SET casinoChips=@amount WHERE id=@cid", {
                ["cid"] = cid,
                ["amount"] = lslIsTrash
            })
        end
    end)
    user:removeMoney(tonumber(amount))
    else
        TriggerClientEvent("DoLongHudText", src, "You don't have enough money!", 2)
    end
end)

RegisterServerEvent('rd-casino:withdrawChips')
AddEventHandler("rd-casino:withdrawChips", function(Type)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 
    local zeroMoney = "0"
    exports.oxmysql:execute("SELECT * FROM characters WHERE `id` = @cid",{["@cid"] = cid},function(lsl)
        if lsl[1] ~= nil then
            local lslIsTrash = lsl[1].casinoChips 
            if tonumber(lslIsTrash) > 0 then 
                if Type == "bank" then
                    user:addBank(tonumber(lslIsTrash))
                else
                    user:addMoney(tonumber(lslIsTrash))
                end
                exports.oxmysql:execute("UPDATE characters SET casinoChips=@amount WHERE id=@cid", {
                    ["cid"] = cid,
                    ["amount"] = zeroMoney
                })
            end
        end
    end)
end)

