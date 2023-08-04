orders = {}

mechanic_DATA = {
    {
      name = "Ottos Autos",
      short = "oa",
      code = "ottos_auto", 
      ingredients = 1,
    },
    {
      name = "Harmony Repairs",
      short = "hr",
      code = "harmony_repairs",
      ingredients = 5,
    },
    {
      name = "Hayes Autos",
      short = "ha",
      code = "hayes_autos",
      ingredients = 3,
    },
    {
      name = "Hazes Repairs",
      short = "hazes",
      code = "hazes",
      ingredients = 5,
    },
    {
      name = "Iron Hog",
      short = "ih",
      code = "iron_hog",
      ingredients = 5,
    },
    {
      name = "Tuner",
      short = "tuner",
      code = "tuner",
      ingredients = 2,
    },
}

function GetBusinessConfig(pCode)
  for _, r in pairs(mechanic_DATA) do
    if r.code == pCode then
      return r
    end
  end
end

MAX_EMPLOYEES = 6
MAX_RECEIPTS_PER_HOUR = 40
MENU_CHANGE_COOLDOWN = 60 * 60 * 1000 -- 1hr in ms
