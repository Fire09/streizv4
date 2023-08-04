fx_version 'bodacious'
games { 'rdr3', 'gta5' }

client_scripts {
    '@rd-lib/client/cl_rpc.lua',
    '@rd-lib/client/cl_ui.lua',
    'client_whitelist_jobs/cl_*.lua',
    'client_jobs/cl_*.lua',
    'hunting_client/cl_*.lua',
}


server_scripts {
    '@rd-lib/server/sv_rpc.lua',
    'hunting_server/sv_*.lua',
    'server_whitelist_jobs/server*.lua',
    'server_jobs/server*.lua',
    'server_jobs/sv_*.lua',
}

shared_scripts{
    'shared_jobs/cl_*.lua'
}

exports{
    'canDropPackage',
    'canFixElec'
}