-- Manifest
fx_version 'cerulean'
games {'gta5'}

description 'FiveM LSPD Heli Cam by mraes'

client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-lib/client/cl_infinity.lua"
server_script "@rd-lib/server/sv_infinity.lua"

client_script 'heli_client.lua'
server_script 'heli_server.lua'
