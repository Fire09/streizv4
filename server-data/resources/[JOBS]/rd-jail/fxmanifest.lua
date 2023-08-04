fx_version 'bodacious'
game 'gta5'

resource_manifest_version '05cfa83c-a124-4crd-a768-c24a5811d8f9'

client_script '@rd-lib/client/cl_ui.lua'
client_script "@rd-errorlog/client/cl_errorlog.lua"

client_script {
    'client/cl_jail_jobs.lua',
    'client/cl_jail.lua'
}

server_script {
    'server/sv_jail_jobs.lua',
    "@oxmysql/lib/MySQL.lua",
    'server/sv_jail.lua'
}