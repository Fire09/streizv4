fx_version 'adamant'
game 'gta5'


client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script '@rd-lib/client/cl_ui.lua'

client_scripts{
    'client.lua',
    '@rd-lib/client/cl_rpc.lua',
    "@rd-errorlog/client/cl_errorlog.lua"
}

server_scripts{
    'server.lua',
	'@rd-lib/server/sv_rpc.lua',
    '@rd-lib/server/sv_sql.lua'
    
}
server_script "@rd-lib/server/sv_sql.lua"