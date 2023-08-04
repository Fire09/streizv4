local requestRightOfWayBoardTwo = {}

RegisterServerEvent("rd-business:server:changeRightOfWayBoard")
AddEventHandler("rd-business:server:changeRightOfWayBoard",function(requestRightOfWayBoard)
  requestRightOfWayBoardTwo = requestRightOfWayBoard
  TriggerClientEvent("rd-business:client:updateRightOfWayBoard", -1, requestRightOfWayBoard) 
end)

RegisterServerEvent("rd-business:server:requestRightOfWayBoard")
AddEventHandler("rd-business:server:requestRightOfWayBoard",function()
  TriggerClientEvent("rd-business:client:updateRightOfWayBoard", -1, requestRightOfWayBoardTwo)
end)

