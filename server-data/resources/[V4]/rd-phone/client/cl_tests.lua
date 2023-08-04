-- RegisterCommand('phone:notify:twitter', function(src, args, raw)
--   serverid = GetPlayerServerId(PlayerId())
--   SendReactMessage('setNotify', {
--     serverid = serverid,
--     app = "phone",
--     data = {
--       action = "notification",
--       target_app = "twitter",
--       title = "@Joe_Mama",
--       body = "Yo yo, good morning LS",
--       show_even_if_app_active = false
--     }
--   })
-- end)

-- RegisterCommand('phone:notify:message', function(src, args, raw)
--   serverid = GetPlayerServerId(PlayerId())
--   SendReactMessage('setNotify', {
--     serverid = serverid,
--     app = "phone",
--     data = {
--       action = "notification",
--       target_app = "messages",
--       title = "Jerry",
--       body = "Yo wassup dude"
--     }
--   })
-- end)

-- RegisterCommand("phone:notify:email", function()
--     local pTime = GetCloudTimeAsInt()
--     RPC.execute("sendEmail", "Test", "Testing Emails", "Hey this is a test email from test.", pTime)
-- end)

-- RegisterCommand('phone:jobnotify', function(src, args, raw)
--   SendReactMessage('setNotify', {
--     app = "phone",
--     data = {
--         action = "job-notification",
--         title = "Current",
--         text = "Take the trash out",
--         icon = { name = "people-carry", color = "white" },
--         bgColor = "#90c9f9",
--     },
--     serverid = serverid
--   })
-- end)

-- RegisterCommand('phone:updatenotify', function(src, args, raw)
--   SendReactMessage('updateNotify', {
--     id = args[1],
--     title = "Current",
--     body = "Return the truck"
--   })
-- end)

-- RegisterCommand('phone:closenotify', function(src, args, raw)
--   SendReactMessage('closeNotify', {
--     id = args[1],
--   })
-- end)

-- RegisterCommand('phone:confirmation', function(src, args, raw)
--   -- DoPhoneConfirmation @params: timeout (in seconds) header body
--   local result = DoPhoneConfirmation(30, "Services Charge", "$46,400 incl tax")
-- end)

-- local devmode = false

-- RegisterCommand("toggledev", function()
--   devmode = not devmode
--   SendReactMessage('toggleDevmode', {
--     bool = not devmode
--   })
-- end)

AddEventHandler('rd-preferences:setPreferences', function(pData)
  SendReactMessage('setPreferences', pData)
end)