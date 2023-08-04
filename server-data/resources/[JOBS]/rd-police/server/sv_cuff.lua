RegisterServerEvent("rd-police:cuff")
AddEventHandler("rd-police:cuff", function(pTarget)
	local src = source

    TriggerClientEvent("rd-police:getArrested", pTarget, src)
	TriggerClientEvent("rd-police:cuffTransition", src)
end)

RegisterServerEvent("rd-police:uncuff")
AddEventHandler("rd-police:uncuff", function(pTarget)
	TriggerClientEvent("rd-police:uncuff", pTarget)
end)

RegisterServerEvent("rd-police:softcuff")
AddEventHandler("rd-police:softcuff", function(pTarget)
    TriggerClientEvent("rd-police:handCuffedWalking", pTarget)
end)

RPC.register("isPedCuffed", function(src, pTarget)
	local isCuffed = RPC.execute(pTarget, "isPlyCuffed")
	return isCuffed
end)