fx_version 'adamant'
games { 'gta5' }

dependencies { "mka-lasers" }

client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"

client_scripts {
	'@rd-lib/client/cl_ui.lua',
	'@rd-lib/client/cl_ui.lua',
	"@mka-lasers/client/client.lua",
	'@rd-lib/client/cl_rpc.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/*.lua',
	'config.lua',
}

server_scripts {
	'@rd-lib/server/sv_rpc.lua',
	'@rd-lib/server/sv_sql.lua',
	'server/*.lua',
	'config.lua',
}

export 'GetVarStatus'