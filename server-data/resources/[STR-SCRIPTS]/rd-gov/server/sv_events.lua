RegisterServerEvent('rd-healthcare:updateBoardRoomUrl')
AddEventHandler('rd-healthcare:updateBoardRoomUrl', function(url)
    TriggerClientEvent('rd-healthcare:boardRoomUrlUpdated', -1, url)
    getDuiUrl = url
end)

local getDuiUrl = {}

RPC.register("rd-gov:getScreenUrl", function()
    if getDuiUrl ~= nil then
        getDuiUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
    end
    return getDuiUrl
end)

STR.register("rd-gov:stateAnnouncement", function(src, pText, pType)
    if pType == "default" then
        TriggerClientEvent('chatMessage', -1, "^1[State Announcement]", {135, 103, 150}, pText)
    end
    if pType == "alert" then
        TriggerClientEvent('chatMessage', -1, "^1[Public Safety Alert]", {135, 103, 150}, pText)
    end
    if pType == "court" then
        TriggerClientEvent('chatMessage', -1, "^1[Court Announcement]", {135, 103, 150}, pText)
    end
end)