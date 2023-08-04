STX.Logs = STX.Logs or {}

STX.Logs.Webhooks = {
    ['Connection'] = 'https://discord.com/api/webhooks/985218814813798461/XiK6yYkwbr3HPu5MJRZlCrj_a6ufDfMD6lYKW4hFQDwiVouFeTctB6CcG61dK_1BRb4l',
    ['Leave'] = 'https://discord.com/api/webhooks/985218864889593937/9cbUFPmf33QsSkjtmWAxMGbcXUaSh7X5vk6nYMWx77eX7jZq8UPtNIXvyTYYTVWnOAFN',
    ['Character'] = 'https://discord.com/api/webhooks/985218918702547015/1i-a01lAXmAm6O_tpVj_KTedPba85F3vT3dzckrzxPmO1kLFlL1GQvEb39B_Cxi77MNj',
    ['DeathLogs'] = 'https://discord.com/api/webhooks/985220670512304158/IqmWu3kqWsZtDIo3cUtqvECd2psFoDLsTN6icuS3XasSmMYKE7PDjBObk4ulVHv1DT13',
    ['Widthdraw'] = 'https://discord.com/api/webhooks/985218983529693194/mzvps8SIOQAWIBqDdfWEDhW6qTlc0DOhyGw2bG2PBrmSA8gnFZxWhlD2vugrp-kvdg1i',
    ['Deposit'] = 'https://discord.com/api/webhooks/985219029432160277/mtdi3ySgHR5T9h_Ha7glv0ktMW8djmSz64dyWO-bYu3B41au6zcEja9W_CcdqtRO7ELB',
    ['Transfer'] = 'https://discord.com/api/webhooks/985219061111717938/7HV-Kjtm2jt7i0KSrgFYk2iviLXHM_600dqGd2CQZPeojP9G78kIzHmi27d_84uPV6vM',
    ['Givecash'] = 'https://discord.com/api/webhooks/985219163096232007/IkqBYsqsBqOZZPr8g16xvDBI9JP2jqMCplXG6A4C3fVyfYqy3gdHSIyZqx7gadHF_TEr',
    ['Fishing'] = 'https://discord.com/api/webhooks/985243066401169463/Cjl1VAyIrbgWJoGxc7Nxer9YpHq2cO9EXBvTuQcJ_fkwyhdWjh6eSL8sHWLVCLatcVep',
    ['Garbage'] = 'https://discord.com/api/webhooks/985243458417594458/98mDSkcGRYR-P1-sORp1AkdhEkuDGR4NKLppyTB-WZ7C9s2cCGhdZzvkcaOBVvEesnNC',
    ['Hunting'] = 'https://discord.com/api/webhooks/985243127830949929/WktJ19im7zYG9FJIrcQcr_x9Q-0hui7Rtz2-QJWzj05kmO1fP0klCE_LqxfK4vMPxzsn',
    ['Mining'] = 'https://discord.com/api/webhooks/985243190972002314/CdZTC7wULsvQYhb-vaB7vqiK44hOinFe5JdK_QnOZrVJ1ydvtbLJslvj6O3HjUfTvNCF',
    ['PostOP'] = 'https://discord.com/api/webhooks/985243396979441694/EO39ZhNJCifKqtYg5mTuqyq70SPt1RfYUKdqY6rt1hlRAjMAFqsr8LjUqzmqhFHOLCUZ',
    ['WaterPower'] = 'https://discord.com/api/webhooks/985243337139294308/heI6fN-4F-8WDLiw5VB-f6zp1mswJHV2R99L3nrrX3ux0jthk1vaTqJuZZntSYv6DHOm',
    ['Chicken'] = 'https://discord.com/api/webhooks/985243251957178398/XixfyBWCXCIWWAWOab76kHdxx27WEyNPWeuDLLVgrcds5Zcc0ocTksBluC4ZFNAL7bTY',
}

STX.Logs.JoinLog = function(self, pName, pSteam, pDiscord)
    local embed = {
        {
            ['description'] = string.format("`User is joining!`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", pSteam, pDiscord),
            ['color'] = 3124231,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Connection'], function(err, text, headers) end, 'POST', json.encode({username = 'Connection Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.ExitLog = function(self, dReason, pName, pSteam, pDiscord)
    local embed = {
        {
            ['description'] = string.format("`User has left!`\n\n`• Reason: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", dReason, pSteam, pDiscord),
            ['color'] = 14038582,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Leave'], function(err, text, headers) end, 'POST', json.encode({username = 'Connection Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.UserCreate = function(self, uId, pName, pSteam, pDiscord, firstname, lastname, dob, gender)
    local embed = {
        {
            ['description'] = string.format("`User Profile Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• First Name: %s`\n\n`• Last Name: %s`\n\n`• Date of Birth: %s`\n\n`• Gender: %s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, firstname, lastname, dob, gender),
            ['color'] = 2317994,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Character'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.DeathLogs = function(self, uId, message)
    local embed = {
        {
            ['description'] = string.format("`Death Log Created.`\n\n━━━━━━━━━━━━━━━━━━\n`• ".. message .. "`\n━━━━━━━━━━━━━━━━━━"),
            ['color'] = 3593942,
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['DeathLogs'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.BankingWidthdraw = function(self, uId, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
    local embed = {
        {
            ['description'] = string.format("`Bank Log Widthdraw Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Amount Withdrawn: $%s`\n\n`• Cash Balance: $%s`\n\n`• Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, pulled, cashleft, bankleft),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Widthdraw'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.BankingDeposit = function(self, uId, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
    local embed = {
        {
            ['description'] = string.format("`Bank Deposit Log Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Amount Deposited: $%s`\n\n`• Cash Balance: $%s`\n\n`• Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, pulled, cashleft, bankleft),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Deposit'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.BankingTransfer = function(self, uId, uId2, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local embed = {
        {
            ['description'] = string.format("`Bank Transfer Log Created.`\n\n`• Player User Id: %s`\n\n`• Target User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Steam: %s`\n\n`• Player Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Steam: %s`\n\n`• Target Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Amount Transfered: $%s`\n\n`• Player Cash Balance: $%s`\n\n`• Player Bank Balance: $%s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Amount Received: $%s`\n\n`• Target Cash Balance: $%s`\n\n`• Target Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, uId2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = "Player : " .. pName .. " | Target : ".. pName2
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Transfer'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.BankingGiveCash = function(self, uId, uId2, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local embed = {
        {
            ['description'] = string.format("`Cash Given Log Created.`\n\n`• Player User Id: %s`\n\n`• Target User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Steam: %s`\n\n`• Player Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Steam: %s`\n\n`• Target Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Amount Transfered: $%s`\n\n`• Player Cash Balance: $%s`\n\n`• Player Bank Balance: $%s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Amount Received: $%s`\n\n`• Target Cash Balance: $%s`\n\n`• Target Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, uId2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = "Player : " .. pName .. " | Target : ".. pName2
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Givecash'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.FishingLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Fishing Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Fishing'], function(err, text, headers) end, 'POST', json.encode({username = 'Fishing Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.GarbageLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Garbage Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Garbage'], function(err, text, headers) end, 'POST', json.encode({username = 'Garbage Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.HuntingLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Hunting Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Hunting'], function(err, text, headers) end, 'POST', json.encode({username = 'Hunting Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.MiningLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Mining Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Mining'], function(err, text, headers) end, 'POST', json.encode({username = 'Mining Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.PostOPLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`PostOP Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['PostOP'], function(err, text, headers) end, 'POST', json.encode({username = 'PostOP Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.WaterPowerLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Water & Power Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['WaterPower'], function(err, text, headers) end, 'POST', json.encode({username = 'Water & Power Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

STX.Logs.ChickenLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Chicken Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(STX.Logs.Webhooks['Chicken'], function(err, text, headers) end, 'POST', json.encode({username = 'Chicken Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('rd-base:charactercreate')
AddEventHandler('rd-base:charactercreate',function(firstname, lastname, dob, gender)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs:UserCreate(source, pName, pSteam, pDiscord, firstname, lastname, dob, gender)
end)


RegisterServerEvent('rd-base:bankwidthdraw')
AddEventHandler('rd-base:bankwidthdraw',function(source, pulled, cashleft, bankleft)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs:BankingWidthdraw(source, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
end)

RegisterServerEvent('rd-base:bankdeposit')
AddEventHandler('rd-base:bankdeposit',function(source, pulled, cashleft, bankleft)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs:BankingDeposit(source, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
end)

RegisterServerEvent('rd-base:banktransfer')
AddEventHandler('rd-base:banktransfer',function(source, number, pName2, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs:BankingTransfer(source, number, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
end)

RegisterServerEvent('rd-base:bankgivecash')
AddEventHandler('rd-base:bankgivecash',function(source, number, pName2, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs:BankingGiveCash(source, number, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
end)

RegisterServerEvent('rd-base:deathlogs')
AddEventHandler('rd-base:deathlogs',function(message)
    STX.Logs:DeathLogs(source, message)
end)

RegisterServerEvent('rd-base:fishingLog')
AddEventHandler('rd-base:fishingLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.FishingLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('rd-base:garbageLog')
AddEventHandler('rd-base:garbageLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.GarbageLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('rd-base:huntingLog')
AddEventHandler('rd-base:huntingLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.HuntingLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('rd-base:miningLog')
AddEventHandler('rd-base:miningLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.MiningLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('rd-base:postopLog')
AddEventHandler('rd-base:postopLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.PostOPLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('rd-base:waterpowerLog')
AddEventHandler('rd-base:waterpowerLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.WaterPowerLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('rd-base:chickenLog')
AddEventHandler('rd-base:chickenLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    STX.Logs.ChickenLog(source, source, pName, pSteam, pDiscord, amount)
end)