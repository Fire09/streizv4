fx_version "cerulean"
games {"gta5"}

client_script "@rd-errorlog/client/cl_errorlog.lua"

client_script {
    "@rd-lib/client/cl_rpc.lua",
    "@rd-locales/client/lib.lua",
    "client/cl_main.lua"
}


server_scripts {
    "@rd-lib/shared/sh_util.lua",
    "@rd-lib/server/sv_rpc.lua",
    "@rd-lib/server/sv_sql.lua",
    "server/sv_main.lua"
}