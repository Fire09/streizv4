local ipls = {
  { "ex_dt1_02_office_01a", 236289 },
  { "ex_dt1_02_office_01b", 236545 },
  { "ex_dt1_02_office_01c", 236801 },
  { "ex_dt1_02_office_02a", 237057 },
  { "ex_dt1_02_office_02b", 237313 },
  { "ex_dt1_02_office_02c", 237569 },
  { "ex_dt1_02_office_03a", 237825 },
  { "ex_dt1_02_office_03b", 238081 },
  { "ex_dt1_02_office_03c", 238337 },
}

local props = {
  "cash_set_01",
  "cash_set_02",
  "cash_set_03",
  "cash_set_04",
  "cash_set_05",
  "cash_set_06",
  "cash_set_07",
  "cash_set_08",
  "cash_set_09",
  "cash_set_10",
  "cash_set_11",
  "cash_set_12",
  "cash_set_13",
  "cash_set_14",
  "cash_set_15",
  "cash_set_16",
  "cash_set_17",
  "cash_set_18",
  "cash_set_19",
  "cash_set_20",
  "cash_set_21",
  "cash_set_22",
  "cash_set_23",
  "cash_set_24",
  "swag_booze_cigs",
  "swag_booze_cigs2",
  "swag_booze_cigs3",
  "swag_counterfeit",
  "swag_counterfeit2",
  "swag_counterfeit3",
  "swag_drugbags",
  "swag_drugbags2",
  "swag_drugbags3",
  "swag_drugstatue",
  "swag_drugstatue2",
  "swag_drugstatue3",
  "swag_electronic",
  "swag_electronic2",
  "swag_electronic3",
  "swag_furcoats",
  "swag_furcoats2",
  "swag_furcoats3",
  "swag_gems",
  "swag_gems2",
  "swag_gems3",
  "swag_guns",
  "swag_guns2",
  "swag_guns3",
  "swag_ivory",
  "swag_ivory2",
  "swag_ivory3",
  "swag_jewelwatch",
  "swag_jewelwatch2",
  "swag_jewelwatch3",
  "swag_med",
  "swag_med2",
  "swag_med3",
  "swag_art",
  "swag_art2",
  "swag_art3",
  "swag_pills",
  "swag_pills2",
  "swag_pills3",
  "swag_silver",
  "swag_silver2",
  "swag_silver3",
}

-- ex_office_01b_sofa02
-- ex_office_01b_consolemod002
-- ex_mp_h_stn_chairstrip_011
-- ex_office_01b_rug
local shouldfuck = {
  "ex_office_01b_sofa02",
  "ex_office_01b_consolemod002",
  "ex_mp_h_stn_chairstrip_011",
  "ex_mp_h_tab_coffee_08",
  "ex_mp_h_acc_candles_01",
}

-- 
local sultan = `lp700`
local SultanVehicle = nil

Citizen.CreateThread(function()
  SultanVehicle()
end)

function SultanVehicle()
  SultanVehicle = CreateVehicle(sultan, -133.16, -643.63, 168.31 - 0.5, 326.37, 0, 0)

  FreezeEntityPosition(SultanVehicle, true)
  SetEntityInvincible(SultanVehicle, true)

  SetVehicleDirtLevel(SultanVehicle, 0.0)

  SetVehicleExtra(SultanVehicle, 1, 1)
  SetVehicleExtra(SultanVehicle, 2, 1) 
  SetVehicleExtra(SultanVehicle, 3, 1)
  SetVehicleExtra(SultanVehicle, 4, 0)

  SetVehicleLivery(SultanVehicle, 0)

  SetVehicleColours(SultanVehicle, 12, 12)
  SetVehicleWindowTint(SultanVehicle, 1)
  SetVehicleHeadlightsColour(SultanVehicle, 2)

  SetVehicleDirtLevel(SultanVehicle, 0.0)
  SetVehicleNumberPlateTextIndex(SultanVehicle, 1)
  SetVehicleNumberPlateText(SultanVehicle, "Jeremy")
  SetVehicleDoorsLocked(SultanVehicle, 1)

  SetVehicleModKit(SultanVehicle, 0, true)
  SetVehicleMod(SultanVehicle, 11, 2, true) -- ENGINE
  SetVehicleMod(SultanVehicle, 12, 2, true) -- BRAKES 
  SetVehicleMod(SultanVehicle, 13, 2, true) -- GEARBOX
  SetVehicleMod(SultanVehicle, 15, 3, true) -- SUSPENSION
  SetVehicleMod(SultanVehicle, 16, 4, true) -- ARMOUR
  SetVehicleMod(SultanVehicle, 18, 1, true) -- TURBO
  SetVehicleMod(SultanVehicle, 22, 8, true) -- XENON_LIGHTS
end

local currentJob = "none"

RegisterNetEvent("rd-jobmanager:playerBecameJob", function(job)
  currentJob = job
end)

function clearIpls()
  for _, ipl in pairs(ipls) do
    local intId = ipl[2]
    DeactivateInteriorEntitySet(intId, "office_chairs")
    for _, prop in pairs(props) do
      DeactivateInteriorEntitySet(intId, prop)
    end
    for _, ipl in pairs(ipls) do
      RemoveIpl(ipl[1])
    end
  end
end

function setIpls(pNumber)
  local ipl = ipls[pNumber][1]
  local intId = ipls[pNumber][2]
  RequestIpl(ipl)
  if pNumber ~= 4 then
    ActivateInteriorEntitySet(intId, "office_chairs")
  end
  for _, prop in pairs(props) do
    DeactivateInteriorEntitySet(intId, prop)
  end
  RefreshInterior(intId)
end

function gotoOffice(pOffice, pBucketString)
  local finished = exports["rd-taskbar"]:taskBar(3000, "Waiting for Elevator")
  if finished ~= 100 then return end
  local bucketString = pBucketString and pBucketString or "cbc_"
  DoScreenFadeOut(400)
  Wait(600)
  clearIpls()
  setIpls(pOffice)
  RPC.execute("rd-infinity:setWorld", bucketString .. pOffice, "inactive", true)
  SetEntityCoords(PlayerPedId(), vector3(-141.1987, -620.913, 168.8205))
  SetEntityHeading(PlayerPedId(), 273.58)
  Wait(400)
  DoScreenFadeIn(1000)
end

function leaveOffice()
  local finished = exports["rd-taskbar"]:taskBar(3000, "Waiting for Elevator")
  if finished ~= 100 then return end
  DoScreenFadeOut(400)
  Wait(600)
  SetEntityCoords(PlayerPedId(), vector3(-126.62,-585.08,35.08))
  SetEntityHeading(PlayerPedId(), 159.6)
  RPC.execute("rd-infinity:setWorld", "default")
  Wait(400)
  DoScreenFadeIn(1000)
end

RegisterNetEvent("rd-cbc:office", function(pOffice, pBucketString)
  gotoOffice(pOffice, pBucketString)
end)
RegisterNetEvent("rd-cbc:officeLeave", function()
  leaveOffice()
end)

AddEventHandler("rd-cbc:showElevatorOptions", function()
  exports['rd-ui']:showContextMenu({
    {
      title = "Lock Offices",
      description = "Lock Down All Offices",
      action = "rd-cbc:doContextAction",
      key = { type = "lock" },
    },
    {
      title = "Unlock Offices",
      description = "Unlock All Offices",
      action = "rd-cbc:doContextAction",
      key = { type = "unlock" },
    },
    {
      title = "Preview Office",
      description = "1",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 1 },
    },
    {
      title = "Preview Office",
      description = "2",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 2 },
    },
    {
      title = "Preview Office",
      description = "3",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 3 },
    },
    {
      title = "Preview Office",
      description = "4",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 4 },
    },
    {
      title = "Preview Office",
      description = "5",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 5 },
    },
    {
      title = "Preview Office",
      description = "6",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 6 },
    },
    {
      title = "Preview Office",
      description = "7",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 7 },
    },
    {
      title = "Preview Office",
      description = "8",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 8 },
    },
    {
      title = "Preview Office",
      description = "9",
      action = "rd-cbc:doContextAction",
      key = { type = "preview", office = 9 },
    },
  })
end)

RegisterUICallback('rd-cbc:doContextAction', function (data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  local cid = exports["isPed"]:isPed("cid")
  local isEmployee = RPC.execute("IsEmployedAtBusiness", { character = { id = cid }, business = { id = "cerberus"} })
  if (data.key.type == "lock" or data.key.type == "unlock") and (not isEmployee) then
    TriggerEvent("DoLongHudText", "You cannot do that.", 2)
    return
  end
  TriggerServerEvent("rd-cbc:StriezOfficeInformation", data.key)
  RPC.execute("rd-cbc:doElevatorAction", data.key)
end)

AddEventHandler("rd-cbc:addBusiness", function()
  local isEmployee = RPC.execute("IsEmployedAtBusiness", {
    character = {
      id = exports['isPed']:isPed('cid'),
    },
    business = {
      id = "cerberus",
    },
  })
  if not isEmployee then
    TriggerEvent("DoLongHudText", "You cannot do that.", 2)
    return
  end
  local creationMenu = {
    key = 1,
    show = true,
    callbackUrl = "rd-ui:cbc:addBusiness",
    items = { },
  }
  local _, businesses = RPC.execute("GetBusinesses")
  local businessOptions = {}
  for _, business in pairs(businesses) do
    businessOptions[#businessOptions + 1] = {
      name = business.business_name,
      id = business.business_id,
    }
  end
  local officeOptions = {
    { name = "1", id = 1 },
    { name = "2 (Window)", id = 2 },
    { name = "3", id = 3 },
    { name = "4", id = 4 },
    { name = "5 (Window)", id = 5 },
    { name = "6", id = 6 },
    { name = "7", id = 7 },
    { name = "8", id = 8 },
    { name = "9 (Window)", id = 9 },
  }
  creationMenu.items = {
    { icon = "id-card", _type = "select", name = "business_id", label = "Select Business", options = businessOptions },
    { icon = "id-card", _type = "select", name = "office_type", label = "Office Type", options = officeOptions },
  }
  exports["rd-ui"]:openApplication("textbox", creationMenu)
end)

RegisterUICallback("rd-ui:cbc:addBusiness", function(pData, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  TriggerServerEvent("rd-cbc:addBusinessToCenterStriez", pData.values)
  RPC.execute("rd-cbc:addBusinessToCenter", pData.values)
end)

AddEventHandler("rd-cbc:deleteBusiness", function()
  local isEmployee = RPC.execute("IsEmployedAtBusiness", {
    character = {
      id = exports['isPed']:isPed('cid'),
    },
    business = {
      id = "cerberus",
    },
  })
  if not isEmployee then
    TriggerEvent("DoLongHudText", "You cannot do that.", 2)
    return
  end
  local creationMenu = {
    key = 1,
    show = true,
    callbackUrl = "rd-ui:cbc:deleteBusiness",
    items = { },
  }
  local offices = RPC.execute("rd-cbc:getCreatedOffices")
  local officeOpts = {}
  for _, office in pairs(offices) do
    officeOpts[#officeOpts + 1] = {
      name = office.offices_business_name .. " (" .. office.offices_business_id .. ")",
      id = office.offices_business_id,
    }
  end
  creationMenu.items = {
    { icon = "id-card", _type = "select", name = "cbc_id", label = "Select Office", options = officeOpts },
  }
  exports["rd-ui"]:openApplication("textbox", creationMenu)
end)

RegisterUICallback("rd-ui:cbc:deleteBusiness", function(pData, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  raggsyy = pData.values.cbc_id
  TriggerServerEvent("rd-cbc:deleteBusinessFromCenter", raggsyy)
  RPC.execute("rd-cbc:deleteBusinessFromCenter", raggsyy)
end)

AddEventHandler("rd-cbc:showBusinessElevatorOptions", function()
  local offices = RPC.execute("rd-cbc:getCreatedOffices")
  local AE = {
    title = "A-E",
    children = {},
  }
  local FJ = {
    title = "F-J",
    children = {},
  }
  local KO = {
    title = "K-O",
    children = {},
  }
  local PT = {
    title = "P-T",
    children = {},
  }
  local UZ = {
    title = "U-Z",
    children = {},
  }
  local zero9 = {
    title = "0-9",
    children = {},
  }
  local ctx = { zero9, AE, FJ, KO, PT, UZ }
  local AELetters = { a = true, b = true, c = true, d = true, e = true }
  local FJLetters = { f = true, g= true, h = true, i = true, j = true }
  local KOLetters = { k = true, l = true, m = true, n = true, o = true }
  local PTLetters = { p = true, q = true, r = true, s = true, t = true }
  local UZLetters = { u = true, v = true, w = true, x = true, y = true, z = true }
  local numberLetters = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
  }
  for _, office in pairs(offices) do
    local firstLetter = string.lower(string.sub(office.offices_business_name, 1, 1))
    local c = nil
    if AELetters[firstLetter] then
      c = AE.children
    elseif FJLetters[firstLetter] then
      c = FJ.children
    elseif KOLetters[firstLetter] then
      c = KO.children
    elseif PTLetters[firstLetter] then
      c = PT.children
    elseif UZLetters[firstLetter] then
      c = UZ.children
    else
      c = zero9.children
    end
    c[#c + 1] = {
      title = office.offices_business_name,
      description = "ID: " .. office.offices_business_id,
      children = {
        {
          title = "Visit",
          action = "rd-cbc:actionOffice",
          key = { action = "visit", office = office },
        },
        {
          title = "Lock",
          action = "rd-cbc:actionOffice",
          key = { action = "lock", office = office },
        },
        {
          title = "Unlock",
          action = "rd-cbc:actionOffice",
          key = { action = "unlock", office = office },
        },
        {
          title = "Unlock & Visit",
          action = "rd-cbc:actionOffice",
          key = { action = "unlockvisit", office = office },
        },
      },
    }
  end
  exports['rd-ui']:showContextMenu(ctx)
end)

RegisterUICallback('rd-cbc:actionOffice', function (data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  local action = data.key.action
  local office = data.key.office
  local cid = exports["isPed"]:isPed("cid")
  print(office.offices_business_id)
  TriggerServerEvent("rd-cbc:actionOfficeInfo", action, office.offices_business_id, cid, currentJob == "police" or currentJob == "judge")
  RPC.execute("rd-cbc:actionOffice", action, office.offices_business_id, cid, currentJob == "police" or currentJob == "judge")
end)


AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  DeleteEntity(SultanVehicle)
end)
