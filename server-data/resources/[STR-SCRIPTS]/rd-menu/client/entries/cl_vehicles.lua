local VehicleEntries = MenuEntries['vehicles']

VehicleEntries[#VehicleEntries+1] = {
    data = {
        id = "vehicle-parkvehicle",
        title = _L("menu-vehicles-parkvehicle", "Park Vehicle"),
        icon = "#vehicle-parkvehicle",
        event = "vehicle:storeVehicle"
    },
    isEnabled = function(pEntity, pContext)
      return not IsDisabled() and exports['rd-vehicles']:HasVehicleKey(pEntity) and exports['rd-vehicles']:IsOnParkingSpot(pEntity, false) and not IsPedInAnyVehicle(PlayerPedId(), false)
    end
}

VehicleEntries[#VehicleEntries+1] = {
  data = {
      id = "impound-vehicle",
      title = _L("menu-vehicles-impoundrequest", "Impound Request"),
      icon = "#vehicle-impound",
      event = "rd-jobs:impound:openImpoundRequestMenu",
      parameters = {}
  },
  isEnabled = function(pEntity, pContext)
    return not IsDisabled() and pContext.distance <= 2.5 and not IsPedInAnyVehicle(PlayerPedId(), false)
  end
}

VehicleEntries[#VehicleEntries+1] = {
    data = {
        id = "impound-vehicle",
        title = _L("menu-vehicles-impoundvehicle", "Impound Vehicle"),
        icon = "#vehicle-impound",
        event = "rd-jobs:impound:openImpoundMenu",
    },
    isEnabled = function(pEntity, pContext)
      return not IsDisabled() and pContext.distance <= 2.5 and (CurrentJob == 'impound' or CurrentJob == 'pd_impound') and IsImpoundDropOff and not IsPedInAnyVehicle(PlayerPedId(), false)
    end
  }

VehicleEntries[#VehicleEntries+1] = {
  data = {
      id = "prepare-boat-trailer",
      title = _L("menu-vehicles-prepformount", "Prep for Mount"),
      icon = "#vehicle-plate-remove",
      event = "vehicle:primeTrailerForMounting"
  },
  isEnabled = function(pEntity, pContext)
    local model = GetEntityModel(pEntity)
    return not IsDisabled() and (model == `boattrailer` or model == `trailersmall`)
  end
}
