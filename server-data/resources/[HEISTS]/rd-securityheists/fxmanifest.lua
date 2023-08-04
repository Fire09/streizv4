fx_version 'adamant'
games { 'gta5' }

client_scripts {
    '@rd-lib/client/cl_rpc.lua',
    '@rd-lib/client/cl_ui.lua',
    '@rd-lib/client/cl_ui.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

client_script "@rd-errorlog/client/cl_errorlog.lua"