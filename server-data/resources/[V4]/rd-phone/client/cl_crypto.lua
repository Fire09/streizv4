RegisterNUICallback("getCryptoData", function(data, cb)
  local cid = exports["isPed"]:isPed("cid")
  local cryptoarray = RPC.execute("phone:getCryptos")
  allcryptos = {}

  for i = 1, #cryptoarray do

    local cryptoamount = RPC.execute("phone:getCryptoBalance", cid, cryptoarray[tonumber(i)].cryptoid)
    if cryptoamount == nil then
      RPC.execute("phone:generateWallet", cid, cryptoarray[tonumber(i)].cryptoid)
    end

    allcryptos[#allcryptos + 1] = {
        id = cryptoarray[tonumber(i)].cryptoid,
        name = cryptoarray[tonumber(i)].cryptoname,
        tag = cryptoarray[tonumber(i)].cryptotag,
        icon = cryptoarray[tonumber(i)].cryptoicon,
        canbuy = cryptoarray[tonumber(i)].buyable,
        canexchange = cryptoarray[tonumber(i)].exchangeable,
        cansell = cryptoarray[tonumber(i)].sellable,
        value = cryptoarray[tonumber(i)].value,
        amount = cryptoamount
      }
  end

  cb(allcryptos)
end)

RegisterNUICallback("purchaseCrypto", function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local amount = tonumber(data.amount)
  time()
  local success, message = RPC.execute("purchaseCrypto", characterId, data.id, amount, date)
  if not success then
    cb({
      success = false,
      data = {},
      message = message
    })
  end
  if success then
    local cryptoarray = RPC.execute("phone:getCryptos")
  allcryptos = {}

  for i = 1, #cryptoarray do

    local cryptoamount = RPC.execute("phone:getCryptoBalance", characterId, cryptoarray[tonumber(i)].cryptoid)
    if cryptoamount == nil then
      RPC.execute("phone:generateWallet", characterId, cryptoarray[tonumber(i)].cryptoid)
    end

    allcryptos[#allcryptos + 1] = {
        id = cryptoarray[tonumber(i)].cryptoid,
        name = cryptoarray[tonumber(i)].cryptoname,
        tag = cryptoarray[tonumber(i)].cryptotag,
        icon = cryptoarray[tonumber(i)].cryptoicon,
        canbuy = cryptoarray[tonumber(i)].buyable,
        canexchange = cryptoarray[tonumber(i)].exchangeable,
        cansell = cryptoarray[tonumber(i)].sellable,
        value = cryptoarray[tonumber(i)].value,
        amount = cryptoamount
      }
  end

  cb({
    success = true,
    data = allcryptos,
    message = ""
  })
  end
end)

RegisterNUICallback("exchangeCrypto", function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local success, message = RPC.execute("exchangeCrypto", characterId, data.id, data.number, data.amount)
  if not success then
    cb({
      success = false,
      data = {},
      message = message
    })
  end
  if success then
    local cryptoarray = RPC.execute("phone:getCryptos")
  allcryptos = {}

  for i = 1, #cryptoarray do

    local cryptoamount = RPC.execute("phone:getCryptoBalance", characterId, cryptoarray[tonumber(i)].cryptoid)
    if cryptoamount == nil then
      RPC.execute("phone:generateWallet", characterId, cryptoarray[tonumber(i)].cryptoid)
    end

    allcryptos[#allcryptos + 1] = {
        id = cryptoarray[tonumber(i)].cryptoid,
        name = cryptoarray[tonumber(i)].cryptoname,
        tag = cryptoarray[tonumber(i)].cryptotag,
        icon = cryptoarray[tonumber(i)].cryptoicon,
        canbuy = cryptoarray[tonumber(i)].buyable,
        canexchange = cryptoarray[tonumber(i)].exchangeable,
        cansell = cryptoarray[tonumber(i)].sellable,
        value = cryptoarray[tonumber(i)].value,
        amount = cryptoamount
      }
  end

  cb({
    success = true,
    data = allcryptos,
    message = ""
  })
  end
end)