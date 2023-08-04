game 'gta5'
fx_version 'adamant'
lua54 'yes'


server_script '@rd-lib/server/sv_rpcs.lua'
server_script 'sv_main.lua'
client_script "@rd-lib/client/cl_ui.lua"

client_script {
    '@rd-lib/client/cl_rpcs.lua',
    '@rd-lib/client/cl_ui.lua',
    'cl_main.lua',
    'config.lua'
}
