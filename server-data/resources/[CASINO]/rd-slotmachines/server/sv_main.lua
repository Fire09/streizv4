local slotMachines = {
    --[chairId] 
}
for i=0,127,1 do
    slotMachines[i] = false
end
local blackjackGameInProgress = {}
local blackjackGameData = {}
local not_won_yet = true
local jackPot = 10000
local payout = 0

RPC.register('rd-slotmachines-sv:checkIfSlotMachinesState',function()
    return true , jackPot
end)

RegisterServerEvent('rd-slotmachines-sv:getMachineData', function(data)
    TriggerClientEvent('rd-slotmachines-cl:getMachineData',-1,slotMachines)
end)

RegisterNetEvent("rd-slotmachines-sv:sitDownAtSlotMachine")
AddEventHandler("rd-slotmachines-sv:sitDownAtSlotMachine", function(chairId)
    local source = source
    if source ~= nil then
        for k,v in pairs(slotMachines) do 
            if v == source then 
                slotMachines[k] = false
                return
            end
        end
        slotMachines[chairId] = source
        TriggerClientEvent("rd-slotmachines-cl:updateMachineData",-1,slotMachines,source)
        TriggerClientEvent("rd-slotmachines-cl:sitDownAtSlotMachine",source,chairId)
    else
        TriggerClientEvent("DoLongHudText",source,"You can't sit you down.", 2)
    end
end)

RegisterNetEvent("rd-slotmachines-sv:getUpFromSlotMachine")
AddEventHandler("rd-slotmachines-sv:getUpFromSlotMachine", function(chairId)
    local source = source
    if source ~= nil then 
        for k,v in pairs(slotMachines) do 
            if v == source then 
                slotMachines[k] = false
            end
        end
        TriggerClientEvent("rd-slotmachines-cl:updateMachineData",-1,slotMachines)
    end
end)

RegisterNetEvent("rd-slotmachines-sv:spinMachine")
AddEventHandler("rd-slotmachines-sv:spinMachine", function(slotPos, model, betamount , cid ,pSlotID)
    local src = source
    local math = math.random(40)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src) 
    jackPot = jackPot + betamount
    payout = betamount * 3
    user:removeMoney(betamount)
    if math == 1 then
        spinReel('winner')
        TriggerClientEvent('rd-slotmachines-cl:playSlotMachineSound',src ,slotPos ,model, 'Beep_Red')
    elseif math == 2 then
        spinReel('loser')
    elseif math == 3 then
        spinReel('troll')
    elseif math > 3 then
        spinReel('loser')
    end
end)

-- Functions below .

function spinReel (pState)
    local src = source
    local rotA , rotB ,rotC = math.random(500) * 0.7 , math.random(500) * 0.9 , math.random(500) * 0.3
    local random = math.random(4)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if pState == 'loser' then
    Citizen.Wait(1200)
    TriggerClientEvent('rd-slotmachines-cl:stopReels',src,1,rotA)
    Citizen.Wait(1200)
    TriggerClientEvent('rd-slotmachines-cl:stopReels',src,2,rotB)
    Citizen.Wait(1200)
    TriggerClientEvent('rd-slotmachines-cl:stopReels',src,3,rotC)
    TriggerClientEvent('rd-slotmachines-cl:spinFinished',src, 0 )
    elseif pState == 'winner' then
        Citizen.Wait(1200)
        TriggerClientEvent('rd-slotmachines-cl:stopReels',src,1,1)
        Citizen.Wait(1200)
        TriggerClientEvent('rd-slotmachines-cl:stopReels',src,2,2)
        Citizen.Wait(1200)
        TriggerClientEvent('rd-slotmachines-cl:stopReels',src,3,3)
        TriggerClientEvent('rd-slotmachines-cl:spinFinished',src,payout)
        user:addMoney(payout)
    elseif pState == 'troll' then
        Citizen.Wait(1200)
        TriggerClientEvent('rd-slotmachines-cl:stopReels',src,1,1)
        Citizen.Wait(1200)
        TriggerClientEvent('rd-slotmachines-cl:stopReels',src,2,2)
        Citizen.Wait(1200)
        TriggerClientEvent('rd-slotmachines-cl:stopReels',src,3,22.43)
        TriggerClientEvent('rd-slotmachines-cl:spinFinished',src,0)
  end
    local winChance = math.random(1,1000)
    if winChance < 10 and not_won_yet and pState == 'winner' then 
        TriggerClientEvent('rd-slotmachines-cl:spinFinished',src, jackPot)
        user:addMoney(jackPot)
        TriggerClientEvent('chatMessage', -1, "^3[CASINO]", {255, 0, 0}, "Somebody just won the jackpot ! Total : " ..jackPot)
        jackPot = 10000
    end
end