local license = 0

local licenseArray = {}

RegisterServerEvent('rd-heists:check_if_robbed')
AddEventHandler('rd-heists:check_if_robbed', function(license)

local _source = source

if licenseArray[#licenseArray] ~= nil then
    for k, v in pairs(licenseArray) do
        if v == license then
        return
        end
    end
end

licenseArray[#licenseArray+1] = license

    TriggerClientEvent('sec:AllowHeist', _source)
end)

RegisterServerEvent('rd-heists:bankTruckLog')
AddEventHandler('rd-heists:bankTruckLog', function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** np [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing a Bank Truck",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/1068505806787579966/G_euFiJ_CWfSzwOXRv8oCTZnOQZ_mSXCl5SfNxGzP_m8j6vH_WbcNvMvZrtoGPeXThBA", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/982104385679159296/1059831718103744522/FAtwwr2.png"}), { ['Content-Type'] = 'application/json' })
end)