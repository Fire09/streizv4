fx_version 'cerulean'
games {'gta5'}


shared_script "@mka-array/Array.lua"
shared_script "@rd-lib/shared/sh_cacheable.lua"

server_script {
	"@rd-lib/server/sv_infinity.lua",
	'@rd-lib/server/sv_rpc.lua',
	'server/sr_autoKick.lua',
	'server/carhud_server.lua',
}

client_script {
	"@rd-errorlog/client/cl_errorlog.lua",
	"@rd-lib/client/cl_infinity.lua",
	'@rd-lib/client/cl_rpc.lua',
	'client/newsStands.lua',
	'client/cl_playerbuffs.lua',
	'client/carhud.lua',
}

exports {
	"playerLocation",
	"playerZone"
}

