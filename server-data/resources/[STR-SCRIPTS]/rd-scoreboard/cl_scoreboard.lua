local STX = STX or {}
STX.Scoreboard = {}
STX._Scoreboard = {}

STX.Scoreboard.Menu = {}

STX._Scoreboard.Players = {}
STX._Scoreboard.Recent = {}
STX._Scoreboard.SelectedPlayer = nil
STX._Scoreboard.MenuOpen = false
STX._Scoreboard.Menus = {}

local function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function STX.Scoreboard.AddPlayer(self, data)
    STX._Scoreboard.Players[data.src] = data
end

function STX.Scoreboard.RemovePlayer(self, data)
    STX._Scoreboard.Players[data.src] = nil
    STX._Scoreboard.Recent[data.src] = data
end

function STX.Scoreboard.RemoveRecent(self, src)
    STX._Scoreboard.Recent[src] = nil
end

function STX.Scoreboard.AddAllPlayers(self, data)
    STX._Scoreboard.Players[data.src] = data
end

local playerOnline

RegisterNetEvent("rd-scoreboard:playerscount")
AddEventHandler("rd-scoreboard:playerscount", function(a)
    playerOnline = a
end)

Citizen.CreateThread(function()
    local function DrawMain()
        if WarMenu.Button("Total:", tostring(playerOnline), {r = 135, g = 206, b = 250, a = 150}) then end

        for k,v in spairs(STX._Scoreboard.Players, function(t, a, b) return t[a].src < t[b].src end) do
            local playerId = GetPlayerFromServerId(v.src)

            if NetworkIsPlayerActive(playerId) or GetPlayerPed(playerId) == PlayerPedId() then
                if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options") then STX._Scoreboard.SelectedPlayer = v end
            else
                if WarMenu.MenuButton("[" .. v.src .. "] - instanced?", "options", {r = 255, g = 0, b = 0, a = 255}) then STX._Scoreboard.SelectedPlayer = v end
            end
        end

        

        if WarMenu.MenuButton("Recent D/C's", "recent") then
        end
    end

    local function DrawRecent()
        for k,v in spairs(STX._Scoreboard.Recent, function(t, a, b) return t[a].src < t[b].src end) do
            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.name, "options") then STX._Scoreboard.SelectedPlayer = v end
        end
    end

    local function DrawOptions()
        if WarMenu.Button("Steam ID:", STX._Scoreboard.SelectedPlayer.steamid) then end
        if WarMenu.Button("Community ID:", STX._Scoreboard.SelectedPlayer.comid) then end
        if WarMenu.Button("Server ID:", STX._Scoreboard.SelectedPlayer.src) then end
    end

    STX._Scoreboard.Menus = {
        ["scoreboard"] = DrawMain,
        ["recent"] = DrawRecent,
        ["options"] = DrawOptions
    }

    local function Init()
        WarMenu.CreateMenu("scoreboard", "Player List")
        WarMenu.SetSubTitle("scoreboard", "Players")

        WarMenu.SetMenuWidth("scoreboard", 0.5)
        WarMenu.SetMenuX("scoreboard", 0.71)
        WarMenu.SetMenuY("scoreboard", 0.017)
        WarMenu.SetMenuMaxOptionCountOnScreen("scoreboard", 30)
        WarMenu.SetTitleColor("scoreboard", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("scoreboard", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("scoreboard", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("scoreboard", 255, 255, 255, 255)

        WarMenu.CreateSubMenu("recent", "scoreboard", "Recent D/C's")
        WarMenu.SetMenuWidth("recent", 0.5)
        WarMenu.SetTitleColor("recent", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("recent", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("recent", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("recent", 255, 255, 255, 255)

        WarMenu.CreateSubMenu("options", "scoreboard", "User Info")
        WarMenu.SetMenuWidth("options", 0.5)
        WarMenu.SetTitleColor("options", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("options", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("options", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("options", 255, 255, 255, 255)
    end

    Init()
    timed = 0
    while true do
        for k,v in pairs(STX._Scoreboard.Menus) do
            if WarMenu.IsMenuOpened(k) then
                v()
                WarMenu.Display()
            else
                if timed > 0 then
                    timed = timed - 1
                end
            end
        end

        Citizen.Wait(1)
    end


end)

function STX.Scoreboard.Menu.Open(self)
    STX._Scoreboard.SelectedPlayer = nil
    WarMenu.OpenMenu("scoreboard")
end

function STX.Scoreboard.Menu.Close(self)
    for k,v in pairs(STX._Scoreboard.Menus) do
        WarMenu.CloseMenu(K)        shouldDraw =false    end
end

Controlkey = {["generalScoreboard"] = {303,"U"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
    Controlkey["generalScoreboard"] = table["generalScoreboard"]
end)

Citizen.CreateThread(function()
    local function IsAnyMenuOpen()
        for k,v in pairs(STX._Scoreboard.Menus) do
            if WarMenu.IsMenuOpened(k) then return true end
        end

        return false
    end

    while true do
        Citizen.Wait(0)
        if IsControlPressed(0, Controlkey["generalScoreboard"][1]) then
            if not IsAnyMenuOpen() then
                STX.Scoreboard.Menu:Open()
            end
        else
            if IsAnyMenuOpen() then STX.Scoreboard.Menu:Close() end
            Citizen.Wait(100)
        end
    end
end)

RegisterNetEvent("rd-scoreboard:RemovePlayer")
AddEventHandler("rd-scoreboard:RemovePlayer", function(data)
    STX.Scoreboard:RemovePlayer(data)
end)

RegisterNetEvent("rd-scoreboard:AddPlayer")
AddEventHandler("rd-scoreboard:AddPlayer", function(data)
    STX.Scoreboard:AddPlayer(data)
end)

RegisterNetEvent("rd-scoreboard:RemoveRecent")
AddEventHandler("rd-scoreboard:RemoveRecent", function(src)
    STX.Scoreboard:RemoveRecent(src)
end)

RegisterNetEvent("rd-scoreboard:AddAllPlayers")
AddEventHandler("rd-scoreboard:AddAllPlayers", function(data)
    STX.Scoreboard:AddAllPlayers(data)
end)