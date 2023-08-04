RegisterServerEvent("MetalDetectorItems")
AddEventHandler("MetalDetectorItems", function()
  local src = source

  local cid = exports["rd-base"]:getChar(src, "id")
  if not cid then return end

  local name = "ply-" .. cid
  local jail = "jail-" .. cid

  MySQL.update.await([[
      DELETE FROM inventory
      WHERE name = ?
  ]],
  { jail })

  MySQL.update.await([[
      UPDATE inventory
      SET name = ?
      WHERE name = ?
  ]],
  { jail, name })
end)

RPC.register("rd-gov:purchaseLicenseWeapons", function(pSource)
  local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
  local cid = user:getCurrentCharacter().id
  local licenseName = "Weapon"
  local price = 5000
  if user:getCash() >= price then
    user:removeMoney(price)
  local update = Await(SQL.execute("UPDATE user_licenses SET status = @status WHERE type = @type AND cid = @cid", {
    ["status"] = 1,
    ["type"] = licenseName,
    ["cid"] = cid
  }))
  if not update then return false end
    else
      TriggerClientEvent("DoLongHudText", pSource, "You don't have enough money!", 2)
      return false
    end
  return true
end)

RPC.register("rd-gov:purchaseLicenseHunting", function(pSource)
  local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
  local cid = user:getCurrentCharacter().id
  local licenseName = "Hunting"
  local price = 5000
  if user:getCash() >= price then
    user:removeMoney(price)
  local update = Await(SQL.execute("UPDATE user_licenses SET status = @status WHERE type = @type AND cid = @cid", {
    ["status"] = 1,
    ["type"] = licenseName,
    ["cid"] = cid
  }))
  if not update then return false end
    else
      TriggerClientEvent("DoLongHudText", pSource, "You don't have enough money!", 2)
      return false
    end
  return true
end)

RPC.register("rd-gov:purchaseLicenseFishing", function(pSource)
  local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
  local cid = user:getCurrentCharacter().id
  local licenseName = "Fishing"
  local price = 5000
  if user:getCash() >= price then
    user:removeMoney(price)
  local update = Await(SQL.execute("UPDATE user_licenses SET status = @status WHERE type = @type AND cid = @cid", {
    ["status"] = 1,
    ["type"] = licenseName,
    ["cid"] = cid
  }))
  if not update then return false end
    else
      TriggerClientEvent("DoLongHudText", pSource, "You don't have enough money!", 2)
      return false
    end
  return true
end)

local riddle = {}

RegisterServerEvent("rd-gov:purchaseBusiness")
AddEventHandler("rd-gov:purchaseBusiness", function(bData)
  riddle = bData
end)

RPC.register("rd-gov:purchaseBusiness", function(bData)
  local src = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(src)
  local rank = user:getRank()
  local cid = user:getCurrentCharacter().id

  local price = 50000
  if user:getCash() >= price then
    user:removeMoney(price)

  roles = {}

  tbl = {
      name = "Owner",
      charge_access = true,
      bank_access = true,
      role_manage = true,
      role_create = true,
      key_access = true,
      stash_access = true,
      craft_access = true,
      can_hire = true,
      can_fire = true,
  }

  table.insert(roles, tbl)

  tbl2 = {
      name = "Employee",
      charge_access = false,
      bank_access = false,
      role_manage = false,
      role_create = false,
      key_access = true,
      stash_access = true,
      craft_access = true,
      can_hire = false,
      can_fire = false,
  }

  table.insert(roles, tbl2)

  employees = {}

  tbl = {
      cid = cid,
      role = "Owner",
      rank = 5
  }

  table.insert(employees, tbl)

  math.randomseed(os.time())
  local bankid = math.random(1,9) .. math.random(1,9) .. math.random(1,9) .. math.random(1,9) .. math.random(1,9) .. math.random(1,9) .. math.random(1,9) .. math.random(1,9)

  local data = Await(SQL.execute("INSERT INTO businesses (business_id, business_name, employees, roles, bank_id) VALUES (@business_id, @business_name, @employees, @roles, @bank_id)", {
      ["business_id"] = riddle.propsal,
      ["business_name"] = riddle.name,
      ["employees"] = json.encode(employees),
      ["roles"] = json.encode(roles),
      ["bank_id"] = bankid
  }))
else
  TriggerClientEvent("DoLongHudText", src, "You don't have enough money!", 2)
  return false
end
  return true
end)

RPC.register("rd-gov:PilotLicenseCheck", function()
	local src = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
  exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Pilot"}, function(result)
    if result[1] ~= nil then
      if result[1].status == 0 then
        idk = 'false'
      else
        idk = 'true'
      end
    end
    TriggerClientEvent("pilotLicense:result", src, idk)
  return idk
  end)
end)

function addLicenseToCharacter(pUser, pLicense, pStatus)
  print(pUser, pLicense, pStatus)
  if pLicense ~= "Weapon License" then 
    pLicense = "Weapon" 
   -- return pLicense 
  end
    local update = Await(SQL.execute("UPDATE user_licenses SET status = @status WHERE type = @type AND cid = @cid", {
      ["status"] = pStatus,
      ["type"] = pLicense,
      ["cid"] = pUser
    }))
    return "License successfully granted!"
end

exports("addLicenseToCharacter", addLicenseToCharacter)