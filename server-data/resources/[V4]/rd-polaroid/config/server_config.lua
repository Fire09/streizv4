
ServerConfig = {}

ServerConfig.DiscordWebHook = 'https://discord.com/api/webhooks/970480716183920680/xYJvU6295ISemqHgHYgS-mBJHm74bsfdKENSCWHNw_rCYgeeB9kEH5_NuojQW6ofajII'  --DISCORD WEBHOOK URL

Citizen.CreateThread(function()

	lib.callback.register('ps-polaroid:server:getWebhook', function(source, item, metadata, target)
		return ServerConfig.DiscordWebHook
	end)

    if Config.Framework == 'esx' then
		ESX = exports['es_extended']:getSharedObject()

		ESX.RegisterUsableItem('album', function(src)
            TriggerClientEvent("ps:openAlbum", src)
        end)

        ESX.RegisterUsableItem('polaroid', function(src)
            TriggerClientEvent("ps:openPolaroid", src)
        end)

		ESX.RegisterUsableItem('printerpolaroid', function(src)
			TriggerClientEvent("ps-polaroid:openPrinter", src)
        end)

		RegisterNetEvent('ps_polaroid:add')
        AddEventHandler('ps_polaroid:add', function(src, link, date)
			local Player = ESX.GetPlayerFromId(src)
			insertPolaroid(Player.identifier, link, date)
			TriggerClientEvent('ps-polaroid-uploadPhoto', src, link, date)
        end)

		RegisterNetEvent('ps_polaroid:GivePlayer')
        AddEventHandler('ps_polaroid:GivePlayer', function(data)
			local Player = ESX.GetPlayerFromId(source)
			local Player2 =  ESX.GetPlayerFromId(tonumber(data.id))
			if Player ~= nil and Player2 ~= nil then
				deletePolaroid(Player.identifier, data.img)
				insertPolaroid(Player2.identifier, data.img, data.date, data.msg or '')
				TriggerClientEvent('ps-polaroid-uploadPhoto', tonumber(data.id), data.img, data.date, data.msg)
			else
				TriggerClientEvent('ps-polaroid-uploadPhoto', source, data.img, data.date, data.msg)
			end
        end)

		RegisterNetEvent('ps-polaroid:removeitem')
        AddEventHandler('ps-polaroid:removeitem', function(item)
			local Player = ESX.GetPlayerFromId(source)
			if Player ~= nil then
				Player.removeInventoryItem(item, 1)
			end
        end)
		
        AddEventHandler('esx:playerLoaded', function(player)
			TriggerEvent("polaroid:init", player)
		end)

		ESX.RegisterServerCallback('ps-polaroid:ui:haveitem', function(source, cb, item)
			local Player = ESX.GetPlayerFromId(source)
			local HasItem = Player.getInventoryItem(item)
		
			if Player and HasItem ~= nil then
				if HasItem.count >= 1 then
					cb(true)
				else
					cb(false)
				end
			else
				print('[ps-polaroid ERROR] [ESX] [HaveItem] [Dont have item]')
			end
		end)

		if Config.DebugCommand then
			RegisterCommand('respawn', function(source, args, rawCommand)
				TriggerEvent('polaroid:init', source)
			end)
		end

        function GetIdentifier(src)
			local Player = ESX.GetPlayerFromId(src)
			if Player ~= nil then
				local id = Player.identifier
				return id
			else 
				return nil
			end
		end

    elseif Config.Framework == 'qbcore' then
        QBCore = exports['qb-core']:GetCoreObject()

		QBCore.Functions.CreateUseableItem('album', function(src)
			TriggerClientEvent("ps:openAlbum", src)
		end)

		QBCore.Functions.CreateUseableItem('photo', function(src, item)
			local photo = item.info.photo
            local Player = QBCore.Functions.GetPlayer(src)
			if Player ~= nil then
                Player.Functions.RemoveItem('photo', 1, item.slot)
                insertPolaroid(Player.PlayerData.citizenid, photo.img, photo.date, photo.msg)
                TriggerClientEvent('ps-polaroid-uploadPhoto', src, photo.img, photo.date, photo.msg)
            end
		end)

        QBCore.Functions.CreateUseableItem('polaroid', function(src)
			TriggerClientEvent("ps:openPolaroid", src)
		end)

		QBCore.Functions.CreateUseableItem('printerpolaroid', function(src)
			TriggerClientEvent("ps-polaroid:openPrinter", src)
		end)

        RegisterNetEvent('ps_polaroid:add')
        AddEventHandler('ps_polaroid:add', function(src, link, date)
			local Player = QBCore.Functions.GetPlayer(src)
			if Player ~= nil then
                Player.Functions.AddItem("photo", 1, false, {photo = {img = link, date = date}})
            end
        end)

        RegisterNetEvent('ps_polaroid:GetFromAlbum')
        AddEventHandler('ps_polaroid:GetFromAlbum', function(link, date, msg)
			local Player = QBCore.Functions.GetPlayer(source)
			if Player ~= nil then
                Player.Functions.AddItem("photo", 1, false, {photo = {img = link, date = date, msg = msg}})
				deletePolaroid(Player.PlayerData.citizenid, link)
            end
        end)

		RegisterNetEvent('ps-polaroid:removeitem')
        AddEventHandler('ps-polaroid:removeitem', function(item)
            local Player = QBCore.Functions.GetPlayer(source)
			if Player ~= nil then
                Player.Functions.RemoveItem(item, 1)
            end
        end)

        AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
			local src = player.PlayerData.source
			TriggerEvent("polaroid:init", src)
		end)

		if Config.DebugCommand then
			RegisterCommand('respawn', function(source, args, rawCommand)
				TriggerEvent('polaroid:init', source)
			end)
		end

        function GetIdentifier(src)
			local Player = QBCore.Functions.GetPlayer(src)
			if Player ~= nil then
				local id = Player.PlayerData.citizenid
				return id
			else 
				return nil
			end
		end
    end
end)
