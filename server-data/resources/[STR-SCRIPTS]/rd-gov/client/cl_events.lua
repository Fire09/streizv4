RegisterNetEvent("rd-gov:resetLicensesCache")
AddEventHandler("rd-gov:resetLicensesCache", function(pCharacterId)
  resetLicensesCache(pCharacterId)
end)

local activeUrl = nil
local dui = nil
local inZone = false
local isDoc = false
local isPolice = false
local isMedic = false
local isJudge = false
local myJob = 'unemployed'

IsDead = false

RegisterNetEvent("rd-jobmanager:playerBecameJob")
AddEventHandler("rd-jobmanager:playerBecameJob", function(job, name, notify)
    if isMedic and job ~= "ems" then isMedic = false end
    if isPolice and job ~= "police" then isPolice = false end
    if isDoc and job ~= "doc" then isDoc = false end
    if isJudge and job ~= "judge" then isJudge = false end
    if job == "police" then isPolice = true end
    if job == "ems" then isMedic = true end
    if job == "doc" then isDoc = true end
    myJob = job
end)

CreateThread(function ()
  exports["rd-polyzone"]:AddBoxZone("court_house", vector3(-525.19, -178.48, 38.22), 21.4, 21.2, {
    name="ch",
    heading=209,
    minZ=37.02,
    maxZ=46.22
  })

  exports["rd-polytarget"]:AddBoxZone("townhall:judgeAnnouncement", vector3(-521.3334, -195.5148, 38.06), 0.4, 1.6, { heading=30, minZ=36.02, maxZ=40.62 })

  exports['rd-interact']:AddPeekEntryByPolyTarget('townhall:judgeAnnouncement', {{
        id = "rd-gov:townhall:judgeAnnouncements",
        event = "rd-gov:newStateAnnouncement",
        icon = "circle",
        label = "Judge Actions"
    }},
    {
      distance = { radius = 2.0 },
      isEnabled = function ()
          return isPolice or isJudge
      end
    })

    exports['rd-interact']:AddPeekEntryByPolyTarget('townhall:judgeAnnouncement', {{
      id = "rd-gov:townhall:ElectionsDatabase",
      event = "electionsWinnerCheckDatabase",
      icon = "circle",
      label = "Election Database"
  }},
  {
    distance = { radius = 2.0 },
    isEnabled = function ()
        return isPolice or isJudge
    end
  })

end)

AddEventHandler("rd-polyzone:enter", function(zone)
  if zone ~= "court_house" then return end
  inZone = true
  if not activeUrl then
    local url = RPC.execute("rd-gov:getScreenUrl")
    if not url then return end
    activeUrl = url
  end

  dui = exports["rd-lib"]:getDui(activeUrl, 512, 512)
  AddReplaceTexture("np_town_hall_bigscreen", "projector_screen", dui.dictionary, dui.texture)
end)

AddEventHandler("rd-polyzone:exit", function(zone)
  if zone ~= "court_house" then return end
  inZone = false
  if dui then
    exports["rd-lib"]:releaseDui(dui.id)
    RemoveReplaceTexture("np_town_hall_bigscreen", "projector_screen")
    dui = nil
  end
end)

RegisterNetEvent("rd-gov:changeScreenImage")
AddEventHandler("rd-gov:changeScreenImage", function(pUrl)
  activeUrl = pUrl
  if not inZone then return end
  if pUrl then
    if not dui then
      dui = exports["rd-lib"]:getDui(pUrl, 512, 512)
      AddReplaceTexture("np_town_hall_bigscreen", "projector_screen", dui.dictionary, dui.texture)
    else
      exports["rd-lib"]:changeDuiUrl(dui.id, pUrl)
    end
    return
  end
  if not pUrl and dui then
    exports["rd-lib"]:releaseDui(dui.id)
    RemoveReplaceTexture("np_town_hall_bigscreen", "projector_screen")
    dui = nil
  end
end)

RegisterNetEvent("rd-gov:newStateAnnouncement", function()
  local context = {}
  for _, aType in pairs(AnnouncementTypes) do
    context[#context + 1] = { title = aType.label, description = "[" .. aType.label .. "]" .. " <text>", icon = aType.icon, action = "rd-gov:ui:stateAnnouncement", key = aType.name }
  end

  exports["rd-ui"]:showContextMenu(context)
end)

RegisterUICallback("rd-gov:ui:stateAnnouncement", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  Wait(0)

  local prompt = exports["rd-ui"]:OpenInputMenu({ { name = "text", _type = "textarea", label = "Text", icon = "pencil-alt", maxLength = 500, } }, function(values)
    return values and values.text and #values.text > 0
  end)

  if not prompt then return end

  STR.execute("rd-gov:stateAnnouncement", prompt.text, data.key)
end)
