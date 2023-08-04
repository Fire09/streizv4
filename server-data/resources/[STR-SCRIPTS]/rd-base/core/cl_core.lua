STX.Core.hasLoaded = false


function STX.Core.Initialize(self)
    Citizen.CreateThread(function()
        while true do
            if NetworkIsSessionStarted() then
                TriggerEvent("rd-base:playerSessionStarted")
                TriggerServerEvent("rd-base:playerSessionStarted")
                break
            end
        end
    end)
end
STX.Core:Initialize()

AddEventHandler("rd-base:playerSessionStarted", function()
    while not STX.Core.hasLoaded do
        ---- print"waiting in loop")
        Wait(100)
    end
    ShutdownLoadingScreen()
    STX.SpawnManager:Initialize()
end)

RegisterNetEvent("rd-base:waitForExports")
AddEventHandler("rd-base:waitForExports", function()
    if not STX.Core.ExportsReady then return end

    while true do
        Citizen.Wait(0)
        if exports and exports["rd-base"] then
            TriggerEvent("rd-base:exportsReady")
            return
        end
    end
end)

RegisterNetEvent("customNotification")
AddEventHandler("customNotification", function(msg, length, type)

	TriggerEvent("chatMessage","SYSTEM",4,msg)
end)

RegisterNetEvent("base:disableLoading")
AddEventHandler("base:disableLoading", function()
    -- print"player has spawned ")
    if not STX.Core.hasLoaded then
         STX.Core.hasLoaded = true
    end
end)

Citizen.CreateThread( function()
    TriggerEvent("base:disableLoading")
end)


RegisterNetEvent("paycheck:client:call")
AddEventHandler("paycheck:client:call", function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("paycheck:server:send", cid)
end)

RegisterNetEvent("paycheck:collect:log:handler")
AddEventHandler("paycheck:collect:log:handler", function()
    TriggerServerEvent('paycheck:collect:log')
end)

function isCharacter(checkType)
	local checkType = string.lower(checkType)
	local pass = false

    if checkType == "femaleclothes" then
        pass = femaleclothes
    end
    if checkType == "maleclothes" then
        pass = maleclothes
    end


    if checkType == "gender" then
      pass = RPC.execute("rd-base:gender")
    end

    if checkType == "countpolice" then
        pass = RPC.execute("rd:counts", "police")
    end

    if checkType == "countems" then
        pass = RPC.execute("rd:counts", "ems")
    end

    if checkType == "counttaxi" then
        pass = curTaxi
    end

    if checkType == "counttow" then
        pass = curTow
    end

    if checkType == "countdoctors" then
        pass = curDoctors
    end

    if checkType == "intrunk" then
        pass = intrunk
    end

    if checkType == "robbing" then
        pass = robbing
    end

    if checkType == "passes" then
        pass = passes
    end

    if checkType == "myhousekeys" then
        pass = myhousekeys
    end

    if checkType == "dead" then
        pass = dead
    end

    if checkType == "gang" then
        pass = gang
    end

    if checkType == "cid" then
        pass = cid
    end

    if checkType == "incall" then
        pass = incall
    end

    if checkType == "handcuffed" then
        if handcuffedwalking or handcuffed then
            pass = true
        else
            pass = false
        end
    end

    if checkType == "phoneopen" then
        pass = phoneopen
    end

    if checkType == "twitterhandle" then
        pass = "@" .. Firstname .. "_" .. Lastname
    end

    if checkType == "fullname" then
      pass = Firstname .. " " .. Lastname
    end

    if checkType == "myjob" then
	    pass = job
    end

    if checkType == "mybank" then
	    pass = bank
    end

    if checkType == "mycash" then
	    pass = cash
    end

    if checkType == "weaponslicence" then
      if weaponsLicence == 1 then
        pass = 1
      else
        pass = 0
      end
    end

    if checkType == "hud" then
        pass = HudStage
    end
  
    if checkType == "licensestring" then
        pass = licenses
    end

    if checkType == "tasks" then
        pass = activeTasks
    end

    if checkType == "daytime" then
        pass = daytime
    end

    if checkType == "disabled" then
        if handcuffed or dead then
        	pass = true
        end
    end

    if checkType == "corner" then
        pass = gangType
    end

    return pass
    
end

--[[

    Variables

]]

local PlayerVars = PlayerVars or {}

local DefaultVars = {
    ["dead"] = false,
    ["handcuffed"] = false,
    ["recentcuff"] = 0,
    ["trunk"] = false,
    ["call"] = false,
}

--[[

    Functions

]]

function setVar(var, data)
    PlayerVars[var] = data
end

function getVar(var)
    return PlayerVars[var]
end

function setChar(var, data)
    if not PlayerVars["char"] then return end

    PlayerVars["char"][var] = data
end

function getChar(var)
    if PlayerVars["char"] then
        if var then
            return PlayerVars["char"][var]
        end

        return PlayerVars["char"]
    else
        return
    end
end

function resetVars()
    for k, v in pairs(DefaultVars) do
        PlayerVars[k] = v
    end
end

--[[

    Exports

]]

exports("setVar", setVar)
exports("getVar", getVar)
exports("setChar", setChar)
exports("getChar", getChar)
exports("resetVars", resetVars)

--[[

    Events

]]

RegisterNetEvent("rd-base:setVar")
AddEventHandler("rd-base:setVar", setVar)

RegisterNetEvent("rd-base:setChar")
AddEventHandler("rd-base:setChar", setChar)

RegisterNetEvent("rd-base:resetVars")
AddEventHandler("rd-base:resetVars", resetVars)

--[[

    Threads

]]

Citizen.CreateThread(function()
    resetVars()
end)

RegisterNetEvent('rd-collect:paycheck')
AddEventHandler('rd-collect:paycheck', function()
    TriggerServerEvent("paycheck:collect", exports["isPed"]:isPed("cid"))
end)