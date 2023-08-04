fx_version 'cerulean'
games { 'gta5' }

client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script "@rd-locales/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-lib/client/cl_rpc.lua"
client_script "config.lua"

client_scripts {
  "client/cl_*.lua",
  "@rd-lib/client/cl_rpc.lua",
}
server_scripts {
  "@rd-lib/server/sv_rpc.lua",
  "@rd-lib/server/sv_sql.lua",
  "server/sv_*.lua"
}
