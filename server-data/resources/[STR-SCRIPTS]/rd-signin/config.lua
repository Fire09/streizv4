Blips = {
  { name = "Police Station 1", id = 60, coords = vector3(425.130, -979.558, 30.711)},
  { name = "Police Station 2", id = 60, coords = vector3(850.156677246094, -1283.92004394531, 28.0047378540039)},
  { name = "Police Station 4", id = 60, coords = vector3(-450.063201904297, 6016.5751953125, 31.7163734436035)},
  { name = "Police Station 3", id = 60, coords = vector3(1856.91320800781, 3689.50073242188, 34.2670783996582)},
  { name = "Police Station 5", id = 60, coords = vector3(376.258, -1597.649, 30.05)},
  { name = "Forensic HQ", id = 60, coords = vector3(638.8463134765, 1.44993293283, 82.78640747074)},
  { name = "Police Air HQ", id = 43, coords = vector3(449.359, -980.727, 42.60)},
  { name = "Prison", id = 60, coords = vector3(1679.049, 2513.711, 45.565)},
  { name = "Hospital", id = 61, coords = vector3(357.43, -593.36, 28.79)},
  { name = "LS Central Hospital", id = 61, coords = vector3(352.7247, -1399.782, 32.50)},
  { name = "Sandy Hospital", id = 61, coords = vector3(1672.112, 3665.182, 35.33)},
  { name = "Vespucci PD" , id = 60, coords = vector3(-1097.14, -829.4, 37.68)},
  { name = "Park Ranger Station" , id = 60, coords = vector3(382.8837, 796.874, 190.4853)},
  { name = "Vespucci Hospital", id = 61, coords = vector3(-817.48, -1227.66, 17.18)}
}

EVENTS = {
  POLICE_SIGN_IN = 1,
  POLICE_SIGN_OFF = 2,
  DOC_SIGN_IN = 4,
  DOC_SIGN_OFF = 8,
  EMS_SIGN_IN = 16,
  EMS_SIGN_OFF = 32,
  EMS_VOLUNTEER_SIGN_IN = 64,
  EMS_VOLUNTEER_SIGN_OFF = 128,
  EMS_VOLUNTEER_VEHICLE = 256,
  FIRE_DEPT_SIGN_IN = 512,
  FIRE_DEPT_SIGN_OFF = 1024,
  JUDGE_SIGN_IN = 2048,
  JUDGE_SIGN_OFF = 4096,
  PUBLIC_DEFENDER_SIGN_IN = 8192,
  PUBLIC_DEFENDER_SIGN_OFF = 16384,
  DISTRICT_ATTORNEY_SIGN_IN = 32768,
  DISTRICT_ATTORNEY_SIGN_OFF = 65536
}

VOLUNTEER_VEHICLES = {
  STANDARD = 1,
  FIRETRUCK = 2
}

MenuData = {
  officer_sign_in = {
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("police", "Police"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "police",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "police" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("doc", "DOC"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "doc",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "doc" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    }
  },
  ems_sign_in = {
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("ems", "EMS"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "ems",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "ems" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } },
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("doctor", "Doctor"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "doctor",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "doctor" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } },
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("therapist", "Therapist"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "therapist",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "therapist" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } },
      }
    }
  },
  ems_volunteer_sign_in = {
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("ems-volunteer", "EMS Volunteer"),
      description = _L("signin-in-or-out-vehicle", "Sign in/out, spawn vehicle"),
      key = "ems_volunteer",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "ems" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } },
          {
            i18nTitle = true,
            title = _L("spawn-vehicle", "Spawn Vehicle"),
            key = EVENTS.EMS_VOLUNTEER_VEHICLE,
            children = {
              { i18nTitle = true, i18nDescription = true, title = _L("ambulance", "Ambulance"), action = "rd-signin:spawnVehicle", key = VOLUNTEER_VEHICLES.STANDARD },
            }
        },
      }
    }
  },
  fire_dept_sign_in = {
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("fire-dept-volunteer", "Fire Dept Volunteer"),
      description = _L("signin-in-or-out-vehicle", "Sign in/out, spawn vehicle"),
      key = "fire_dept",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "ems" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } },
          {
            title = _L("spawn-vehicle", "Spawn Vehicle"),
            key = "fire_dept_vehicle",
            children = {
              { i18nTitle = true, i18nDescription = true, title = _L("firetruck", "Firetruck"), action = "rd-signin:spawnVehicle", key = VOLUNTEER_VEHICLES.FIRETRUCK },
            }
        },
      }
    }
  },
  public_services_sign_in = {
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("mayor", "Mayor"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "mayor",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "mayor" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("deputy-mayor", "Deputy Mayor"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "deputy_mayor",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "deputy_mayor" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("county-clerk", "County Clerk"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "county_clerk",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "county_clerk" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("judge", "Judge"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "judge",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "judge" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("public-defender", "Public Defender"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "defender",
      children = {
        { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "defender" } },
        { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    },
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("district-attorney", "District Attorney"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "District Attorney",
      children = {
        { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "district attorney" } },
        { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } }
      }
    }
  },
  driving_instructor_sign_in = {
    {
      i18nTitle = true,
      i18nDescription = true,
      title = _L("driving-instructor", "Driving Instructor"),
      description = _L("signin-in-or-out", "Sign in or sign out"),
      key = "driving_instructor",
      children = {
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-in", "Sign In"), action = "rd-signin:handler", key = { sign_in = true, job = "driving instructor" } },
          { i18nTitle = true, i18nDescription = true, title = _L("signin-sign-out", "Sign Out"), action = "rd-signin:handler", key = { sign_off = true } },
      }
    }
  }
}

VEHICLE_SPAWN_LOCATIONS = {
  vector3(-475.67788696289,-356.32354736328, 34.100078582764),
  vector3(364.68, -590.98, 28.69),
  vector3(218.34973144531, -1637.6884765625, 29.425844192505),
  vector3(-1182.3208007813, -1773.2825927734, 3.9084651470184),
  vector3(1198.3963623047, -1455.646484375, 34.967601776123),
  vector3(-843.68, -1229.8, 6.94) -- Vespucci Hospital
}
