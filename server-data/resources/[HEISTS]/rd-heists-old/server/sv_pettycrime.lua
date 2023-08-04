RegisterServerEvent('rd-pettycrime:atm:moneyreward')
AddEventHandler('rd-pettycrime:atm:moneyreward', function(money)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
	if user:getCash() >= money then
        user:addMoney(money)
	end
end)

RegisterServerEvent("rd-pettycrime:atm:clrspawn")
AddEventHandler("rd-pettycrime:atm:clrspawn", function()
    TriggerClientEvent("rd-pettycrime:atm:clrspawn", -1)
end)

RegisterServerEvent("rd-pettycrime:atm:attachRope")
AddEventHandler("rd-pettycrime:atm:attachRope", function(pr1, pr2)
    TriggerClientEvent("rd-pettycrime:atm:attachRope", -1, pr1, pr2)
end)

RegisterServerEvent("rd-pettycrime:atm:attachRope2")
AddEventHandler("rd-pettycrime:atm:attachRope2", function(dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
    TriggerClientEvent("rd-pettycrime:atm:attachRope2", -1, dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
end)

RegisterServerEvent("rd-pettycrime:atm:prop")
AddEventHandler("rd-pettycrime:atm:prop", function(ObjNet)
    TriggerClientEvent("rd-pettycrime:atm:prop", -1, ObjNet)
end)

RegisterServerEvent("rd-pettycrime:atm:delete")
AddEventHandler("rd-pettycrime:atm:delete", function(ATMObjectDelete)
    TriggerClientEvent("rd-pettycrime:atm:delete", -1, ATMObjectDelete)
end)

RegisterServerEvent("rd-pettycrime:atm:deleteRope")
AddEventHandler("rd-pettycrime:atm:deleteRope", function(rope)
    TriggerClientEvent("rd-pettycrime:atm:deleteRope", -1, rope)
end)