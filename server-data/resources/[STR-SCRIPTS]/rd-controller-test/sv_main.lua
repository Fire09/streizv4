RPC.register("rd-controllers:getSteamID", function(pSource)
  return getSteamID(pSrc)
end)

function getSteamID()
  local pSrc = source
  local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)
  if user ~= false then
      hexId = user:getVar("hexid")
  else
      hexId = GetPlayerIdentifiers(pSrc)[1]
  end
  return hexId,  print("[CONTROLLERS] Restriction Status | Active: true | HexID:", hexId)
end
