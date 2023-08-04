local lastPay = {}

RegisterNetEvent("cash:roll")
AddEventHandler("cash:roll", function(src, pAmount)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local amount = tonumber(pAmount)
    if user:getCash() >= amount then
        user:removeMoney(amount)
        TriggerClientEvent("player:receiveItem", src,"571920712",1, false,{amount = amount})
        return
    end

    return
end)

RegisterNetEvent("rd-financials:cash:get")
AddEventHandler("rd-financials:cash:get", function(pSource)
    TriggerClientEvent("rd-financials:cash", pSource, getCurrentCash(pSource))
end)

RegisterNetEvent("rd-financials:cash:give")
AddEventHandler("rd-financials:cash:give", function(pSource,pTargetId, pAmount)
    if pAmount <= 0 then return end

    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    if not user then return end

    local recipient = exports["rd-base"]:getModule("Player"):GetUser(pTargetId)
    if not recipient then return end

    if #(GetEntityCoords(GetPlayerPed(pSource)) - GetEntityCoords(GetPlayerPed(pTargetId))) > 3.0 then
        TriggerClientEvent("DoLongHudText", pSource, "You're too far to hand over any money.")
        return
    end

    if user == recipient then return end
    
    if getCurrentCash(pSource) - pAmount > 0 then
        TriggerClientEvent("doAnim", pSource, "id")
        user:removeMoney(pAmount)
        recipient:addMoney(pAmount)
        TriggerClientEvent("rd-financials:cash:give", pSource, getCurrentCash(pSource))
    else
        TriggerClientEvent("DoLongHudText", pSource, "You don't have enough money.fdsfsd")
        return
    end
end)


RPC.register("rd-financials:getCurrentCash", function(pSource)
    return getCurrentCash(pSource)
end)

RPC.register("GetCurrentCash", function(pSource)
    return getCurrentCash(pSource)
end)

function getCurrentCash(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local char = user:getCurrentCharacter()
    local currentCash = user:getCash()

    return currentCash
end

function doAddCashToUser(pSource, pAmount)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    if not user then return end

    if pAmount == 0 then return end

    local curTime = os.time()
    local _lastPay = lastPay[pSource]

    if _lastPay then
        if curTime - _lastPay.time <= 1 then
            _lastPay.count = lastPay.count + 1
        else
            _lastPay.count = 0
        end

        if _lastPay.acount >= 4 then
            exports["rd-log"]:AddLog("Exploiter", user, "User attempted to give themself money continually in less than 4 seconds", {money_to_give = total})
            DropPlayer(pSource, "[̲̅$̲̅(̲̅ ͡° ͜ʖ ͡°̲̅)̲̅$̲̅]")
            return false
        end
    else
        lastPay[pSource] = {time = curTime, count = 1}
    end

    user:addMoney(pAmount)

    return true
end

function admindoAddCashToUser(pSource, pAmount)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    if not user then return end

    if pAmount == 0 then return end

    user:addMoney(pAmount)

    return true
end

exports("admindoAddCashToUser", admindoAddCashToUser)
exports("DoAddCashToUser", doAddCashToUser)