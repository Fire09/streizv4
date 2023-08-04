function Login.decode(tableString)
    if tableString == nil or tableString =="" then
        return {}
    else
        return json.decode(tableString)
    end
end

RegisterServerEvent("login:getCharModels")
AddEventHandler("login:getCharModels", function(charlist, isReset)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)

    local list = ""
    for i=1,#charlist do
        if i == #charlist then
            list = list..charlist[i]
        else
            list = list..charlist[i]..","
        end
    end

    if charlist == nil or json.encode(charlist) == "[]" then
        TriggerClientEvent("login:CreatePlayerCharacterPeds", src, nil, isReset)
        return
    end

    exports.oxmysql:execute("SELECT cc.*, cf.*, ct.* FROM character_face cf LEFT JOIN character_current cc on cc.cid = cf.cid LEFT JOIN playerstattoos ct on ct.identifier = cf.cid WHERE cf.cid IN ("..list..")", {}, function(result)
        if result then 
            local temp_data = {}

            for k,v in pairs(result) do
                temp_data[v.cid] = {
                    model = v.model,
                    drawables = Login.decode(v.drawables),
                    props = Login.decode(v.props),
                    drawtextures = Login.decode(v.drawtextures),
                    proptextures = Login.decode(v.proptextures),
                    hairColor = Login.decode(v.hairColor),
                    headBlend = Login.decode(v.headBlend),
                    headOverlay= Login.decode(v.headOverlay),
                    headStructure = Login.decode(v.headStructure),
                    tattoos = Login.decode(v.tattoos),
                }
            end
            
            for i=1, #charlist do
                if temp_data[charlist[i]] == nil then
                    temp_data[charlist[i]] = nil
                end 
            end

            TriggerClientEvent("login:CreatePlayerCharacterPeds", src, temp_data, isReset)
        end
    end)
end)

RegisterServerEvent("rd-login:disconnectPlayer")
AddEventHandler("rd-login:disconnectPlayer", function()
    local src = source
    DropPlayer(src, "You DisConnected")
end)

RegisterServerEvent("rd-base:playerSessionStarted")
AddEventHandler("rd-base:playerSessionStarted", function()
    local src = source
    Citizen.CreateThread(function()
        Citizen.Wait(600000 * 3)
        local user = exports["rd-base"]:getModule("Player"):GetUser(src)
        if not user or not user:getVar("characterLoaded") then
            DropPlayer(src, "You timed out while choosing a character")
            return
        end
    end)
end)

RegisterServerEvent("rd-spawn:newPlayerFullySpawned")
AddEventHandler("rd-spawn:newPlayerFullySpawned", function()
    local src = source
    TriggerClientEvent("rd-spawn:getStartingItems", src)
    TriggerClientEvent("rd-spawn:getNewAccountBox", src)
    TriggerEvent("raggsyy:FirstCreateCharFalse", src)
end)

RegisterServerEvent("rd-spawn:initBoosting")
AddEventHandler("rd-spawn:initBoosting", function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local char = user:getVar("character")
    exports.oxmysql:execute("INSERT INTO boosting_users (identifier, level, gne, cooldown) VALUES (@identifier, @level, @gne, @cooldown)",
    {
        ['@identifier'] = char.id,
        ['@level'] = '0',
        ['@gne'] = '0',
        ['@cooldown'] ='0',
    })
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

        local users = exports["rd-base"]:getUsers()

        for user, vars in pairs(users) do
            if vars["char"] and vars["char"]["id"] then
                local ped = GetPlayerPed(user)
                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)
            end
        end
	end
end)

RPC.register("rd-spawn:canCreateHardcoreCharacter", function()
    local src = source
    local pData = 1
    TriggerEvent("rd-base:canCreateHardcoreCharacter", pData)
    return true
end)

RPC.register("rd-spawn:canCreateLiferCharacter", function()
    local src = source
    local pData = "2147483645"
    TriggerEvent("rd-base:canCreateLiferCharacter", pData)
    return true
end)