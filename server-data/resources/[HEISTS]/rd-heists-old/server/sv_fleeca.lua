cooldownglobal = 0
Available = true

RegisterServerEvent("rd-fleeca:startcheck")
AddEventHandler("rd-fleeca:startcheck", function(bank)
    local _source = source
    globalonaction = true
    TriggerClientEvent('inventory:removeItem', _source, 'hacklaptop', 1)
    TriggerClientEvent("rd-fleeca:outcome", _source, true, bank)
end)

RegisterServerEvent("rd-fleeca:TimePoggers")
AddEventHandler("rd-fleeca:TimePoggers", function()
    local _source = source
    TriggerClientEvent("rd-fleeca:outcome", _source, false, "A bank as been recently robbed. You need to wait "..math.floor((fleeca.cooldown - (os.time() - cooldownglobal)) / 60)..":"..math.fmod((fleeca.cooldown - (os.time() - cooldownglobal)), 60))
end)

RegisterServerEvent("rd-fleeca:DoorAccessPoggers")
AddEventHandler("rd-fleeca:DoorAccessPoggers", function()
    local _source = source
    TriggerClientEvent("rd-fleeca:outcome", _source, false, "There is a bank currently being robbed.")
end)

RegisterServerEvent("rd-fleeca:lootup")
AddEventHandler("rd-fleeca:lootup", function(var, var2)
    TriggerClientEvent("rd-fleeca:lootup_c", -1, var, var2)
end)

RegisterServerEvent("rd-fleeca:openDoor")
AddEventHandler("rd-fleeca:openDoor", function(coords, method)
    TriggerClientEvent("rd-fleeca:openDoor_c", -1, coords, method)
end)

RegisterServerEvent("rd-fleeca:startLoot")
AddEventHandler("rd-fleeca:startLoot", function(data, name)
    TriggerClientEvent("rd-fleeca:startLoot_c", -1, data, name)
end)

RegisterServerEvent("rd-fleeca:stopHeist")
AddEventHandler("rd-fleeca:stopHeist", function(name)
    TriggerClientEvent("rd-fleeca:stopHeist_c", -1, name)
end)

RegisterServerEvent("rd-fleeca:rewardCash")
AddEventHandler("rd-fleeca:rewardCash", function()
    local reward = math.random(1, 2)
    local mathfunc = math.random(200)
    local rare = math.random(1,1)
    
    if mathfunc == 15 then
      TriggerClientEvent('rd-user:receiveItem', source, 'heistusb4', 1)
    end
    TriggerClientEvent("rd-user:receiveItem", source, "band", reward)
end)

RegisterServerEvent("rd-fleeca:setCooldown")
AddEventHandler("rd-fleeca:setCooldown", function(name)
    cooldownglobal = os.time()
    globalonaction = false
    TriggerClientEvent("rd-fleeca:resetDoorState", -1, name)
end)

RegisterServerEvent("rd-fleeca:getBanksSV")
AddEventHandler("rd-fleeca:getBanksSV", function()
    local banks = fleeca.Banks
    TriggerClientEvent('rd-fleeca:getBanks', -1, fleeca.Banks)
end)

local cooldownAttempts = 5

RegisterServerEvent("rd-fleeca:getHitSV")
AddEventHandler("rd-fleeca:getHitSV", function()
    TriggerClientEvent('rd-fleeca:getHit', -1, cooldownAttempts)
end)

RegisterServerEvent("rd-fleeca:getHitSVSV")
AddEventHandler("rd-fleeca:getHitSVSV", function(fleecaBanksTimes)
    cooldownAttempts = fleecaBanksTimes
end)

local doorCheckFleeca = false

RegisterServerEvent("rd-fleeca:getGetDoorStateSV")
AddEventHandler("rd-fleeca:getGetDoorStateSV", function()
    TriggerClientEvent('rd-fleeca:getDoorCheckCL', -1, doorCheckFleeca)
end)

RegisterServerEvent("rd-fleeca:getGetDoorStateSVSV")
AddEventHandler("rd-fleeca:getGetDoorStateSVSV", function(fleecaBanksDoors)
    doorCheckFleeca = fleecaBanksDoors
end)


RegisterServerEvent("rd-fleeca:getTimeSV")
AddEventHandler("rd-fleeca:getTimeSV", function()
    TriggerClientEvent('rd-fleeca:GetTimeCL', -1, cooldownglobal)
end)

RegisterServerEvent("rd-fleeca:getTime2SV")
AddEventHandler("rd-fleeca:getTime2SV", function()
    TriggerClientEvent('rd-fleeca:GetTime2CL', -1, (os.time() - fleeca.cooldown))
end)

RegisterServerEvent("rd-fleeca:getDoorAccessSV")
AddEventHandler("rd-fleeca:getDoorAccessSV", function()
    TriggerClientEvent('rd-fleeca:GetDoorAccessCL', -1, globalonaction)
end)

RegisterServerEvent('charge:fleeca')
AddEventHandler('charge:fleeca', function(amount, bankname)
  local _source = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(source)

    if user:getCash() >= amount then
        user:removeMoney(amount)
        TriggerClientEvent('str:bankemail', source, bankname)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough money!', 2)
    end
end)

RegisterServerEvent('rd-robbery:server:setBankState')
AddEventHandler('rd-robbery:server:setBankState', function(bankId, state)
    if bankId == "pacific" then
       print('[QUEER]')
    else
        if not robberyBusy then
            Config.SmallBanks[bankId]["isOpened"] = state
            TriggerClientEvent('rd-robbery:client:setBankState', -1, bankId, state)
            TriggerEvent('rd-robbery:server:SetSmallbankTimeout', bankId)
            TriggerEvent('str:bankstore', bankId, state)
        end
    end
    robberyBusy = true
end)

RegisterServerEvent('rd-robbery:server:SetSmallbankTimeout')
 AddEventHandler('rd-robbery:server:SetSmallbankTimeout', function(BankId)
     if not robberyBusy then
        Citizen.Wait(3600000)
        Config.SmallBanks[BankId]["isOpened"] = false
        timeOut = false
        robberyBusy = false
        TriggerClientEvent('rd-robbery:client:ResetFleecaLockers', -1, BankId)
        TriggerEvent('lh-banking:server:SetBankClosed', BankId, false)
     end
 end)


local Loot = false

RegisterServerEvent('rd-fleeca:tut_tut')
AddEventHandler('rd-fleeca:tut_tut', function()
    local src = source
    if not Loot then
        Loot = true
        TriggerClientEvent('rd-fleeca:grab', src)
        Citizen.Wait(40000)
        Loot = false
    end
end)

RegisterServerEvent('voidrp-heists:fleeca_availability')
AddEventHandler('voidrp-heists:fleeca_availability', function()
    local src = source
    
    if Available then
        TriggerClientEvent('rd-heists:fleeca_available', src)
    else
        TriggerClientEvent('rd-heists:fleeca_unavailable', src)
    end
end)

RegisterServerEvent('rd-heists:fleecaBankLog')
AddEventHandler('rd-heists:fleecaBankLog', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** np [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing a Fleeca Bank",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/1068506011780001823/FyqfcPz-WJ74zlBL0y5i7FTmZuz8rFw1vBtkAsiyIHkQcaouBdiQJaagRWwXcodRi0xA", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/982104385679159296/1059831718103744522/FAtwwr2.png"}), { ['Content-Type'] = 'application/json' })
end)