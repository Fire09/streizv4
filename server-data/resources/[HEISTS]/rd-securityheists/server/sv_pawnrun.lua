RegisterServerEvent('rolexwatch:cash:payment')
AddEventHandler('rolexwatch:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(150 ,175))
end)

RegisterServerEvent('stolenpsp:cash:payment')
AddEventHandler('stolenpsp:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(250 ,300))
end)

RegisterServerEvent('stolens8:cash:payment')
AddEventHandler('stolens8:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(175 ,225))
end)

RegisterServerEvent('brokenGoods:cash:payment')
AddEventHandler('brokenGoods:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(250 ,325))
end)

RegisterServerEvent('stolen2ctchain:cash:payment')
AddEventHandler('stolen2ctchain:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(150 ,175))
end)

RegisterServerEvent('stolenraybans:cash:payment')
AddEventHandler('stolenraybans:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(50 ,100))
end)

RegisterServerEvent('stolencasiowatch:cash:payment')
AddEventHandler('stolencasiowatch:cash:payment', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:addMoney(math.random(100 ,125))
end)

RegisterServerEvent('moneybruh')
AddEventHandler('moneybruh', function()
    local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:removeMoney(25000)
end)

RegisterServerEvent('moneybruh2')
AddEventHandler('moneybruh2', function()
    local src = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    user:removeMoney(20000)
end)

RegisterServerEvent('rolexdelivery:server')
AddEventHandler('rolexdelivery:server', function(money)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= 500 then
        user:removeMoney(500)

		TriggerClientEvent("rolexdelivery:startDealing", src)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough for this', 2)
	end
end)