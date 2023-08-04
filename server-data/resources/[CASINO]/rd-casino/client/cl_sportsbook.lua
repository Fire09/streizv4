-- RegisterUICallback("rd-ui:casino:updateEvent", function(data, cb)
--   data.type = "edit-event"
--   local success, result = RPC.execute("rd-casino:sportsbook:updateData", data)
--   cb({ data = result, meta = { ok = success, message = result }})
-- end)

-- RegisterUICallback("rd-ui:casino:sportsBookPlaceBet", function(data, cb)
--   data.type = "place-bet"
--   local success, result = RPC.execute("rd-casino:sportsbook:updateData", data)
--   cb({ data = result, meta = { ok = success, message = result }})
-- end)

-- RegisterUICallback("rd-ui:casinoGetSportsBookData", function(data, cb)
--   local success, result = RPC.execute("rd-casino:sportsbook:getData")
--   cb({ data = result, meta = { ok = success, message = result }})
-- end)

-- RegisterUICallback("rd-ui:casino:finishEvent", function(data, cb)
--   local success, result = RPC.execute("rd-casino:sportsbook:finishEvent", data)
--   cb({ data = result, meta = { ok = success, message = result }})
-- end)
