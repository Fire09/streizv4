games {'gta5'}

fx_version 'cerulean'

description "Blindfold other players"

client_scripts {
  "client/blindfold.lua",
  "client/cl_gag.lua"
}

server_scripts {
  "server/server.lua"
}

ui_page "nui/index.html"

files {
  "nui/index.html",
  "nui/js/script.js",
  "nui/css/style.css",
  "nui/img/bg.png",
  "nui/headbagon.ogg",
  "nui/headbagoff.ogg",
}