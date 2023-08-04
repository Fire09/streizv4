fx_version "cerulean"

game "gta5"

files {
    'dlc_nikez_misc/*.awc',
    'misc.dat54.rel'
}

client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-lib/client/cl_rpcs.lua"
server_script "@rd-lib/server/sv_rpcs.lua"
client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"
client_script "@rd-errorlog/client/cl_errorlog.lua"
server_script "@rd-lib/server/sv_asyncExports.lua"


client_script {
    "client/cl_*.lua",
    "client/cl_*.js"
}

server_script {
    "server/sv_*.lua",
    "server/sv_*.js"
}

data_file 'AUDIO_WAVEPACK' 'dlc_nikez_misc'
data_file 'AUDIO_SOUNDDATA' 'misc.dat'
