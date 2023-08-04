fx_version 'cerulean'

games {
    'gta5',
    'rdr3'
}

server_script '@stx/server/lib.js'
client_script '@stx/client/lib.js'
shared_script '@stx/shared/lib.lua'

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  '@rd-lib/client/cl_rpc.lua',
  '@rd-lib/client/cl_ui.lua',
  '@rd-lib/client/cl_ui.lua',
  '@rd-lib/client/cl_polyhooks.lua',
  '@rd-lib/shared/sh_cacheable.lua',
	'client/cl_*.lua'
}

shared_scripts {
  '@rd-lib/shared/sh_util.lua',
	"shared/*.lua"
}

server_scripts {
  '@rd-lib/server/sv_rpc.lua',
  '@rd-lib/server/sv_sql.lua',
  "@rd-lib/server/sv_asyncExports.lua",
	'server/*.lua'
}
