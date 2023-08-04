Citizen.CreateThread(function()
  exports["rd-polyzone"]:AddBoxZone("gallery_appraisals", vector3(-1000.54, -765.88, 59.81), 1.6, 2.6, {
    heading=0,
    minZ=58.81,
    maxZ=61.01,
    data = {
      id = "gallery_appraisals",
    },
  })

  exports["rd-polytarget"]:AddBoxZone("gallery_gemcraft", vector3(-1010.81, -764.26, 64.6), 0.8, 1.8, {
    heading=0,
    minZ=64.4,
    maxZ=64.8,
    data = {
      id = "gallery_gemcraft",
    },
  })

  exports['rd-interact']:AddPeekEntryByPolyTarget('gallery_gemcraft', {{
    event = "rd-gallery:gemCraft",
    id = "gallery_gemcraft",
    icon = "box-open",
    label = "Gem Crafting"
  }}, { distance = { radius = 3.5 } })

  exports["rd-polytarget"]:AddBoxZone("bar:openFridge", vector3(-1003.77, -757.34, 64.6), 0.6, 0.6, {
    heading=0,
    minZ=64.4,
    maxZ=65.4,
    data = {
      id = "gallery_drinks",
    },
  })

  -- Gallery
  exports['rd-polytarget']:AddBoxZone("gallery_jewelry", vector3(-1003.12, -767.03, 59.8), 0.4, 1.2, {
    heading=0,
    minZ=58.8,
    maxZ=60.8,
    data = {
      id = 'relics',
    }
  })

  -- Jewelry Store
  exports['rd-polytarget']:AddBoxZone("gallery_jewelry", vector3(-698.09, -904.68, 19.23), 0.7, 1.3, {
    heading=270,
    minZ=19.23,
    maxZ=19.63,
    data = {
      id = 'jewelry',
    }
  })

  exports['rd-interact']:AddPeekEntryByPolyTarget('gallery_jewelry', {{
    event = "rd-gallery:jewelryAction",
    id = "gallery_jewelry",
    icon = "ring",
    label = "Jewelry Making"
  }}, {
    distance = { radius = 3.5 },
  })
end)
