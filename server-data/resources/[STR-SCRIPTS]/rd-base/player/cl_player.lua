STX.Player = STX.Player or {}
STX.LocalPlayer = STX.LocalPlayer or {}

local function GetUser()
    return STX.LocalPlayer
end

function STX.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function STX.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function STX.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function STX.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("rd-base:networkVar")
AddEventHandler("rd-base:networkVar", function(var, val)
    STX.LocalPlayer:setVar(var, val)
end)

