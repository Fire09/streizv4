fx_version 'cerulean'
games {'gta5'}

-- dependency "rd-base"


client_script "@rd-errorlog/client/cl_errorlog.lua"

client_script "client/cl_storage.lua"


exports {
	'tryGet',
	'remove',
	'set',
	'setDev'
} 