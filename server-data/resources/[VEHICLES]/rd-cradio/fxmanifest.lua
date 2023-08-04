fx_version "cerulean"

games { "gta5" }

description "Riddle Boilerplate"

version "0.1.0"

server_script "@rd-lib/server/sv_sql.js"
server_script "@rd-lib/server/sv_rpc.js"
server_script "@rd-lib/server/sv_asyncExports.js"

server_scripts {
    "@rd-lib/server/sv_rpc.lua",
    "@oxmysql/lib/MySQL.lua",
    "server/*.js",
    "server/sv_*.lua",
}

client_scripts {
    "@rd-lib/client/cl_rpc.lua",
    "client/cl_*.lua",
}
