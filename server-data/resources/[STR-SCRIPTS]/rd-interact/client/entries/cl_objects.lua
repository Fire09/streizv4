local Entries = {}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTrash' },
    data = {
        {
            id = 'trash',
            label = _L("interact-pickup-trash", "Pickup trash"),
            icon = "circle",
            event = "rd-jobs:sanitationWorker:pickupTrash",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.7 },
        -- is enabled check here
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isYogaMat' },
    data = {
        {
            id = 'yoga',
            label = _L("interact-yoga", "Yoga"),
            icon = "circle",
            event = "rd-healthcare:yoga",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return IsEntityTouchingEntity(PlayerPedId(), pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isExercise' },
    data = {
        {
            id = 'weights',
            label = _L("interact-weights", "Weights"),
            icon = "circle",
            event = "rd-healthcare:exercise",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2 },
    }
}

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isSmokeMachineTrigger' },
--     data = {
--         {
--             id = 'smoke_machine',
--             label = "Smoke Machine",
--             icon = "circle",
--             event = "rd-stripclub:smokemachine",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.2 },
--     }
-- }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isFuelPump' },
    data = {
        {
            id = 'jerrycan_refill',
            label = _L("interact-jerrycan-refill", "Refill Can"),
            icon = "circle",
            event = "vehicle:refuel:showMenu",
            parameters = { isJerryCan = true }
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return HasWeaponEquipped(GetHashKey('WEAPON_PetrolCan'))
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isVendingMachine' },
    data = {
        {
            id = 'vending_machine',
            label = _L("interact-vending-browse", "Browse"),
            icon = "shopping-basket",
            event = "shops:vendingMachine",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isChair' },
    data = {
        {
            id = 'sit_on_chair',
            label = _L("interact-sit", "Sit"),
            icon = "chair",
            event = "rd-emotes:sitOnChair",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isChair' },
  data = {
      {
          id = 'sit_on_vr_gopro_chair_pd',
          label = _L("interact-gopixel", "Enable GoPixel VR"),
          icon = "chair",
          event = "rd-gopro:activateVRChair",
          parameters = { type = "pd" }
      },
  },
  options = {
      distance = { radius = 1.5 },
      isEnabled = function(pEntity, pContext)
          local coords = GetEntityCoords(PlayerPedId())
          if #(coords - vector3(444.6,-997.42,34.98)) > 5.0 then
            return false
          end
          local model = GetEntityModel(pEntity)
          return model == 538002882
      end
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isATM' },
    data = {
        {
            id = 'use_atm',
            label = _L("interact-atm", "Use ATM"),
            icon = "credit-card",
            event = "bank:openatm",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isGoProVRChair' },
  data = {
      {
          id = 'sit_on_vr_gopro_chair',
          label = _L("interact-gopixel", "Enable GoPixel VR"),
          icon = "chair",
          event = "rd-gopro:activateVRChair",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWeedPlant' },
    data = {
        {
            id = 'weed',
            label = _L("interact-weedplant-check", "Check"),
            icon = "cannabis",
            event = "rd-weed:checkPlant",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isFuelPump' },
    data = {
        {
            id = 'use_gas',
            label = " Use Gas Pump",
            icon = "gas-pump",
            event = "rd-fuel:SelectFuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.7 },
        isEnabled = function(pEntity, pContext)
            return not exports['rd-oilers']:hasNozle()
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isFuelPump' },
    data = {
        {
            id = 'return_hose',
            label = "Return Hose",
            icon = "hand-holding",
            event = "rd-fuel:ReturnNozel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.7 },
        isEnabled = function(pEntity, pContext)
            return exports['rd-oilers']:hasNozle()
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isLrgWeedPlant' },
    data = {
        {
            id = 'weed2',
            label = _L("interact-weedplant-harvest", "Harvest"),
            icon = "hand-paper",
            event = "rd-weed:pickPlant",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isBeehive' },
  data = {
      {
          id = 'beehive1',
          label = _L("interact-beehive-check", "Check"),
          icon = "archive",
          event = "rd-beekeeping:checkBeehive",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 7.0 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isBeehive' },
  data = {
      {
          id = 'beehive2',
          label = _L("interact-beehive-harvest", "Harvest"),
          icon = "hand-holding-water",
          event = "rd-beekeeping:harvestHive",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 7.0 }
  }
}

Entries[#Entries + 1] = {
  type = 'model',
  group = { `np_prop_ch_cash_trolly_01c` },
  data = {
      {
          id = 'trolleygrab',
          label = _L("interact-trolley-grab", "Grab it!"),
          icon = "hand-holding",
          event = "rd-heists:grabFromTrolley",
          parameters = { type = "cash" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { `V_Club_Roc_MicStd` },
    data = {
        {
            id = 'microcboost',
            label = _L("interact-use-microphone", "Use Microphone"),
            icon = "circle",
            event = "rd-audio:useMicrophone",
            parameters = {},
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'model',
  group = { `np_prop_gold_trolly_01c` },
  data = {
      {
          id = 'trolleygrabgold',
          label = _L("interact-trolley-grab", "Grab it!"),
          icon = "hand-holding",
          event = "rd-heists:grabFromTrolley",
          parameters = { type = "gold" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

local benchCids = {
    [1004] = true,
    [3503] = true,
    [11670] = true,
}
Entries[#Entries + 1] = {
    type = 'model',
    group = {
        `prop_bench_01a`,
        `prop_bench_01b`,
        `prop_bench_01c`,
        `prop_bench_02`,
        `prop_bench_03`,
        `prop_bench_04`,
        `prop_bench_05`,
        `prop_bench_06`,
        `prop_bench_07`,
        `prop_bench_08`,
        `prop_bench_09`,
        `prop_bench_10`,
        `prop_bench_11`,
    },
    data = {
        {
            id = 'benchdismantle',
            label = _L("interact-trolley-grab", "Dismantle bench!"),
            icon = "circle",
            event = "rd-business:bench:dismantle",
            parameters = {},
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function()
            local cid = exports["isPed"]:isPed('cid')
            return benchCids[cid]
        end,
    }
}
Entries[#Entries + 1] = {
    type = 'model',
    group = {
        666561306,
        218085040,
        -58485588,
        682791951,
        -206690185,
        364445978,
        143369,
    },
    data = {
        {
            id = 'opendumpster',
            label = _L("interact-open-dumpster", "Open Stash"),
            icon = "box",
            event = "rd-inventory:openDumpster",
            parameters = {},
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function()
            return true
        end,
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
