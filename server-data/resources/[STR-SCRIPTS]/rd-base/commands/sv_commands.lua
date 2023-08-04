STX.Commands = STX.Commands or {}
STX.Commands.Registered = STX.Commands.Registered or {}

AddEventHandler("rd-base:exportsReady", function()
    addModule("Commands", STX.Commands)
end)
