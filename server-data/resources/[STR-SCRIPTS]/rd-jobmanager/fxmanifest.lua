fx_version 'bodacious'
game 'gta5'

resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script "@rd-lib/client/cl_rpcs.lua"
server_script "@rd-lib/server/sv_rpcs.lua"

shared_script "shared/sh_jobmanager.lua"

server_script "server/sv_jobmanager.lua"
client_script "client/cl_jobmanager.lua"
