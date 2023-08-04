local baseLab = {
    "gabz_meth_lab_empty",
    "gabz_meth_lab_basic", -- use this one
    "gabz_meth_lab_upgrade",
}

local stockedLab = {
    "gabz_meth_lab_low", -- use this one
    "gabz_meth_lab_med",
    "gabz_meth_lab_full",
}

local activeLabs = {
  {
    milo = "gabz_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo_",
    coords = vector3(1068.39, -2317.51, 22.33),
  },
  {
    milo = "gabz_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo_",
    coords = vector3(369.05, 3562.01, 25.39),
  },
  {
    milo = "gabz_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo_",
    coords = vector3(2297.82, 4849.06, 33.91),
  },
  {
    milo = "gabz_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo_",
    coords = vector3(45.11, -2694.25, -4.5),
  },
  {
    milo = "gabz_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo_",
    coords = vector3(2456.62, 1573.13, 22.22),
  },
  {
    milo = "gabz_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo_",
    coords = vector3(187.23, 2426.38, 48.22),
  },
  -- testing
  -- { milo = "gabz_biker_interior_placement_interior_dw_biker_dlc_int_ware01_milo_", coords = vector3(229.87, -780.15, 18.5) },
}

Citizen.CreateThread(function()
    Citizen.Wait(60000)
    for _, activeLab in pairs(activeLabs) do
        RequestIpl(activeLab.milo)
        local interiorId = GetInteriorAtCoords(activeLab.coords)
        
        for k, s in pairs(baseLab) do
            DisableInteriorProp(interiorId, s)
        end
        for k, s in pairs(stockedLab) do
            DisableInteriorProp(interiorId, s)
        end

        EnableInteriorProp(interiorId, baseLab[2])
        EnableInteriorProp(interiorId, stockedLab[1])

        RefreshInterior(interiorId)
    end
end)

AddEventHandler("rd-inventory:itemUsed", function(item, info)
    if item ~= "methlabcured" then return end
    if not exports["rd-inventory"]:hasEnoughOfItem("qualityscales", 1, false) then
        TriggerEvent("DoLongHudText", "Need something to weigh with...")
        return
    end
    if not exports["rd-inventory"]:hasEnoughOfItem("emptybaggies", 1, false) then
        TriggerEvent("DoLongHudText", "Need something to pack with...")
        return
    end
    local finished = exports["rd-taskbar"]:taskBar(1000, "Packing")
    if finished ~= 100 then return end
    RPC.execute("rd-meth:packCuredMeth", json.decode(info))
    TriggerEvent('inventory:removeItem', 'emptybaggies', 1)
end)




























-- local baseLabIndex = 1
-- local stockedLabIndex = 0

-- RegisterCommand("meth:next", function()
--     RequestIpl("gabz_biker_interior_placement_interior_dw_biker_dlc_int_ware01_milo_")
--     local interiorId = GetInteriorAtCoords(229.87, -780.15, 18.5)
    
--     for k, s in pairs(baseLab) do
--         DisableInteriorProp(interiorId, s)
--     end
--     for k, s in pairs(stockedLab) do
--         DisableInteriorProp(interiorId, s)
--     end

--     stockedLabIndex = stockedLabIndex + 1
--     if stockedLabIndex > 3 then
--         baseLabIndex = baseLabIndex + 1
--         stockedLabIndex = 1
--     end

--     EnableInteriorProp(interiorId, baseLab[baseLabIndex])
--     EnableInteriorProp(interiorId, stockedLab[stockedLabIndex])

--     RefreshInterior(interiorId)
-- end)
