RegisterNUICallback('getInfoData', function(_, cb)
  local characterId = exports["isPed"]:isPed("cid")
  TriggerServerEvent("pCid", characterId)
  local bankid, phonenr, cash, bank, casinoChips, licenses = RPC.execute("getCharacterInfo", characterId)
  cb({
    cid = characterId,
    bankid = bankid,
    phonenumber = phonenr,
    cash = cash,
    bank = bank,
    casino = casinoChips,
    licenses = licenses
  })
end)