
--// Post OP Server Side
RegisterServerEvent('rd-civjobs:post-op-payment')
AddEventHandler('rd-civjobs:post-op-payment', function()
    local src = tonumber(source)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(250, 325)
    user:addBank(payment)
    TriggerEvent('rd-base:postopLog', src, payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)

--// Water & Power Server Side
RegisterServerEvent('rd-civjobs:water-power-payme')
AddEventHandler('rd-civjobs:water-power-payme', function()
    local src = tonumber(source)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(250, 325)
    user:addBank(payment)
    TriggerEvent('rd-base:waterpowerLog', src, payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)

-- // Impounding System \\ --     

-- // Full Impound \\ --

RegisterNetEvent('rd-imp:FullImpound')
AddEventHandler('rd-imp:FullImpound', function(plate)
exports.oxmysql:execute("UPDATE characters_cars SET state = @state, garage = @garage, coords = @coords WHERE plate = @plate", {['garage'] = 'Full Impound', ['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)

-- // Impound Vehicle \\ --

RegisterNetEvent('rd-imp:NormalImpound')
AddEventHandler('rd-imp:NormalImpound', function(plate)
exports.oxmysql:execute("UPDATE characters_cars SET state = @state, garage = @garage, coords = @coords WHERE plate = @plate", {['garage'] = 'Normal Impound', ['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)

-- // Scuff Impound \\ --

RegisterNetEvent('rd-imp:ScuffImpound')
AddEventHandler('rd-imp:ScuffImpound', function(plate)
exports.oxmysql:execute("UPDATE characters_cars SET state = @state, coords = @coords WHERE plate = @plate", {['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)

--// Chicken Server Side

local DISCORD_WEBHOOK5 = ""
local DISCORD_NAME5 = "Chicken Selling Logs"

local STEAM_KEY = "0C007CC382AB06D1D99D9B45EC3924B1"
local DISCORD_IMAGE = "https://i.imgur.com/zviw6oW.png"

PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

local cachedData = {}

RegisterServerEvent('chickenpayment:pay')
AddEventHandler('chickenpayment:pay', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
	end
end)


function sendToDiscord5(name, message, color)
    local connect = {
      {
        ["color"] = color,
        ["title"] = "**".. name .."**",
        ["description"] = message,
      }
    }
    PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end

--// Fishing Server Side

RegisterServerEvent('rd-fishing:PayPlayer')
AddEventHandler('rd-fishing:PayPlayer', function(money)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(money)
    TriggerEvent('rd-base:fishingLog', src, money)
end)

RegisterServerEvent('rd-fishing:attempt_buy_rod')
AddEventHandler('rd-fishing:attempt_buy_rod', function()
	local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if user:getCash() >= 100 then
        user:removeMoney(100)
        TriggerClientEvent('player:receiveItem', src, 'fishingrod', 1)
    else
        TriggerClientEvent('DoLongHudText', src, 'You dont got enough money', 2)
    end
end)

--// Hunting Server Side

RegisterServerEvent('rd-hunting:skinReward')
AddEventHandler('rd-hunting:skinReward', function()
  local _source = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(source)
  local randomAmount = math.random(1,50)
  if randomAmount > 1 and randomAmount < 20 then
    TriggerClientEvent('player:receiveItem', _source, 'huntingcarcass1', 1)
  elseif randomAmount > 21 and randomAmount < 30 then
    TriggerClientEvent('player:receiveItem', _source, 'huntingcarcass2', 1)
  elseif randomAmount > 31 and randomAmount < 44 then
    TriggerClientEvent('player:receiveItem', _source, 'huntingcarcass3', 1)
  elseif randomAmount > 45 and randomAmount < 49 then
    TriggerClientEvent('player:receiveItem', _source, "huntingcarcass4", 1)
  end
end)

RegisterServerEvent('rd-hunting:removeBait')
AddEventHandler('rd-hunting:removeBait', function()
  local _source = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(source)
  TriggerClientEvent('inventory:removeItem', _source, "huntingbait", 1)
end)

RegisterServerEvent('complete:job')
AddEventHandler('complete:job', function(totalCash)
  local _source = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(source)
  user:addMoney(totalCash)
  TriggerEvent('rd-base:huntingLog', _source, totalCash)
end)

--// Rentals Server Side

RegisterServerEvent('rd-rentals:attemptPurchase')
AddEventHandler('rd-rentals:attemptPurchase', function(car)
	local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if car == "bison" then
        if user:getCash() >= 500 then
            user:removeMoney(500)
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "futo" then
        if user:getCash() >= 450 then
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
            user:removeMoney(450)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "buffalo" then
        if user:getCash() >= 750 then
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
            user:removeMoney(750)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "jackal" then
        if user:getCash() >= 625 then
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
            user:removeMoney(625)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "sultan" then
        if user:getCash() >= 1000 then
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
            user:removeMoney(1000)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "youga" then
        if user:getCash() >= 400 then
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
            user:removeMoney(400)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "faggio" then
        if user:getCash() >= 350 then
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)
            user:removeMoney(350)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    end
end)

RegisterServerEvent('rd-rentals:attemptPurchase1')
AddEventHandler('rd-rentals:attemptPurchase1', function(car)
	local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if car == "bison" then
        if user:getCash() >= 500 then
            user:removeMoney(500)
            TriggerClientEvent('rd-rentals:vehiclespawn', source, car)  -- ignore that shit im lazy
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    elseif car == "bmx" then
        if user:getCash() >= 50 then
            TriggerClientEvent('rd-rentals:vehiclespawn1', source, car)
            user:removeMoney(50)
        else
            TriggerClientEvent('rd-rentals:attemptvehiclespawnfail', source)
        end
    end
end)

-- Diving Job

RegisterServerEvent('rd-scuba:checkAndTakeDepo')
AddEventHandler('rd-scuba:checkAndTakeDepo', function()
local src = source
local user = exports["rd-base"]:getModule("Player"):GetUser(src)
if user:getCash() >= 400 then
    TriggerClientEvent('getDiveingjob',src)
    user:removeMoney(400)
else
    TriggerClientEvent('DoShortHudText',src, 'Not enough you need 400 $!',2)
    return end
end)

-- RegisterServerEvent('rd-scuba:returnDepo')
-- AddEventHandler('rd-scuba:returnDepo', function()
-- local src = source
-- local user = exports["rd-base"]:getModule("Player"):GetUser(src)
--     user:addMoney(200)
-- end)


RegisterServerEvent('rd-scuba:findTreasure')
AddEventHandler('rd-scuba:findTreasure', function()
local source = source
    local roll = math.random(1,8)
    print(roll)
    if roll == 1 then
        TriggerClientEvent('player:receiveItem', source, "corpsefeet", math.random(2,5))
    end
    if roll == 2 then
        TriggerClientEvent('player:receiveItem', source, 'stolen8ctchain', math.random(2,6))
    end
    if roll == 3 then
        TriggerClientEvent('player:receiveItem', source, 'stolen2ctchain', math.random(2,5))
    end
    if roll == 5 then
        TriggerClientEvent('player:receiveItem', source, "starrynight", math.random(1,2))
    end
    if roll == 6 then
        TriggerClientEvent('player:receiveItem', source, "shitlockpick", math.random(1,5))
    end
    if roll == 7 then
        TriggerClientEvent('player:receiveItem', source, "russian", math.random(1,1))
    end
    if roll == 8 then
        TriggerClientEvent('player:receiveItem', source, "ruby", math.random(1,1))
    end
end)

RegisterServerEvent('rd-scuba:paySalvage')
AddEventHandler('rd-scuba:paySalvage', function(money)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if money ~= nil then
        user:addMoney(tonumber(money))
    end
end)

RegisterServerEvent('rd-scuba:makeGold')
AddEventHandler('rd-scuba:makeGold', function()
 local source = source
 TriggerClientEvent('inventory:removeItem', source, 'umetal', 10)
 TriggerClientEvent("player:receiveItem", source, "goldbar", 1)
end)

-- Carwash

RegisterServerEvent('rd-carwash:checkmoney')
AddEventHandler('rd-carwash:checkmoney', function()
	local src = source
	local player = exports["rd-base"]:getModule("Player"):GetUser(src)
	local costs = 70

	if player:getCash() >= costs then
		TriggerClientEvent("rd-carwash:success", src, costs)
		player:removeMoney(costs)
	else
		moneyleft = costs - player:getCash()
		TriggerClientEvent('rd-carwash:notenoughmoney', src, moneyleft)
	end
end)

-- Impound

RegisterServerEvent('rd-impound:select_plate')
AddEventHandler('rd-impound:select_plate', function(pPlate)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `name`, `plate`, `cid`, `state`, `garage` FROM `characters_cars` WHERE plate = @plate",
    {['@plate'] = pPlate}, function(pValues)
        if pValues[1].garage == "Full Impound" or pValues[1].garage == "Normal Impound" then
            if char.id == pValues[1].cid then
                TriggerClientEvent('rd-impound:show_car', src, pValues[1].name, pValues[1].plate, false)
            else
                TriggerClientEvent('DoLongHudText', src, 'This isn\'t your vehicle.', 2)
            end
        else
            TriggerClientEvent('DoLongHudText', src, 'You\'re vehicle isnt in the impound.', 2)
        end
    end)
end)

RegisterServerEvent('rd-impound:release_car')
AddEventHandler('rd-impound:release_car', function(pPlate)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `name`, `plate`, `cid`, `garage` FROM `characters_cars` WHERE plate = @plate", {['@plate'] = pPlate}, function(pValues)
        if pValues[1].garage == "Full Impound" then
            if user:getCash() >= 1500 then
                user:removeMoney(1500)
                TriggerClientEvent('DoLongHudText', src, 'Go to the garage at the left side of the lot your vehicle should be in their (GARAGE ALTA) !')
                exports.oxmysql:execute('UPDATE `characters_cars` SET `garage` = @garage WHERE `plate` = @plate', { ['@garage'] = 'garage_alta', ['@plate'] = pPlate}, function()
                    exports.oxmysql:execute('UPDATE `characters_cars` SET `garage` = @garage WHERE `plate` = @plate',
                        {
                            ['@garage'] = 'garage_alta',
                            ['@plate'] = pPlate
                        }, function()
                    end)
                end)
            else
                TriggerClientEvent('DoLongHudText', src, 'It will cost $1500 to release your vehicle.')
            end
        elseif pValues[1].garage == "Normal Impound" then
            if user:getCash() >= 100 then
                user:removeMoney(100)
                TriggerClientEvent('DoLongHudText', src, 'Go to the garage at the left side of the lot your vehicle should be in their ! (GARAGE ALTA)')
                exports.oxmysql:execute('UPDATE `characters_cars` SET `garage` = @garage WHERE `plate` = @plate',
                    {
                        ['@garage'] = 'garage_alta',
                        ['@plate'] = pPlate
                    }, function()
                end)
            else
                TriggerClientEvent('DoLongHudText', src, 'It will cost $100 to release your vehicle.')
            end
        end
    end)
end)

-- Dumpster Diving --

local dumpsterItems = {
    [1] = {chance = 2, id = 'sandwich', quantity = math.random(1,2)},
    [2] = {chance = 2, id = 'water', quantity = math.random(1,2)},
    [3] = {chance = 7, id = 'lockpick', quantity = math.random(1,1)},
    [4] = {chance = 5, id = 'plastic', quantity = math.random(2,9)},
    [5] = {chance = 80, id = 'bdiamond', quantity = 1},
    [6] = {chance = 8, id = 'oxy', quantity = math.random(1,5)},
    [7] = {chance = 5, id = 'aluminium', quantity = math.random(5,10)},
    [8] = {chance = 5, id = 'steel', quantity = math.random(6,8)},
    [9] = {chance = 5, id = 'rubber', quantity = math.random(2,7)},
    [10] = {chance = 5, id = 'scrapmetal', quantity = math.random(2,7)},
    [11] = {chance = 15, id = 'advlockpick', quantity = math.random(1,2)},
    [12] = {chance = 3, id = 'bandage', quantity = math.random(1,4)},
    [13] = {chance = 2, id = 'cigarette', quantity = math.random(1,5)},
    [14] = {chance = 4, id = 'rollingpaper', quantity = math.random(1,5)},
    [15] = {chance = 9, id = 'coke5g', quantity = math.random(2,3)},
    [16] = {chance = 7, id = '1gcrack', quantity = math.random(2,4)},
    [17] = {chance = 6, id = 'maleseed', quantity = math.random(1,2)},
    [18] = {chance = 6, id = 'femaleseed', quantity = math.random(1,2)},
    [19] = {chance = 23, id = 'holybook', quantity = math.random(1,2)},
    [20] = {chance = 15, id = 'femaleseed', quantity = math.random(1,2)},
    [21] = {chance = 9, id = 'bandage', quantity = math.random(1,2)},
    [22] = {chance = 60, id = 'bodybag', quantity = 1},
    [23] = {chance = 30, id = 'bodygarbagebag', quantity = 1},
    [24] = {chance = 30, id = 'humanhead', quantity = 1},
    [25] = {chance = 40, id = 'humantorso', quantity = 1},
    [26] = {chance = 20, id = 'humanarm', quantity = 1},
    [27] = {chance = 15, id = 'humanhand', quantity = 1},
    [28] = {chance = 20, id = 'humanleg', quantity = 1},
    [29] = {chance = 15, id = 'humanfinger', quantity = 1},
    [30] = {chance = 15, id = 'humanear', quantity = 1},
    [31] = {chance = 17, id = 'humanbones', quantity = 1},
    [32] = {chance = 30, id = 'humanheart', quantity = 1},
    [33] = {chance = 21, id = 'humaneye', quantity = 1},
    [34] = {chance = 40, id = 'humankidney', quantity = 1},
    [35] = {chance = 50, id = 'humanlungs', quantity = 1},
    [36] = {chance = 14, id = 'humannail', quantity = 1},
    [37] = {chance = 20, id = 'humanpancreas', quantity = 1},
    [38] = {chance = 17, id = 'humantongue', quantity = 1},
    [39] = {chance = 16, id = 'humantooth', quantity = 1},
    [40] = {chance = 14, id = 'godbook', quantity = 1},
    [41] = {chance = 10, id = 'humannail', quantity = 1},
    [42] = {chance = 9, id = 'rolexwatch', quantity = math.random(1,2)},
    [43] = {chance = 19, id = 'stoleniphone', quantity = math.random(1,2)},
    [44] = {chance = 8, id = 'stolennokia', quantity = math.random(2,3)},
    [45] = {chance = 8, id = 'stolen5ctchain', quantity = math.random(1,2)},
    [46] = {chance = 8, id = 'stolencasiowatch', quantity = math.random(2,5)},
    [47] = {chance = 15, id = 'xscondom', quantity = 1},
    [48] = {chance = 33, id = 'zebra', quantity = 1},
    [49] = {chance = 10, id = 'cigar', quantity = 1},
}

RegisterServerEvent('rd:startDumpsterTimer')
AddEventHandler('rd:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('rd:giveDumpsterReward')
AddEventHandler('rd:giveDumpsterReward', function()
    local source = tonumber(source)
    local item = {}
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)
    local gotID = {}

    item = dumpsterItems[math.random(1, #dumpsterItems)]
    if math.random(1, 75) >= item.chance then
        if tonumber(item.id) == 0 and not gotID[item.id] then
            gotID[item.id] = true
            user:addMoney(item.quantity)
            TriggerClientEvent('DoLongHudText',  source, 'You found $'..item.quantity , 1)
        elseif not gotID[item.id] then
            gotID[item.id] = true
            TriggerClientEvent('player:receiveItem', source, item.id, item.quantity)
            TriggerClientEvent('DoLongHudText', source, 'You found '..item.id, 1)
        end
    else
        TriggerClientEvent('DoLongHudText', source, 'You found nothing!', 2)
    end
end)

function startTimer(id, object)
    local timer = 10 * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('rd:removeDumpster', id, object)
        end
    end
end

RegisterServerEvent('zyloz:payout')
AddEventHandler('zyloz:payout', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
        TriggerClientEvent('DoLongHudText', source, 'You got $'.. money .. '!', 1)
    end
end)