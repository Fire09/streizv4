RegisterServerEvent('rd-rental:checkcashpickaxe')
AddEventHandler("rd-rental:checkcashpickaxe",function(pSource,args)
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if (tonumber(user:getCash()) >= 250) then
        user:removeMoney(250)
        TriggerClientEvent("rd-mining:client:givepickaxe", source)
    else
        TriggerClientEvent("DoLongHudText", src, "Required amount $250 ", 2)
    end
end)

RegisterServerEvent('rd-rental:checkcashprobe')
AddEventHandler("rd-rental:checkcashprobe",function(pSource,args)
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if (tonumber(user:getCash()) >= 75) then
        user:removeMoney(75)
        TriggerClientEvent("rd-mining:client:giveminingprobe", source)
    else
        TriggerClientEvent("DoLongHudText", src, "Required amount $75 ", 2)
    end
end)

RegisterServerEvent('rd-rental:aluminium')
AddEventHandler("rd-rental:aluminium",function()
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    local cash = math.random(12, 15)
        user:addMoney(cash)
end)

RegisterServerEvent('rd-rental:glass')
AddEventHandler("rd-rental:glass",function()
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    local cash = math.random(9, 12)
        user:addMoney(cash)
end)

RegisterServerEvent('rd-rental:plastic')
AddEventHandler("rd-rental:plastic",function()
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    local cash = math.random(10, 13)
        user:addMoney(cash)
end)

RegisterServerEvent('rd-rental:copper')
AddEventHandler("rd-rental:copper",function()
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    local cash = math.random(12, 16)
        user:addMoney(cash)
end)

RegisterServerEvent('rd-rental:rubber')
AddEventHandler("rd-rental:rubber",function()
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    local cash = math.random(10, 14)
        user:addMoney(cash)
end)

RegisterServerEvent('rd-rental:scrapmetal')
AddEventHandler("rd-rental:scrapmetal",function()
	local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    local cash = math.random(17, 21)
        user:addMoney(cash)
end)