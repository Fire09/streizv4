fx_version "cerulean"
games { "gta5" }

ui_page "nui/dist/index.html"

files {
    "nui/dist/index.html",
    "nui/dist/js/app.js",
    "nui/dist/css/app.css",
    "nui/dist/img/tablet.png",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@rd-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts{
    "@rd-lib/client/cl_rpc.lua",
    "@rd-lib/client/cl_interface.lua",
	  "@rd-lib/client/cl_ui.lua",
    "client/config.lua",
    "client/utils.lua",
    "client/api.lua",
    "client/exports.lua",
    "client/commands.lua",
    "client/events.lua",
    "client/nui_cb.lua",
    "client/creation.lua",
    "client/checkpoint_race.lua",
}