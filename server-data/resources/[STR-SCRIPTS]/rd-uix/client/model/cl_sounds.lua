-- sounds go in ui/src/assets/sounds - .ogg format
RegisterCommand('sounds:playall', function()
  for i = 1, 5 do
    SendUIMessage({
      source = "rd-nui",
      app = "sounds",
      data = {
        action = 'play',
        id = i,
        name = 'demo',
        loop = true,
        volume = 0.5 -- 0 to 1
      }
    })
    Wait(300)
  end
end)

RegisterCommand('sounds:stopall', function()
  for i = 1, 5 do
    SendUIMessage({
      source = "rd-nui",
      app = "sounds",
      data = {
        action = 'stop',
        id = i
      }
    });
    Wait(300)
  end
end)

RegisterCommand("sounds:play", function()
  exports["rd-uix"]:soundPlay(1, "demo", 0.5)
end, false)

RegisterCommand("sounds:stop", function()
  exports["rd-uix"]:soundStop(1)
end, false)

RegisterCommand("sounds:volume", function()
  exports["rd-uix"]:soundVolume(1, 0.1)
end, false)
