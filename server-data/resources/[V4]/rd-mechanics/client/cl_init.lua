SIGN_ON_ZONES = {
  {
    vector3(831.23, -819.78, 26.35), 1.8, 1, {
      heading = 0,
      minZ = 25.95,
      maxZ = 26.85,
      data = {
        biz = 'ottos_auto',
        id = 'ottos_checkin'
      }
    }
  },
  {
    vector3(1188.58, 2639.99, 38.4), 0.4, 1.8, {
      heading = 0,
      minZ = 37.8,
      maxZ = 39.2,
      data = {
        biz = 'harmony_repairs',
        id = 'harmony_checkin'
      }
    }
  },
  {
    vector3(-1426.68, -458.38, 35.9), 2.2, 1, {
      heading = 33,
      minZ = 35.5,
      maxZ = 36.5,
      data = {
        biz = 'hayes_autos',
        id = 'hayes_checkin',
      }
    }
  },
  {
    vector3(-1419.9, -444.78, 35.9), 33, 22.6, {
      heading = 300,
      minZ = 34.7,
      maxZ = 38.7,
      data = {
        biz = 'hazes',
        id = 'hazes_checkin',
      }
    }
  },
  {
    vector3(125.58, -3007.15, 7.04), 0.8, 1, {
      heading = 0,
      minZ = 6.64,
      maxZ = 7.44,
      data = {
        biz = 'tuner',
        id = 'tuner_checkin',
      }
    }
  },
  {
    vector3(1773.33, 3323.11, 41.45), 1, 1.4, {
      heading = 30,
      minZ = 41.05,
      maxZ = 41.85,
      data = {
        biz = 'iron_hog',
        id = 'ironhog_checkin',
      }
    }
  },
}



Citizen.CreateThread(function()
  SERVER_CODE = exports["rd-config"]:GetServerCode()
  -- sign on prompts
  for _, zone in ipairs(SIGN_ON_ZONES) do
    exports["rd-polytarget"]:AddBoxZone("mechanic_sign_on", table.unpack(zone))
  end

  exports['rd-interact']:AddPeekEntryByPolyTarget('mechanic_sign_on', {{
      event = "rd-mechanics:signOnPrompt",
      id = "mechanics_sign_on",
      icon = "clock",
      label = "Clock In",
      parameters = {}
  }}, { distance = { radius = 3.5 } , isEnabled = function(pEntity, pContext) return not SIGNED_IN end })

  exports['rd-interact']:AddPeekEntryByPolyTarget('mechanic_sign_on', {{
      event = "rd-mechanics:signOffPrompt",
      id = "mechanics_sign_off",
      icon = "clock",
      label = "Clock Out",
      parameters = {}
  }}, { distance = { radius = 3.5 } , isEnabled = isSignedOn })

  exports['rd-interact']:AddPeekEntryByPolyTarget('mechanic_sign_on', {{
      event = "rd-mechanics:viewActiveEmployees",
      id = "mechanics_active_employees",
      icon = "list",
      label = "View Active Employees",
  }}, { distance = { radius = 3.5 }, isEnabled = function(pEntity, pContext) return pContext.zones['mechanic_sign_on'] and exports['rd-business']:IsEmployedAt(pContext.zones['mechanic_sign_on'].biz) end })

  exports['rd-interact']:AddPeekEntryByPolyTarget('mechanic_sign_on', {{
    event = "rd-mechanics:setWorkHours",
    id = "mechanics_set_work_hours",
    icon = "history",
    label = "Set Work Hours",
  }}, { distance = { radius = 3.5 }, isEnabled = function(pEntity, pContext) return pContext.zones['mechanic_sign_on'] and exports['rd-business']:IsEmployedAt(pContext.zones['mechanic_sign_on'].biz) end })

  exports['rd-interact']:AddPeekEntryByPolyTarget('mechanic_sign_on', {{
    event = "rd-mechanics:viewWorkHours",
    id = "mechanics_view_work_hours",
    icon = "user-clock",
    label = "View Work Hours",
  }}, { distance = { radius = 3.5 }, isEnabled = function(pEntity, pContext)
      return pContext.zones['mechanic_sign_on'] and exports['rd-business']:IsEmployedAt(pContext.zones['mechanic_sign_on'].biz)
    end
  })
end)


