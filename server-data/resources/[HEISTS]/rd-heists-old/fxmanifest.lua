fx_version 'adamant'
games { 'gta5' }

client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
	'@rd-lib/client/cl_rpc.lua',
	-- '@mka-lasers/client/client.lua',
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