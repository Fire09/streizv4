RegisterNUICallback('getContactsData', function(_, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local contacts = RPC.execute("getCharacterContacts", characterId)
  cb(contacts)
end)

RegisterNUICallback('addPhoneContact', function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  
  local success = RPC.execute("addPhoneContact", characterId, data.number, data.name)
  if success then
  local contacts = RPC.execute("getCharacterContacts", characterId)
  cb({success =  true, data = contacts})
  end
end)

RegisterNUICallback('removePhoneContact', function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local success = RPC.execute("removePhoneContact", data.id)
  if success then
  local contacts = RPC.execute("getCharacterContacts", characterId)
  cb(contacts)
  end
end)