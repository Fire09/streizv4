local blips = {
    {title="Fishing", colour=47, id=68, scale=0.7, x = -334.3244, y = 6104.2954, z = 31.446575},
    {title="Fishing Sales", colour=47, id=68, scale=0.7, x = -1848.0, y = -1190.483, z = 14.322813},
    {title="Mine", colour=3, id=617, scale=0.7, x = -595.25274658203, y = 2086.6682128906, z = 131.37292480469},
    {title="Post OP", colour=40, id=616, scale=0.7, x = -416.05712890625, y = -2793.1516113281, z = 5.993408203125},
    {title="Water & Power", colour=46, id=354, scale=0.7, x = 448.74725341797, y = -1970.3472900391, z = 22.961181640625},
   -- {title="Vehicle Rental", colour=0, id=227, scale=0.7, x = 111.05934143066, y = -1088.4791259766, z = 29.296752929688},
    {title="Garbage Depo", colour=0, id=318, scale=0.7, x = -351.79779052734, y = -1544.2681884766, z = 27.712768554688},
    {title="Alta Street Apartments", colour=3, id=475, scale=0.7, x = -267.45495605469, y = -960.69891357422, z = 31.234375},
    {title="Sandy Shores PD", colour=0, id=60, scale=0.7, x = 1855.2, y = 3685.72, z = 34.272},
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
  end)