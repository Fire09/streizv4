function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
  
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

local function playAnimation()
    LoadAnimationDic("amb@code_human_in_bus_passenger_idles@female@tablet@base")
    TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
    TriggerEvent("attachItemPhone", "tablet01")
end
  
  local jobs = {
    ["police"] = true,
    ["sheriff"] = true,
    ["state"] = true,
    ["ranger"] = true,
    ["doc"] = true,
    ["district_attorney"] = true,
    ["judge"] = true,
    ["ems"] = true,
  }
  
  function hasMdwAccess()
    local cj = exports["isPed"]:isPed("myJob")
    return jobs[cj] == true
  end
  
  Citizen.CreateThread(function()
    exports["rd-keybinds"]:registerKeyMapping("","Gov", "MDW", "+openMdw", "-openMdw")
    RegisterCommand("+openMdw", function()
      TriggerEvent("rd-mdw:openMDW", {})
    end, false)
    RegisterCommand("-openMdw", function() end, false)
  end)

  AddEventHandler("rd-mdw:openMDW", function(data)
    if not hasMdwAccess() and not data.fromCmd and not data.publicApp then return end
    local cj = exports["isPed"]:isPed("myJob")
    playAnimation()
    SetNuiFocus(true, true)
    SendReactMessage('openMDW', {
        show = true,
        publicApp = data.publicApp,
        job = cj
    })
  end)
  
  RegisterNUICallback("fetchUserInfo", function(data, cb)
    local first, last, rank, label, callsign = RPC.execute("fetchMdwInfo", exports["isPed"]:isPed("myJob"))
    cb({ data = {first = first, last = last, rank = rank, label = label, callsign = callsign} or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback("hideFrame", function()
    StopAnimTask(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 1.0)
    TriggerEvent("destroyPropPhone")
    SetPlayerControl(PlayerId(), 1, 0)
    SetNuiFocus(false, false)
  end)

  RegisterNetEvent("rd-ui:restartUI")
  AddEventHandler("rd-ui:restartUI", function()
    StopAnimTask(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 1.0)
    TriggerEvent("destroyPropPhone")
    SetPlayerControl(PlayerId(), 1, 0)
    SetNuiFocus(false, false)
    SendReactMessage('openMDW', {
      show = false,
      publicApp = true
    })
  end)
  
  RegisterNUICallback('rd-mdw:searchProfiles', function(data, cb)
    local value = data.value
    local data = RPC.execute("searchProfiles", value)
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:searchVehicles', function(data, cb)
    local value = data.value
    local data = RPC.execute("searchVehicles", value)
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:loadProfile', function(data, cb)
    local value = data.value
    local profile, licenses, vehicles, properties, storages, employment, priors = RPC.execute("loadProfile", value)
    cb({ data = {profile = profile, licenses = licenses, vehicles = vehicles, housing = properties, storages = storages, employment = employment, priors = priors} or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:loadVehicle', function(data, cb)
    local value = data.value
    local vehicle = RPC.execute("loadVehicle", value)
    cb({ data = {vehicle = vehicle} or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:editProfile', function(data, cb)
    local success, message = RPC.execute("editProfile", data.id, data.name, data.image, data.info)
    local profile, licenses, vehicles, properties, storages, employment, priors = RPC.execute("loadProfile", data.id)
    cb({ data = {profile = profile, licenses = licenses, vehicles = vehicles, housing = properties, storages = storages, employment = employment, priors = priors} or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:editVehicle', function(data, cb)
    local success, message = RPC.execute("editVehicle", data.id, data.image, data.info)
    local vehicle = RPC.execute("loadVehicle", data.id)
    cb({ data = {vehicle = vehicle} or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:loadIncident', function(data, cb)
    local value = data.value
    local data, id, title, info, evidence, officers, persons, criminals = RPC.execute("fetchIncident", value)
    cb({ data = {data = data, id = id, title = title, info = info, evidence = evidence, officers = officers, persons = persons, criminals = criminals} or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:loadIncidentEms', function(data, cb)
    local value = data.value
    local data, id, title, info, ems, persons = RPC.execute("fetchIncidentEms", value)
    cb({ data = {data = data, id = id, title = title, info = info, ems = ems, persons = persons} or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:loadEvidence', function(data, cb)
    local value = data.value
    local data, id, type, identifier, description, cid, incidentId, tags = RPC.execute("fetchEvidenceByID", value)
    cb({ data = {data = data, id = id, type = type, identifier = identifier, description = description, cid = cid, incidentId = incidentId, tags = tags} or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:updateIncident', function(data, cb)
    local data = RPC.execute("updateIncident", data.id, data.type, data.value, data.secondValue, data.add)
    cb({ data = {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:updateIncidentEms', function(data, cb)
    local data = RPC.execute("updateIncidentEms", data.id, data.type, data.value, data.secondValue, data.add)
    cb({ data = {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:saveCriminal', function(data, cb)
    local data = RPC.execute("saveCriminal", data.id, data.cid, data.value)
    cb({ data = {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:fetchBusinesses', function(data, cb)
    local data = RPC.execute("fetchBusinesses")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:loadBusiness', function(data, cb)
    local value = data.value
    local employees, count = RPC.execute("loadBusiness", value)
    cb({ data = {employees = employees, count = count} or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:fetchProperties', function(data, cb)
    local data = RPC.execute("fetchProperties")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:fetchCharges', function(data, cb)
    local data = RPC.execute("fetchCharges")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:fetchOfficers', function(data, cb)
    local data = RPC.execute("fetchOfficers")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:fetchStaff', function(data, cb)
    local data = RPC.execute("fetchStaff")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:fetchEms', function(data, cb)
    local data = RPC.execute("fetchEms")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:fetchIncidents', function(data, cb)
    local data = RPC.execute("fetchIncidents")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:fetchIncidentsEms', function(data, cb)
    local data = RPC.execute("fetchIncidentsEms")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:fetchEvidence', function(data, cb)
    local data = RPC.execute("fetchEvidence")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:fetchWarrants', function(data, cb)
    local data = RPC.execute("fetchWarrants")
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)
  
  RegisterNUICallback('rd-mdw:saveIncident', function(data, cb)
    local result = RPC.execute("saveIncident", data.id, data.shouldCreate, data.title, data.info, data.evidence, data.officers, data.persons)
    local incident, id, title, info, evidence, officers, persons, criminals = RPC.execute("fetchIncident", result)
    local incidents = RPC.execute("fetchIncidents")
    cb({ data = {incident = {data = incident, id = id, title = title, info = info, evidence = evidence, officers = officers, persons = persons, criminals = criminals}, incidents = incidents} or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:saveIncidentEms', function(data, cb)
    local result = RPC.execute("saveIncidentEms", data.id, data.shouldCreate, data.title, data.info, data.ems, data.persons)
    local incident, id, title, info, evidence, ems, persons = RPC.execute("fetchIncidentEms", result)
    local incidents = RPC.execute("fetchIncidentsEms")
    cb({ data = {incident = {data = incident, id = id, title = title, info = info, ems = ems, persons = persons}, incidents = incidents} or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:assignLicense', function(data, cb)
    local result = RPC.execute("assignLicense", data.cid, data.type)
    if not result then cb(false) return end
    cb(true)
  end)

  RegisterNUICallback('rd-mdw:removeLicense', function(data, cb)
    local result = RPC.execute("removeLicense", data.cid, data.type)
    if not result then cb(false) return end
    cb(true)
  end)

  RegisterNUICallback('rd-mdw:createWarrant', function(data, cb)
    local result = RPC.execute("createWarrant", data.cid, data.incidentId, data.expiry)
    local data = RPC.execute("fetchWarrants")
    if not result then cb({data = {}}) return end
    cb({data = data})
  end)

  RegisterNUICallback('rd-mdw:deleteWarrant', function(data, cb)
    local result = RPC.execute("deleteWarrant", data.id)
    local data = RPC.execute("fetchWarrants")
    if not result then cb({data = {}}) return end
    cb({data = data})
  end)

  RegisterNUICallback('rd-mdw:hireStaff', function(data, cb)
    local result = RPC.execute("hireStaff", data.cid, data.callsign, data.rank)
    local data = RPC.execute("fetchStaff")
    if not result then cb({data = {}}) return end
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)

  RegisterNUICallback('rd-mdw:fireStaff', function(data, cb)
    local result = RPC.execute("fireStaff", data.cid)
    local data = RPC.execute("fetchStaff")
    if not result then cb({data = {}}) return end
    cb({ data = data or {}, meta = { ok = true, message = "done" } })
  end)