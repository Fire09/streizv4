fx_version 'cerulean'
games { 'gta5' }

client_script "@fyx/client/lib.js"
server_script "@fyx/server/lib.js"
shared_script "@fyx/shared/lib.lua"

client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
  '@rd-lib/client/cl_rpcs.lua',
  'client/cl_*.lua',
  'client/cl_*.js',
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
	'@rd-lib/server/sv_rpcs.lua',
	'@rd-lib/server/sv_sqlother.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}
