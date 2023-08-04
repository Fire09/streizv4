fx_version "cerulean"

games { "gta5" }

description "Hydeck Locale System"

version "0.1.0"

client_script "@rd-lib/client/cl_ui.js"
client_script "@rd-lib/client/cl_rpc.js"

client_scripts {
    "client/*.js",
    "client/*.lua",
}

shared_scripts {
    "shared/*.js"
}
