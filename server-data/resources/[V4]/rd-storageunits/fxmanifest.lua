fx_version 'cerulean'
game 'gta5'
 
lua54 'yes' -- Add in case you want to use lua 5.4 (https://www.lua.org/manual/5.4/manual.html)

client_script "@rd-lib/client/cl_ui.lua"

client_script {
    "@rd-lib/client/cl_rpc.lua",
	'shared/shared.lua',
	'client/client.lua'
}

server_scripts {	
    "@rd-lib/server/sv_rpc.lua",
    'shared/shared.lua',	
    'core_func.lua',	
	'server/server.lua',
    "@oxmysql/lib/MySQL.lua"
}
