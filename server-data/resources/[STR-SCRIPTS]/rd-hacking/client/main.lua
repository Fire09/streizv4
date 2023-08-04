local IsHacking = false

AddEventHandler('open:minigame', function(callback)
    Callbackk = callback
    openHack()
end)

function OpenHackingGame(puzzleDuration, puzzleLength, puzzleAmount, callback)
    Callbackk = callback
    openHack(puzzleDuration, puzzleLength, puzzleAmount)
end

RegisterNUICallback('callback', function(data, cb)
    closeHack()
    Callbackk(data.success)
    cb('ok')
end)

function openHack(puzzleDuration, puzzleLength, puzzleAmount)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        duration = puzzleDuration,
        length = puzzleLength,
        amount = puzzleAmount
    })
    IsHacking = true
end

function closeHack()
    SetNuiFocus(false, false)
    IsHacking = false
end

function GetHackingStatus()
    return IsHacking
end

RegisterNetEvent('fleecahackpractice')
AddEventHandler('fleecahackpractice', function()
    OpenHackingGame(8, 4, 5)
end)

RegisterNetEvent('pacifichackpractice')
AddEventHandler('pacifichackpractice', function()
    OpenHackingGame(8, 6, 5)
end)

RegisterNetEvent('rd-prachack')
AddEventHandler('rd-prachack', function()

	local hacking = {
		{
            title = "Fleeca Hack",
            description = "7 Seconds 4 Hack",
            action = 'rd-prachackfleecanui',
        },
        {
            title = "Pacific Hack",
            description = "7 Seconds 6 Hack",
            action = 'rd-prachackpacnui',
        },
    }
    exports["rd-ui"]:showContextMenu(hacking)
end)

RegisterUICallback('rd-prachackfleecanui', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('fleecahackpractice')
    TriggerEvent("inventory:DegenLastUsedItem", 5)  
end)

RegisterUICallback('rd-prachackpacnui', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('pacifichackpractice')
    TriggerEvent("inventory:DegenLastUsedItem", 5)  
end)

RegisterCommand("fleecatest", function()
    exports['rd-hacking']:OpenHackingGame(20, 5, 5, function(Success)
        print(Success)
        if Success then
            print("1")
        else
            print("2")
        end
end)
end)