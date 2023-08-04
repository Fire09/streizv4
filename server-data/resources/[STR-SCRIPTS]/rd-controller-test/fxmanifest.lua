fx_version 'cerulean'

game 'gta5'

description 'NoPixel Controller Test'

version '1.0.0'

lua54 'yes'

client_script "@rd-lib/client/cl_rpc.lua"
server_script "@rd-lib/server/sv_rpc.lua"

client_scripts {
    'cl_*.lua',
}

server_scripts {
    'sv_*.lua',
}
