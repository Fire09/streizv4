RegisterServerEvent('submit:bug:report')
AddEventHandler('submit:bug:report', function(data)
    local src = source
    local pName = GetPlayerName(source)
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Bug Report - ".. pName,
            ["description"] = "Title: \n\n `"..data.title.."` \n\n━━━━━━━━━━━━━━━━━━\n\n Description: \n\n `"..data.description.."` \n\n━━━━━━━━━━━━━━━━━━\n\n VOD / Clip / Screenshot URLs: \n\n `"..data.url.."` \n\n━━━━━━━━━━━━━━━━━━\n\n",
	        ["footer"] = {
                ["text"] = "riddle Bug Report",
            },
        }
    }
    PerformHttpRequest("https://discord.com/api/webhooks/865010051424321568/vnsz1D9w_qdv8qD9z9BSjSxeSKPHTagQr2ySBOjoDjBD3waeEXm285OiKtLVfbn3SEtf", function(err, text, headers) end, 'POST', json.encode({username = "Bug Reports",  avatar_url = "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/error-512.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)