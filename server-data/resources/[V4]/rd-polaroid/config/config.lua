
Config = {}

Config.Framework = 'qbcore'  -- 'esx' or 'qbcore'
Config.Database = 'oxmysql'  -- 'oxmysql' or 'mysql-async' or 'ghmattimysql'
Config.DebugCommand = true
Config.PrintingTime = 8000
Config.ShowTime = 5000
Config.ScreenShotBasicResourceName = 'screenshot-basic'
Config.aspectRatio = 1  --0 to 16:9 / 1 to 1:1   dont change if you dont know what you are doing

Config.Lang = {
    InVehicle = 'You can\'t use this in a vehicle',
    YouPrintPhoto = 'You printed a photo',
    YouDigitalizePhoto = 'You digitalized a photo',
}

Config.ProgressbarPrinting = function()
    -- exports['progressBars']:startUI(Config.PrintingTime, "Printing...")  --You can use your own progressbar (this progressbar is from https://github.com/EthanPeacock/progressBars/releases/tag/1.0) 
    exports['progressbar']:Progress({ --this progressbar is from here https://github.com/Project-Sloth/progressbar
        name = "idk",
        duration = Config.PrintingTime,
        label = "Printing...",
        icon = "fa-solid fa-print",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        },
    })
end

Config.NotificationFunction = function(msg)
    --set your notification function here
    print(msg)
end