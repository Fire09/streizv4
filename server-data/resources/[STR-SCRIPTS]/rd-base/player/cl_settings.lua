STX.SettingsData = STX.SettingsData or {}
STX.Settings = STX.Settings or {}

STX.Settings.Current = {}
-- Current bind name and keys
STX.Settings.Default = {
  ["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["clickVolume"] = 0.8,
    ["radioVolume"] = 0.8,
    ["phoneVolume"] = 0.8,
    ["releaseDelay"] = 200
  },
  ["hud"] = {

  }

}


function STX.SettingsData.setSettingsTable(settingsTable, shouldSend)
  if settingsTable == nil then
    STX.Settings.Current = STX.Settings.Default
    TriggerServerEvent('rd-base:sv:player_settings_set',STX.Settings.Current)
    STX.SettingsData.checkForMissing()
  else
    if shouldSend then
      STX.Settings.Current = settingsTable
      TriggerServerEvent('rd-base:sv:player_settings_set',STX.Settings.Current)
      STX.SettingsData.checkForMissing()
    else
       STX.Settings.Current = settingsTable
       STX.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",STX.Settings.Current)

end

function STX.SettingsData.setSettingsTableGlobal(self, settingsTable)
  STX.SettingsData.setSettingsTable(settingsTable,true);
end

function STX.SettingsData.getSettingsTable()
    return STX.Settings.Current
end

function STX.SettingsData.setVarible(self,tablename,atrr,val)
  STX.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('rd-base:sv:player_settings_set',STX.Settings.Current)
end

function STX.SettingsData.getVarible(self,tablename,atrr)
  return STX.Settings.Current[tablename][atrr]
end

function STX.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(STX.Settings.Default) do
    if STX.Settings.Current[j] == nil then
      isMissing = true
      STX.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  STX.Settings.Current[j][k] == nil then
           STX.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  

  if isMissing then
    TriggerServerEvent('rd-base:sv:player_settings_set',STX.Settings.Current)
  end


end

RegisterNetEvent("rd-base:cl:player_settings")
AddEventHandler("rd-base:cl:player_settings", function(settingsTable)
  STX.SettingsData.setSettingsTable(settingsTable,false)
end)


RegisterNetEvent("rd-base:cl:player_reset")
AddEventHandler("rd-base:cl:player_reset", function(tableName)
  if STX.Settings.Default[tableName] then
      if STX.Settings.Current[tableName] then
        STX.Settings.Current[tableName] = STX.Settings.Default[tableName]
        STX.SettingsData.setSettingsTable(STX.Settings.Current,true)
      end
  end
end)