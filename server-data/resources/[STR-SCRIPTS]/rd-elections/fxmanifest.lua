fx_version 'cerulean'
game 'gta5'

shared_script 'vCode.lua'

client_script '@rd-lib/client/cl_rpcs.lua'
server_script '@rd-lib/server/sv_rpcs.lua'
client_script 'client.lua'
server_script 'server.lua'


ui_page 'html/index.html'
files {
    'html/*.*'
}