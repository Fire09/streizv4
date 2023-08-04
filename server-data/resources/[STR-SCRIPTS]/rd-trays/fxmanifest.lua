fx_version "cerulean"

games { "gta5" }

description "riddle Boilerplate"

version "0.1.0"

client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-locales/client/lib.lua"
client_script "@rd-lib/client/cl_rpc.lua"

server_scripts {
    "build/server/*.lua",
}

client_scripts {
    "build/client/*.lua",
}
