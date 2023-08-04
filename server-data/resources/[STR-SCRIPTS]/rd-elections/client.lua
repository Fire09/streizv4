RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent('rd-elections:closeScript', function()
      SetNuiFocus(false, false)  
      SendNUIMessage({
         type = "close",
      })
        
end)


local striez = 0
local raggsyy = 0
local ragzione = 0
local ragzitwo = 0

local candidateone = {}
local candidatetwo = {}

RegisterNetEvent("electionsWinnerCheck")
AddEventHandler("electionsWinnerCheck", function(data)
    if data == "Striez" then
        ragzione = striez + tonumber(1)
        candidateone = data
    end
    if data == "Raggsyy" then
        ragzitwo = raggsyy + tonumber(1)
        candidatetwo = data
    end
end)

RegisterNetEvent("electionsWinnerCheckDatabase")
AddEventHandler("electionsWinnerCheckDatabase", function(data)
    local _context = {
        {
          title = 'Elections Database System',
          description = 'EDS',
          icon = 'circle',
        },
        {
          title = "Striez",
          description = 'Total Votes: '.. ragzione ..'',
          icon = 'vote-yea',
          disabled = true,
          children = {}
        },
        {
         title = "Raggsyy",
         description = 'Total Votes: '.. ragzitwo ..'',
         icon = 'vote-yea',
         disabled = true,
         children = {}
        }
      }
     exports['rd-ui']:showContextMenu(_context)
end)



RegisterNUICallback('getConfig', function(data,cb)
    cb(vCode)
end)

RegisterNUICallback('voteForSomeone', function(data)
    TriggerServerEvent('rd-elections:voteWithData', data.id)
    TriggerServerEvent('electionsWinnerCheck', data.id)
end)

RegisterNUICallback('error', function()
    TriggerEvent("DoLongHudText", "Please Choose A Candidate!", 2)
end)

RegisterNetEvent("openApplicationBallot")
AddEventHandler("openApplicationBallot", function()
    TryToVote()
end)

function TryToVote()
local hasVoted = STR.execute("rd-elections:hasPlayerVoted")
    if hasVoted then
         SendNUIMessage({
            type = 'show',
        })
        SetNuiFocus(true, true)
    else
        TriggerEvent("DoLongHudText", "You Have Already Voted!", 2)
    end
end

