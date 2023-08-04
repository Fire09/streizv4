fx_version 'cerulean'
games { 'gta5' }

--[[ dependencies {
  "rd-polyzone",
  "rd-lib",
  "rd-ui"
} ]]--

shared_script "shared/zones.lua"

client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  '@rd-lib/server/sv_asyncExports.lua',
  '@rd-lib/server/sv_rpc.lua',
  'server/sv_*.lua',
}
