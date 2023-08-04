RegisterNetEvent('gallery-menu')
AddEventHandler('gallery-menu', function()
    local isEmployed = exports["rd-business"]:IsEmployedAt("art_gallery")
    local hasPerm = exports["rd-business"]:HasPermission("art_gallery", "craft_access")
    if isEmployed and hasPerm then
        local AGGem = {
            {
                title = "Mined Items",
                icon = "hard-hat"
            },
            {
                title = "Sell Diamond Gem",
                description = "D",
                icon = "gem",
                action = 'gallery_diamond',
            },
            {
                title = "Sell Aquamarine Gem",
                description = "A",
                icon = "gem",
                action = 'gallery_aquamarine',
            },
            {
                title = "Sell Jade Gem",
                description = "J",
                icon = "gem",
                action = 'gallery_jade',
            },
            {
                title = "Sell Citrine Gem",
                description = "C",
                icon = "gem",
                action = 'gallery_citrine',
            },
            {
                title = "Sell Garnet Gem",
                description = "G",
                icon = "gem",
                action = 'gallery_garnet',
            },
            {
                title = "Sell Opal Gem",
                description = "O",
                icon = "gem",
                action = 'gallery_opal',
            },
            {
                title = "Sell Ruby",
                description = "Ruby",
                icon = "gem",
                action = 'gallery_ruby',
            },
            {
                title = "Sell Starry Night",
                description = "Starry Night",
                icon = "paint-roller",
                action = 'gallery_night',
            },
            {
                title = "Sell Art",
                description = "Art",
                icon = "gem",
                action = 'gallery_art',
            },
            {
                title = "Sell Golden Coin",
                description = "Coin",
                icon = "coins",
                action = 'gallery_coin',
            },
            {
                title = "Sell Valuable Goods",
                description = "VG",
                icon = "coins",
                action = 'gallery_vg',
            },
            {
                title = "Sell Gold Bars",
                description = "GB",
                icon = "coins",
                action = 'gallery_gb',
            },
            {
                title = "Sell Rolex Watch",
                description = "RW",
                icon = "clock",
                action = 'gallery_rw',
            },
            {
                title = "Sell 8ct Chains",
                description = "8ct",
                icon = "link",
                action = 'gallery_8ct',
            },
        }
        exports["rd-ui"]:showContextMenu(AGGem)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterUICallback('gallery_diamond', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_diamonds')
end)

RegisterUICallback('gallery_aquamarine', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_aquamarine')
end)

RegisterUICallback('gallery_jade', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_jade')
end)

RegisterUICallback('gallery_citrine', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_citrine')
end)

RegisterUICallback('gallery_garnet', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_garnet')
end)

RegisterUICallback('gallery_opal', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_opal')
end)

RegisterUICallback('gallery_ruby', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_ruby')
end)

RegisterUICallback('gallery_night', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_night')
end)

RegisterUICallback('gallery_art', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gellery_sell_stolen_art')
end)

RegisterUICallback('gallery_coin', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gallery_sell_gold_coins')
end)

RegisterUICallback('gallery_vg', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gallery_sell_val_goods')
end)

RegisterUICallback('gallery_gb', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gallery_sell_gold_bars')
end)

RegisterUICallback('gallery_rw', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gallery_sell_rolex_watch')
end)

RegisterUICallback('gallery_8ct', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jobs:gallery_sell_8ct_chains')
end)

-- Sales

-- Mining Gem

RegisterNetEvent('rd-jobs:gellery_sell_diamonds')
AddEventHandler('rd-jobs:gellery_sell_diamonds', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryGem',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Gems.",
            name = "pGemAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryGem', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
        local GemAmount = data.values.pGemAmount
        if exports['rd-inventory']:hasEnoughOfItem('mineddiamond', GemAmount) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*GemAmount, 'Selling Diamond Gems')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('mineddiamond', GemAmount) then
                TriggerEvent('inventory:removeItem', 'mineddiamond', GemAmount)
                TriggerServerEvent('zyloz:payout', 300*GemAmount)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Mining Stone

RegisterNetEvent('rd-jobs:gellery_sell_aquamarine')
AddEventHandler('rd-jobs:gellery_sell_aquamarine', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryStone',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Stones.",
            name = "pAquaAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryStone', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pAquaAmt = data.values.pAquaAmount

    if exports['rd-inventory']:hasEnoughOfItem('minedaquamarine', pAquaAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(250*pAquaAmt, 'Selling Aquamarine')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('minedaquamarine', pAquaAmt) then
                TriggerEvent('inventory:removeItem', 'minedaquamarine', pAquaAmt)
                TriggerServerEvent('zyloz:payout', 255*pAquaAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Mining Jade

RegisterNetEvent('rd-jobs:gellery_sell_jade')
AddEventHandler('rd-jobs:gellery_sell_jade', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryJade',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Jade\'s.",
            name = "pJadeAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryJade', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pJadeAmt = data.values.pJadeAmount

    if exports['rd-inventory']:hasEnoughOfItem('minedjade', pJadeAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pJadeAmt, 'Selling Mined Jade')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('minedjade', pJadeAmt) then
                TriggerEvent('inventory:removeItem', 'minedjade', pJadeAmt)
                TriggerServerEvent('zyloz:payout', 277*pJadeAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Mining Citrine

RegisterNetEvent('rd-jobs:gellery_sell_citrine')
AddEventHandler('rd-jobs:gellery_sell_citrine', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryCitrine',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Citrine.",
            name = "pCitrineAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryCitrine', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pCitrineAmt = data.values.pCitrineAmount
    if exports['rd-inventory']:hasEnoughOfItem('minedcitrine', pCitrineAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2500*pCitrineAmt, 'Selling Citrine')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('minedcitrine', pCitrineAmt) then
                TriggerEvent('inventory:removeItem', 'minedcitrine', pCitrineAmt)
                TriggerServerEvent('zyloz:payout', 225*pCitrineAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Mining Garnet

RegisterNetEvent('rd-jobs:gellery_sell_garnet')
AddEventHandler('rd-jobs:gellery_sell_garnet', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryGarnet',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Garnet.",
            name = "pGarnetAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryGarnet', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pGarnetAmt = data.values.pGarnetAmount
        if exports['rd-inventory']:hasEnoughOfItem('minedgarnet', pGarnetAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pGarnetAmt, 'Selling Garnet')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('minedgarnet', pGarnetAmt) then
                TriggerEvent('inventory:removeItem', 'minedgarnet', pGarnetAmt)
                TriggerServerEvent('zyloz:payout', 250*pGarnetAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            -- else
            --     FreezeEntityPosition(PlayerPedId(), false)
            --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
            -- end
        end
    end
end)

-- Mining Opal

RegisterNetEvent('rd-jobs:gellery_sell_opal')
AddEventHandler('rd-jobs:gellery_sell_opal', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryOpal',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Opal.",
            name = "pOpalAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryOpal', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pOpalAmt = data.values.pOpalAmount
        if exports['rd-inventory']:hasEnoughOfItem('minedopal', pOpalAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pOpalAmt, 'Selling Opal')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('minedopal', pOpalAmt) then
                TriggerEvent('inventory:removeItem', 'minedopal', pOpalAmt)
                TriggerServerEvent('zyloz:payout', 280*pOpalAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Stolen Art

RegisterNetEvent('rd-jobs:gellery_sell_stolen_art')
AddEventHandler('rd-jobs:gellery_sell_stolen_art', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryArt',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Art Pieces.",
            name = "pArtAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryArt', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pArtAmt = data.values.pArtAmount
        if exports['rd-inventory']:hasEnoughOfItem('stolenart', pArtAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pArtAmt, 'Selling Art Pieces')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('stolenart', pArtAmt) then
                TriggerEvent('inventory:removeItem', 'stolenart', pArtAmt)
                TriggerServerEvent('zyloz:payout', 1500*pArtAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Golden Coins

RegisterNetEvent('rd-jobs:gallery_sell_gold_coins')
AddEventHandler('rd-jobs:gallery_sell_gold_coins', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryGoldcoin',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Gold Coin\'s.",
            name = "pGoldCoinAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryGoldcoin', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pGoldCointAmt = data.values.pGoldCoinAmount
        if exports['rd-inventory']:hasEnoughOfItem('goldcoin', pGoldCointAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pGoldCointAmt, 'Selling Golden Coins')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('goldcoin', pGoldCointAmt) then
                TriggerEvent('inventory:removeItem', 'goldcoin', pGoldCointAmt)
                TriggerServerEvent('zyloz:payout', 85*pGoldCointAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Valuable Goods

RegisterNetEvent('rd-jobs:gallery_sell_val_goods')
AddEventHandler('rd-jobs:gallery_sell_val_goods', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryVG',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Valuable Good\'s.",
            name = "pVGAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryVG', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pVGAmt = data.values.pVGAmount
        if exports['rd-inventory']:hasEnoughOfItem('valuablegoods', pVGAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pVGAmt, 'Selling Valuable Goods')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('valuablegoods', pVGAmt) then
                TriggerEvent('inventory:removeItem', 'valuablegoods', pVGAmt)
                TriggerServerEvent('zyloz:payout', 452*pVGAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            -- else
            --     FreezeEntityPosition(PlayerPedId(), false)
            --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
            -- end
        end
    end 
end)

-- Golden Bars

RegisterNetEvent('rd-jobs:gallery_sell_gold_bars')
AddEventHandler('rd-jobs:gallery_sell_gold_bars', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryGoldBar',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Gold Bar\'s.",
            name = "pGoldAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryGoldBar', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pGoldAmt = data.values.pGoldAmount
    if exports['rd-inventory']:hasEnoughOfItem('goldbar', pGoldAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pGoldAmt, 'Selling Valuable Goods')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('goldbar', pGoldAmt) then
                TriggerEvent('inventory:removeItem', 'goldbar', pGoldAmt)
                TriggerServerEvent('zyloz:payout', 6000*pGoldAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            -- else
            --     FreezeEntityPosition(PlayerPedId(), false)
            --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
            -- end
        end
    end
end)

-- Rolex Watch

RegisterNetEvent('rd-jobs:gallery_sell_rolex_watch')
AddEventHandler('rd-jobs:gallery_sell_rolex_watch', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryRolexWatch',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Rolex Watch\'s.",
            name = "pRolexAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryRolexWatch', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pRolexAmt = data.values.pRolexAmount
    if exports['rd-inventory']:hasEnoughOfItem('rolexwatch', pRolexAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pRolexAmt, 'Selling Rolex Watche\'s')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('rolexwatch', pRolexAmt) then
                TriggerEvent('inventory:removeItem', 'rolexwatch', pRolexAmt)
                TriggerServerEvent('zyloz:payout', 214*pRolexAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- 8CT Chains

RegisterNetEvent('rd-jobs:gallery_sell_8ct_chains')
AddEventHandler('rd-jobs:gallery_sell_8ct_chains', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:gallery8Ct',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many 8 CT Chain\'s.",
            name = "p8ctAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:gallery8Ct', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local p8CTAmt = data.values.p8ctAmount
    if exports['rd-inventory']:hasEnoughOfItem('stolen8ctchain', p8CTAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*p8CTAmt, 'Selling Ruby\'s')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('stolen8ctchain', p8CTAmt) then
                TriggerEvent('inventory:removeItem', 'stolen8ctchain', p8CTAmt)
                TriggerServerEvent('zyloz:payout', 50*p8CTAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Ruby

-- Mining Ruby

RegisterNetEvent('rd-jobs:gellery_sell_ruby')
AddEventHandler('rd-jobs:gellery_sell_ruby', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryRuby',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Ruby\'s.",
            name = "pRubyAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryRuby', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pRubyAmt = data.values.pRubyAmount
    if exports['rd-inventory']:hasEnoughOfItem('miningruby', pRubyAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pRubyAmt, 'Selling Ruby\'s')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('miningruby', pRubyAmt) then
                TriggerEvent('inventory:removeItem', 'miningruby', pRubyAmt)
                TriggerServerEvent('zyloz:payout', 200*pRubyAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            end
        -- else
        --     FreezeEntityPosition(PlayerPedId(), false)
        --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
        -- end
    end
end)

-- Starry Night

RegisterNetEvent('rd-jobs:gellery_sell_night')
AddEventHandler('rd-jobs:gellery_sell_night', function()
    exports['rd-ui']:openApplication('textbox', {
        callbackUrl = 'rd-jobs:galleryNight',
        key = 1,
        items = {
          {
            icon = "gem",
            label = "How Many Starry Night\'s.",
            name = "pStarryAmount",
          },
        },
        show = true,
      })
end)

RegisterUICallback('rd-jobs:galleryNight', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local pStarryAmt = data.values.pStarryAmount 
    if exports['rd-inventory']:hasEnoughOfItem('starrynight', pStarryAmt) then
        FreezeEntityPosition(PlayerPedId(), true)
        -- local finished = exports['rd-taskbar']:taskBar(2000*pStarryAmt, 'Selling Starry Night')
        -- if finished == 100 then
            if exports['rd-inventory']:hasEnoughOfItem('starrynight', pStarryAmt) then
                TriggerEvent('inventory:removeItem', 'starrynight', pStarryAmt)
                TriggerServerEvent('zyloz:payout', 750*pStarryAmt)
                FreezeEntityPosition(PlayerPedId(), false)
            -- else
            --     FreezeEntityPosition(PlayerPedId(), false)
            --     TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
            -- end
        end
    end
end)