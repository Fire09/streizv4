RegisterServerEvent("commands:player:login")
AddEventHandler("commands:player:login",function()
    local src = source
    TriggerClientEvent("chat:addSuggestion", src, "/h1", "Put your hat on.")
    TriggerClientEvent("chat:addSuggestion", src, "/h0", "Take your hat off.")
    TriggerClientEvent("chat:addSuggestion", src, "/m1", "Put your mask on.")
    TriggerClientEvent("chat:addSuggestion", src, "/m0", "Take your mask off.")
    TriggerClientEvent("chat:addSuggestion", src, "/g1", "Put your glasses on.")
    TriggerClientEvent("chat:addSuggestion", src, "/g0", "Take your glasses off.")
    TriggerClientEvent("chat:addSuggestion", src, "/atm", "Use clostest atm.")
    TriggerClientEvent("chat:addSuggestion", src, "/bank", "Check your bank balance!")
    TriggerClientEvent("chat:addSuggestion", src, "/cash", "Check your cash balance!")
    TriggerClientEvent("chat:addSuggestion", src, "/outfits", "List all current outfits!")
    TriggerClientEvent("chat:addSuggestion", src, "/pnum", "Shows your phone number to the nearest person!")
    TriggerClientEvent("chat:addSuggestion", src, "/finance", "Enables the finance on the nearest car!")
    TriggerClientEvent("chat:addSuggestion", src, "/enablebuy", "Enables the fullpayment on the nearest car!")
    TriggerClientEvent("chat:addSuggestion", src, "/a", "Used to answer the phone!")
    TriggerClientEvent("chat:addSuggestion", src, "/h", "Used to hangup the phone!")
    TriggerClientEvent("chat:addSuggestion", src, "/trunkgetin", "Crawl in vehicle trunk!")
    TriggerClientEvent("chat:addSuggestion", src, "/trunkejectself", "Attempt to remove self from trunk!")
    TriggerClientEvent("chat:addSuggestion", src, "/anchor", "Anchors Boat")
    TriggerClientEvent("chat:addSuggestion", src, "/ooc_toggle", "Use this to toggle OOC")
    TriggerClientEvent("chat:addSuggestion", src, "/transfer", "Transfer Vehicle to Closest Player")
    TriggerClientEvent("chat:addSuggestion", src, "/givekey", "Hand over the keys for your car!")
    TriggerClientEvent("chat:addSuggestion", src, "/hud", "Customize your hud!")


    --Clothing Stuff
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/outfitadd",
        "Add a outfit.",
        {
            {name = "slot", help = "Slot to save it in"},
            {name = "name", help = "Name of the outfit"}
        }
    )



    -- PD Commands
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/cctv",
        "View cameras in stores",
        {
            {name = "store id", help = "Number"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/serial",
        "Retrieve owner of a weapon",
        {
            {name = "serial", help = "Weapon Serial"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/callsign",
        "Set your callsign",
        {
            {name = "callsign", help = "Callsign"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/311",
        "Non emergancy",
        {
            {name = "report", help = "Report"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/311r",
        "Respond to a 311 call",
        {
            {name = "response", help = "Response"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/911",
        "Emergancy line.",
        {
            {name = "report", help = "Your Emergacy"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/911r",
        "Respond to a 911.",
        {
            {name = "callerid", help = "Callers Paypal ID"},
            {name = "Reply", help = "Response"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/jail",
        "Send a person to jail",
        {
            {name = "id", help = "Their paypal ID"},
            {name = "amount", help = "Time"}
        }
    )
    
    -- MISC
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/e",
        "Express yourself with an emote!",
        {
            {name = "name", help = "Emote name"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/givecash",
        "Give cash to someone",
        {
            {name = "id", help = "Person Server ID"},
            {name = "amount", help = "amount"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/me",
        "Express your feeling.",
        {
            {name = "msg", help = "What do you want to say?"}
        }
    )

    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/disable",
        "Control Commands KEKW.",
        {
            {name = "cmd name", help = "What command?"}
        }
    )
    TriggerClientEvent(
        "chat:addSuggestion", src,
        "/ping",
        "Send someone your location!",
        {
            {name = "id", help = "Whats their server id?"}
        }
    )
end)


RegisterServerEvent("commands:reset:login")
AddEventHandler("commands:reset:login",function()
    local src = source
    TriggerClientEvent("chat:removeSuggestion", src, "/h1")
    TriggerClientEvent("chat:removeSuggestion", src, "/h0")
    TriggerClientEvent("chat:removeSuggestion", src, "/m1")
    TriggerClientEvent("chat:removeSuggestion", src, "/m0")
    TriggerClientEvent("chat:removeSuggestion", src, "/g1")
    TriggerClientEvent("chat:removeSuggestion", src, "/g0")
    TriggerClientEvent("chat:removeSuggestion", src, "/atm")
    TriggerClientEvent("chat:removeSuggestion", src, "/steal")
    TriggerClientEvent("chat:removeSuggestion", src, "/impound")
    TriggerClientEvent("chat:removeSuggestion", src, "/bank")
    TriggerClientEvent("chat:removeSuggestion", src, "/cash")
    TriggerClientEvent("chat:removeSuggestion", src, "/outfits")
    TriggerClientEvent("chat:removeSuggestion", src, "/pnum")
    TriggerClientEvent("chat:removeSuggestion", src, "/fix")
    TriggerClientEvent("chat:removeSuggestion", src, "/finance")
    TriggerClientEvent("chat:removeSuggestion", src, "/enablebuy")
    TriggerClientEvent("chat:removeSuggestion", src, "/givekey")
    TriggerClientEvent("chat:removeSuggestion", src, "/menu")
    TriggerClientEvent("chat:removeSuggestion", src, "/news")
    TriggerClientEvent("chat:removeSuggestion", src, "/a")
    TriggerClientEvent("chat:removeSuggestion", src, "/h")
    TriggerClientEvent("chat:removeSuggestion", src, "/trunkgetin")
    TriggerClientEvent("chat:removeSuggestion", src, "/trunkejectself")
    TriggerClientEvent("chat:removeSuggestion", src, "/me")
    TriggerClientEvent("chat:removeSuggestion", src, "/transfer")
    TriggerClientEvent("chat:removeSuggestion", src, "/hud")


    --Clothing Stuff
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/outfitadd"
    )

    -- PD Commands
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/cctv"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/serial"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/callsign"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/311"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/311r"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/911"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/911r"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/jail"
    )


    -- MISC
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/e"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/givecash"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/disable"
    )
    TriggerClientEvent(
        "chat:removeSuggestion", src,
        "/ping"
    )
end)



RegisterCommand("givekeys", function()
    TriggerEvent("keys:gives")
  end)
