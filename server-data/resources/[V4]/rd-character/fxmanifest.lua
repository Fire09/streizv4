fx_version "cerulean"

games { "gta5" }

description "NoPixel Character Types"

version "0.1.0"

server_script "@stx/server/lib.js"
server_script "@rd-lib/server/sv_asyncExports.js"
server_script "@rd-db/server/lib.js"

client_script "@stx/client/lib.js"
client_script "@rd-lib/client/cl_ui.js"
client_script "@rd-locales/client/lib.js"

server_scripts {
    "server/sv_*.js",
}

client_scripts {
    "client/cl_*.js",
}
