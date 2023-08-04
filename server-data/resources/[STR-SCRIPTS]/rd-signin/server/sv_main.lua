local currentCops = 0
local currentEMS = 0
local currentDocs = 0

RegisterServerEvent("rd-signin:duty")
AddEventHandler("rd-signin:duty", function(pJobType, pSrc)
    local src = (pSrc == nil and source or pSrc)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local jobs = exports["rd-base"]:getModule("JobManager")
	local character = user:getCurrentCharacter()
    if pJobType == nil then pJobType = "police" end
    local job = pJobType
	exports.oxmysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		jobs:SetJob(user, job, false, function()
			if result[1].callsign ~= nil then
				pCallSign = result[1].callsign
			else
				pCallSign = "000"
			end
        if pJobType == "police" then
            TriggerClientEvent("DoLongHudText", src, "10-41 and Restocked.", 17)
            TriggerClientEvent("startSpeedo", src)
            TriggerClientEvent("nowCopGarage", src, pJobType)
            TriggerEvent('rd-eblips:server:registerPlayerBlipGroup', src, job)
            TriggerEvent('rd-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
            currentCops = currentCops + 1
        elseif pJobType == "doc" then
            TriggerClientEvent("DoLongHudText", src, "10-41 Signed in as DOC.", 17)
            TriggerClientEvent("nowCopGarage", src, pJobType)
            currentDocs = currentDocs + 1
            TriggerEvent('rd-eblips:server:registerPlayerBlipGroup', src, job)
            TriggerEvent('rd-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
        elseif pJobType == "ems" then
            TriggerClientEvent("DoLongHudText", src, "10-41 Signed in as EMS.", 17)
            TriggerClientEvent("hasSignedOnEms",src)
            TriggerClientEvent("police:officerOnDuty", src)
            currentEMS = currentEMS + 1
            TriggerEvent('rd-eblips:server:registerPlayerBlipGroup', src, job)
            TriggerEvent('rd-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
        elseif pJobType == "judge" then
            TriggerClientEvent("isJudge",src)
            Wait(1000)
            TriggerEvent("isJudge",src)
        elseif pJobType == "doctor" then
            TriggerClientEvent("1sDoctor",src)
            TriggerClientEvent("job:doccount", -1, currentDocs)
            Wait(1000)
            TriggerEvent("isDoctor",src)
            TriggerEvent('rd-eblips:server:registerPlayerBlipGroup', src, job)
            TriggerEvent('rd-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
        elseif pJobType == "therapist" then
            TriggerClientEvent("isTherapist",src)
            Wait(1000)
            TriggerEvent("isTherapist",src)
            TriggerEvent('rd-eblips:server:registerPlayerBlipGroup', src, job)
            TriggerEvent('rd-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
        else
            TriggerClientEvent("DoLongHudText", src, ("You are now signed in as %s"):format(pJobType), 17)
            end
        end)
    end)
end)

RegisterServerEvent('remove:Blips:Duty')
AddEventHandler('remove:Blips:Duty', function()
    local src = source
    TriggerEvent('rd-eblips:server:removePlayerBlipGroup', source, 'police')
    TriggerEvent('rd-eblips:server:removePlayerBlipGroup', source, 'police')
    TriggerEvent('rd-eblips:server:removePlayerBlipGroup', source, 'ems')
    TriggerEvent('rd-eblips:server:removePlayerBlipGroup', source, 'doctor')
    TriggerEvent('rd-eblips:server:removePlayerBlipGroup', source, 'judge')
end)