-- Citizen.CreateThread(function()
--   local w = exports["rd-lib"]:getDui('https://i.imgur.com/qpY27Zg.gif', 512, 512)
--   AddReplaceTexture('ig_dw', 'teef_diff_002_a_uni', w.dictionary, w.texture)
-- end)

RegisterNetEvent("rd-helmet:changeDui", function(pUrl)
  local w = exports["rd-lib"]:getDui(pUrl, 512, 512)
  AddReplaceTexture('ig_dw', 'teef_diff_002_a_uni', w.dictionary, w.texture)
end, false)
