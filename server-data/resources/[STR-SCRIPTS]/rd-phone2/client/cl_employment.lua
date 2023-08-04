RegisterNUICallback("getEmploymentData", function(data, cb)
  local employment = RPC.execute("rd-business:business:GetEmploymentInformation")
  cb(employment)
end)

RegisterNUICallback("getEmployeesData", function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.id)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.id)
  local role = RPC.execute("rd-business:business:GetUserRole", data.id, characterId)
  local roleManagePerm, roleCreatePerm, canHirePerm, canFirePerm, canUseBank, canChargePerm = RPC.execute("rd-business:business:GetRolePermission", data.id, role)

  cb({
    employees = business,
    roles = roles,
    cid = characterId,
    permission = {
      roleManage = roleManagePerm,
      roleCreate = roleCreatePerm,
      canHire = canHirePerm,
      canFire = canFirePerm,
      canCharge = canChargePerm
    }
  })
end)

RegisterNUICallback("removeEmployee", function(data, cb)
  if data == nil then return end
  if tonumber(data.id) == tonumber(exports['isPed']:isPed('cid')) then exports['rd-phone']:SendAlert('error', 'You cant fire yourself!', 3000) return end
  local result = RPC.execute("rd-business:business:fireEmployee", data.id, data.businessid)
  if not result then return exports['rd-phone']:SendAlert('error', 'Error', 3000) end
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.businessid)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.businessid)
  cb({
    employees = business,
    roles = roles,
    cid = characterId
  })
end)

RegisterNUICallback("editEmployee", function(data, cb)
  if data == nil then return end
  local result = RPC.execute("rd-business:business:updateEmployee", data.id, data.businessid, data.role)
  if not result then return exports['rd-phone']:SendAlert('error', 'Error', 3000) end
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.businessid)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.businessid)
  cb({
    employees = business,
    roles = roles,
    cid = characterId
  })
end)

RegisterNUICallback("hireEmployee", function(data, cb)
  if data == nil then return end
  local result = RPC.execute("rd-business:business:hireEmployee", data.id, data.role, data.businessid)
  if not result then return exports['rd-phone']:SendAlert('error', 'This person is already hired', 3000) end
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.businessid)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.businessid)
  cb({
    employees = business,
    roles = roles,
    cid = characterId
  })
end)

RegisterNUICallback("deleteRole", function(data, cb)
  if data == nil then return end
  local role = data.role
  if tostring(role) == "Owner" then return exports['rd-phone']:SendAlert('error', 'Cant delete own role', 3000) end
  local result = RPC.execute("rd-business:business:deleteRole", data.businessid, data.role)
  if not result then return exports['rd-phone']:SendAlert('error', 'Error', 3000) end
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.businessid)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.businessid)
  cb({
    employees = business,
    roles = roles,
    cid = characterId
  })
end)

RegisterNUICallback("createRole", function(data, cb)
  if data == nil then return end
  local perms = data.permissions
  local doesExist = RPC.execute("rd-business:business:checkRoleExistance", data.businessid, data.role)
  if doesExist then return exports['rd-phone']:SendAlert('error', 'Role name already exists', 3000) end
  local result = RPC.execute("rd-business:business:createRole", data.businessid, data.role, perms.hire, perms.fire, perms.changeRole, perms.propertyKeys, perms.stash, perms.craft, perms.chargeExternal, perms.bank) -- last is bank
  if not result then return exports['rd-phone']:SendAlert('error', 'Error', 3000) end
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.businessid)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.businessid)
  cb({
    employees = business,
    roles = roles,
    cid = characterId
  })
end)

RegisterNUICallback("editRole", function(data, cb)
  if data == nil then return end
  if tostring(data.role) == "Owner" then return exports['rd-phone']:SendAlert('error', 'Cant edit owner role', 3000) end
  local perms = data.permissions
  local result = RPC.execute("rd-business:business:editRole", data.businessid, data.role, data.role, perms.fire, perms.hire, perms.changeRole, perms.propertyKeys, perms.stash, perms.craft, perms.chargeExternal, perms.bank) -- last is bank
  if not result then return exports['rd-phone']:SendAlert('error', 'Error', 3000) end
  local characterId = exports["isPed"]:isPed("cid")
  local business = RPC.execute("rd-business:business:GetBusiness", data.businessid)
  local roles = RPC.execute("rd-business:business:GetBusinessRoles", data.businessid)
  cb({
    employees = business,
    roles = roles,
    cid = characterId
  })
end)

RegisterNUICallback("getRolePermission", function(data, cb)
  local roleManagePerm, roleCreatePerm, canHirePerm, canFirePerm, hasBankPerm, canChargePerm, hasKeysPerm, hasStashPerm, hasCraftPerm = RPC.execute("rd-business:business:GetRolePermission", data.businessid, data.role)    
  cb({roleManage = roleManagePerm, roleCreate = roleCreatePerm, canHire = canHirePerm, canFire = canFirePerm, canCharge = canChargePerm, hasKeys = hasKeysPerm, hasStash = hasStashPerm, hasCraft = hasCraftPerm, hasBank = hasBankPerm})
end)

RegisterNUICallback("chargeCustomer", function(data, cb)
  if data == nil then return end
  RPC.execute("rd-business:business:charge", data.businessid, data.id, exports["isPed"]:isPed("cid"), data.amount, data.comment)
  cb(true)
end)

local years, months, days, hours, minutes, seconds
local date = 31

function time()
    years, months, days, hours, minutes, seconds =
    Citizen.InvokeNative(0x50C7A99057A69748, Citizen.PointerValueInt(),Citizen.PointerValueInt(),Citizen.PointerValueInt(),Citizen.PointerValueInt(),Citizen.PointerValueInt(), Citizen.PointerValueInt())

    if months < 10 then months = "0" .. months end

    if days < 10 then days = "0" .. days end

    if minutes < 10 then minutes = "0" .. minutes - 1 end

    if seconds < 10 then seconds = "0" .. seconds end

    if hours < 10 then hours = "0" .. hours end

    date = years .. "-" .. months .. "-" .. days .. "T" .. hours .. ":" ..minutes .. ":" .. seconds
end

function format_int(n)
  if not n then return 0 end
  n = tonumber(n)
  if n >= 1e14 then return tostring(n) end
  if n <= -1e14 then return "-" .. tostring(math.abs(n)) end
  local negative = n < 0
  n = tostring(math.abs(n))
  local dp = string.find(n, "%.") or #n + 1

  for i = dp - 4, 1, -3 do
      n = n:sub(1, i) .. "," .. n:sub(i + 1)
  end

  -- Make sure the amount is padded with zeroes
  if n[#n - 1] == "." then
      n = n .. "0"
  end

  return (negative and "-" or "") .. n
end

RegisterNetEvent("showPaymentNotify")
AddEventHandler("showPaymentNotify", function(businessid, cid, charger, amount, comment)
    local mycid = exports["isPed"]:isPed("cid")
    if tonumber(mycid) == tonumber(cid) then
      local clientId = PlayerId()
      local src = GetPlayerServerId(clientId)
        local realamount = format_int(tonumber(amount))
        local message = "$" .. tostring(realamount) .. " incl tax"
        local result = DoPhoneConfirmation(30, "Service Charge", message)
        if result then
            -- if this succeeds then a noti will send to the charger

            time()

            RPC.execute("chargeCustomer", businessid, cid, comment, charger, amount, src, date)
        end
    end
end)

function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 3000 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function getVehicleClosestToMe()
  playerped = PlayerPedId()
  coordA = GetEntityCoords(playerped, 1)
  coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
  targetVehicle = getVehicleInDirection(coordA, coordB)
  return targetVehicle
end

RegisterNetEvent("rd-phone:GasStationConfirm")
AddEventHandler("rd-phone:GasStationConfirm", function(businessid, cid, charger, amount, comment, state_id)
--  local mycid = exports["isPed"]:isPed("cid")
 -- if not state_id ~= nil then
    local GallonPrice = 6
    local veh = getVehicleClosestToMe()
	  local vehicleCurrentFuel = math.ceil(exports['rd-vehicles']:GetVehicleFuel(veh))
	  local endFuel = (100 - vehicleCurrentFuel)
	  local FuelCost = endFuel * GallonPrice
      local clientId = PlayerId()
      local src = GetPlayerServerId(clientId)
      local amount = FuelCost
        local realamount = format_int(tonumber(amount))
        local message = "$" .. tostring(realamount) .. " incl tax"
        local result = DoPhoneConfirmation(15, "Gas Station", message, "gas-pump", "#90c9f9")
        if result then
          Wait(100)
          TriggerEvent("rd-phone:SendNotify", "Purchasing...", "gasstations", "Gas Station")
          Wait(3000)
          TriggerEvent("rd-phone:SendNotify", "Purchased!", "gasstations", "Gas Station")
            TriggerEvent('rd-fuel:cl:phone:offer:accepted')
            time()
    end
end)

RegisterNetEvent("showPaymentReceivedNotify")
AddEventHandler("showPaymentReceivedNotify", function(charger)
    local mycid = exports["isPed"]:isPed("cid")
    if tonumber(mycid) == tonumber(charger) then
        Wait(500)
        TriggerEvent("rd-phone:SendNotify", "Payment Successful!", "charge", "Business Charge") -- Payment Received!
      end
end)

RegisterNetEvent("showPaymentReceivedNotify2")
AddEventHandler("showPaymentReceivedNotify", function(charger)
    local mycid = exports["isPed"]:isPed("cid")
    if tonumber(mycid) == tonumber(charger) then
        Wait(500)
        TriggerEvent("rd-phone:SendNotify", "Payment Successful!", "charge", "Business Charge") -- Payment Received!
      end
end)