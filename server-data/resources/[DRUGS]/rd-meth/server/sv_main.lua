local table = {}
local labs = {}

local function get_info_from_db ()
  local src = source
  local user = exports['rd-base']GetModule('Player')(src)
  local cid = user.id
  local query = SQL("SELECT _meth_corners SELECT @locations WHERE locations = @locations", {
    ["activelocations"] = pAmount,
    ["group_type"] = pBizName
  })

  -- MAKE RETURN FOR DATA RETRIEVED 
  return query[1]
end

RPC.register('rd-meth:getConfig',function(pData, pInfo)
  print(pData, pInfo)
  local src = source
  table = {
    ACTIVE_CORNERS = {
    polyzone = {polyzone ={68.65, -1894.58, 21.65} , h = 15.1 , w = 345.2 , options = {} ,  enabled = true } , 
  }
}

labs = {  -- TO DO : ADD COORDS TO DATABASE AND LOAD OFF THAT 
  ACTIVE_LABS = {
  polyzone = {polyzone ={2433.85, 4969.23, 42.35} , length = 1 , width = 1.1 , options = {} ,  enabled = true , polytargets = {
    laptop = {x = 1065.75, y = -2322.71, z = 19.72 , length = 1 , width = 1.1},
    fridge = {x = 1059.66, y = -2322.35, z = 19.72 , length = 1 , width = 1.1},
    settings = {x = 1059.66, y = -2322.35, z = 19.72 , length = 1 , width = 1.1},
    dis_settings = {x = 1061.17, y = -2319.76, z = 19.72 , length = 1 , width = 1.1},
    temperature = {x = 1065.57, y = -2318.75, z = 19.72 , length = 1 , width = 1.1},
    dis_steam = {x = 1057.68, y = -2317.44, z = 19.72 , length = 1 , width = 1.1},
    drop = {x = 1050.76, y = -2319.17, z = 19.72 , length = 1 , width = 1.1},
  }
 }}

}
  return table , labs
end)

RegisterServerEvent('rd-meth:corneringFoundVehicle',function (pCorner , pSrc , pTable)
  print('Hmmm',json.encode(pTable))
  
end)

RPC.register('rd-meth:startCornering', function(pID)
  local src = source
  TriggerClientEvent('rd-meth:findCandidateVehicle', 1 , src)
  return true
end)

RPC.register('rd-meth:corneringFoundVehicle',function(pData, pInfo , pTable)
  local src = source
  return false , 'No vehicle found bro'
end)

RPC.register('rd-meth:attemptCornerSale', function (pCar , pInfo)
  print('[ATTEMPT CORNER SALE]',pCar , pInfo)
  local src = source
  TriggerClientEvent("inventory:removeItem",src,"methlabproduct", 1)
  return true
end)

RPC.register('rd-meth:stopCornering', function()
  local src = source 
  TriggerClientEvent('rd-meth:showSellDrugsMenuItem',src,"cancorner" ,false)
end)

RPC.register('rd-meth:purchaseLabKey', function()
  local src = source
  TriggerClientEvent('player:receiveItem', src, 'methlabkey', 1)
end)
