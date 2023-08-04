





fx_version "adamant"

games {"gta5"}

description "Riddle Infinity Helper"

version "1.0.0"

client_scripts {
    "@rd-lib/client/cl_rpc.lua",
    "client/classes/*.lua",
    "client/cl_*.lua"
}

server_scripts {
    '@rd-lib/server/sv_sql.lua',
    "@rd-lib/server/sv_rpc.lua",
    '@rd-lib/server/sv_asyncExports.lua',
    "server/sv_*.lua"
}

server_script "tests/sv_*.lua"
client_script "tests/cl_*.lua"
