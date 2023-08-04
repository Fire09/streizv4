fx_version "cerulean"

game { "gta5" }

shared_scripts {
    "shared/config.lua"
}

client_scripts {
    "@rd-lib/client/cl_ui.lua",
    "@rd-locales/client/lib.lua",
    "@rd-lib/client/cl_rpc.lua",
    "client/cl_utils.lua",
    "client/cl_main.lua",
    "client/cl_spawn.lua"
}

server_scripts {
    "@rd-lib/server/sv_sql.lua",
    "@rd-lib/shared/sh_util.lua",
    "@rd-lib/server/sv_rpc.lua",
    "@rd-lib/server/sv_asyncExports.lua",
    "server/sv_utils.lua",
    "server/sv_main.lua"
}