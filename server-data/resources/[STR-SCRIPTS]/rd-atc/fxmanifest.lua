fx_version 'cerulean'

games {'gta5'}

shared_script '@rd-lib/shared/sh_cacheable.lua'

server_script "@rd-lib/server/sv_infinity.lua"
server_script '@rd-lib/server/sv_rpcs.lua'

server_scripts {
	'server/sv_*.lua',
	'client/**/svm_*.lua',
}

client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script "@rd-infinity/client/classes/blip.lua"
client_script "@rd-lib/client/cl_infinity.lua"
client_script '@rd-lib/client/cl_rpcs.lua'
client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-locales/client/lib.lua"

client_scripts	{
	'client/**/cl_*.lua',
	'client/**/clm_*.lua',
}

