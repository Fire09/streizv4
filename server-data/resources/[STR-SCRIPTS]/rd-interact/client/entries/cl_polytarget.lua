local Entries = {}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'bar:grabDrink' },
    data = {
        {
            id = "bar:grabDrink",
            label = _L("interact-grab-drink", "Grab Drink"),
            icon = "circle",
            event = "rd-interact:grabDrink"
        }
    },
    options = {
        distance = { radius = 2.0 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'bar:openFridge' },
    data = {
        {
            id = "bar:openFridge",
            label = _L("interact-open-fridge", "Open Fridge"),
            icon = "circle",
            event = "rd-interact:openFridge"
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'polytarget',
  group = { 'tbar:chargeCustomer' },
  data = {
      {
          id = "tbar:chargeCustomer",
          label = _L("interact-charge-customer", "Charge Customer"),
          icon = "dollar-sign",
          event = "rd-tavern:peekAction",
          parameters = { action = "chargeCustomer" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'polytarget',
  group = { 'tbar:getBag' },
  data = {
      {
          id = "tbar:getBag",
          label = _L("interact-grab-bag", "Grab Bag"),
          icon = "circle",
          event = "rd-tavern:peekAction",
          parameters = { action = "getBag" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'polytarget',
  group = { 'tbar:craftToxicMenu' },
  data = {
      {
          id = "tbar:craftToxicMenu",
          label = _L("interact-be-toxic", "Be Toxic"),
          icon = "circle",
          event = "rd-tavern:peekAction",
          parameters = { action = "craftToxicMenu" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'townhall:gavel' },
    data = {
        {
            id = "townhall:gavel",
            label = _L("interact-use-gavel", "Use Gavel"),
            icon = "circle",
            event = "rd-gov:gavel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}


Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'officer_sign_in' },
    data = {
        {
            id = "officer_sign_in",
            label = _L("interact-duty-action", "Duty Action"),
            icon = "circle",
            event = "rd-signin:peekAction",
            parameters = { name = "officer" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'ems_sign_in' },
    data = {
        {
            id = "ems_sign_in",
            label = _L("interact-duty-action", "Duty Action"),
            icon = "circle",
            event = "rd-signin:peekAction",
            parameters = { name = "ems" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'ems_volunteer_sign_in' },
    data = {
        {
            id = "ems_volunteer_sign_in",
            label = _L("interact-duty-action", "Duty Action"),
            icon = "circle",
            event = "rd-signin:peekAction",
            parameters = { name = "ems_volunteer" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'fire_dept_sign_in' },
    data = {
        {
            id = "fire_dept_sign_in",
            label = _L("interact-duty-action", "Duty Action"),
            icon = "circle",
            event = "rd-signin:peekAction",
            parameters = { name = "fire_dept" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'public_services_sign_in' },
    data = {
        {
            id = "public_services_sign_in",
            label = _L("interact-duty-action", "Duty Action"),
            icon = "circle",
            event = "rd-signin:peekAction",
            parameters = { name = "public_services" }
        },
        {
            id = "public_services_legal_aid",
            label = _L("interact-duty-action", "Become Legal Aid"),
            icon = "circle",
            event = "rd-signin:legalAid",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'driving_instructor_sign_in' },
    data = {
        {
            id = "driving_instructor_sign_in",
            label = _L("interact-duty-action", "Duty Action"),
            icon = "circle",
            event = "rd-signin:peekAction",
            parameters = { name = "driving_instructor" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'rd-jail:prison_services' },
    data = {
        {
            id = "prison_services",
            label = _L("interact-prison-services", "Prison Services"),
            icon = "circle",
            event = "rd-jail:services",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}
Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'boosting_prepscratch' },
    data = {
        {
            id = "boosting_prepscratch",
            label = "Prepare Vin Scratch",
            icon = "laptop",
            event = "rd-boosting:client:UseComputer",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.0 },
        isEnabled = function(entity)
            return exports['rd-boosting']:pCanUseLaptop()
        end
    }
}

Citizen.CreateThread(function()
    for _, entry in ipairs(Entries) do
        if entry.type == 'flag' then
            AddPeekEntryByFlag(entry.group, entry.data, entry.options)
        elseif entry.type == 'model' then
            AddPeekEntryByModel(entry.group, entry.data, entry.options)
        elseif entry.type == 'entity' then
            AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
        elseif entry.type == 'polytarget' then
            AddPeekEntryByPolyTarget(entry.group, entry.data, entry.options)
        end
    end
end)
