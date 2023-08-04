local isSignedOn = false

local SignOn = {
    data = {
      {
        id = 'pp_sign_on',
        label = _L('interact-sign-in', 'sign in'),
        icon = 'lock',
        event = 'rd-business:pp:jobState',
        parameters = { signIn = true },
      },
    },
    options = {
      npcIds = { 'pixel_perfect_npc' },
      distance = { radius = 1.25 },
      isEnabled = function(pEntity, pContext)
        return IsEmployedAt("pixel_perfect") and not isSignedOn
      end,
    },
}
local SignOff = {
    data = {
      {
        id = 'pp_sign_off',
        label = _L('interact-sign-out', 'sign out'),
        icon = 'lock-open',
        event = 'rd-business:pp:jobState',
        parameters = { signIn = false },
      },
    },
    options = {
      npcIds = { 'pixel_perfect_npc' },
      distance = { radius = 1.25 },
      isEnabled = function(pEntity, pContext)
        return IsEmployedAt("pixel_perfect") and isSignedOn
      end,
    },
}
local OpenShop = {
    data = {{
        id = "pixel_perfect_npc_peek",
        label = _L("interact-pixel-perfect-shop", "Open Shop"),
        icon = "circle",
        event = "rd-npcs:ped:openPixelPerfectShop",
    }},
    options = {
        npcIds = {'pixel_perfect_npc'},
        distance = { radius = 1.25 }
    }
}

Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("rd-business:pixelPerfectArea", vector3(-659.17, -857.12, 24.52), 6.4, 10.0, {
        heading=0,
        minZ=23.42,
        maxZ=27.42
    })
    local data = {
        id = "pixel_perfect_npc",
        name = "Pixel Perfect",
        pedType = 4,
        model = "a_m_y_stwhi_02",
        networked = false,
        distance = 50.0,
        position = {
          coords = vector3(-662.56, -857.86, 24.00),
          heading = 358.2,
          random = false
        },
        appearance = nil,
        settings = {
            { mode = "invincible", active = true },
            { mode = "ignore", active = true },
            { mode = "freeze", active = true },
        },
        flags = {
            ['isNPC'] = true,
        },
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT"
    }

    local serverCode = exports["rd-config"]:GetServerCode()
    if serverCode == "wl" or serverCode == "dev" then
        exports['rd-npcs']:RegisterNPC(data, 'rd-business:pixelPerfectDev')
        exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, SignOn.data, SignOn.options)
        exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, SignOff.data, SignOff.options)
        exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, OpenShop.data, OpenShop.options)
    end
end)

AddEventHandler("rd-npcs:ped:openPixelPerfectShop", function()
    local canOpen = RPC.execute("rd-business:pixelPerfect:canUseNPC")

    if canOpen then
        TriggerEvent("server-inventory-open", "42129", "Shop")
    else
        TriggerEvent("DoLongHudText", _L("pp-speak-to-employee", "Please speak to one of our other employees."))
    end
end)

AddEventHandler("rd-business:pp:jobState", function(pParams, pEntity, pContext)
    isSignedOn = RPC.execute("rd-business:pixelPerfect:toggleJob", pParams.signIn)
end)
