





games {"gta5"}

fx_version "adamant"
version "1.0"

dependency "rd-base"

server_scripts {
    "@rd-lib/server/sv_sql.lua",
    "server.lua"
}

server_export "AddLog"
server_export "AddLogHex"