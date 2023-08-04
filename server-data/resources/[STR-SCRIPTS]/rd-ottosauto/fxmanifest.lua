fx_version "cerulean"
games { "gta5" }

client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"
client_script "@PolyZone/client.lua"
client_script "@rd-lib/client/cl_polyhooks.lua"
client_script "@stx/client/lib.js"

server_script "@stx/server/lib.js"
server_script "@rd-lib/server/sv_asyncExports.lua"
server_script "@rd-lib/server/sv_sql.lua"
server_script "@rd-lib/client/cl_rpc.lua"
server_script "@rd-lib/server/sv_rpc.lua"


client_scripts {
  "client/cl_*.lua"
}

shared_script {
  "@rd-lib/shared/sh_util.lua",
  "@stx/shared/lib.lua",
  "shared/sh_*.*",
}

server_scripts {
  "server/sv_*.lua"
}
