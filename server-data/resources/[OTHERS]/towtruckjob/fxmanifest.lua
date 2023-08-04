fx_version 'cerulean'
games {'gta5'}

client_script "@hd-errorlog/client/cl_errorlog.lua"

client_scripts {
  "@hd-lib/client/cl_flags.lua",
  "@hd-sync/client/cl_lib.lua",
  "cl_tow.lua"
}

server_script "sv_tow.lua"
