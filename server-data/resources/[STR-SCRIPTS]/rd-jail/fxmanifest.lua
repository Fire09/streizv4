fx_version 'bodacious'
game 'gta5'

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'


client_script "@rd-errorlog/client/cl_errorlog.lua"

client_script {
    '@rd-lib/client/cl_ui.lua',
    '@rd-lib/client/cl_ui.lua',
    'client.lua',
}

server_script 'server.lua'

