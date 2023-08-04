fx_version 'cerulean'
games {'gta5'}

-- dependency "rd-base"
-- dependency "raid_clothes"

ui_page "html/index.html"
files({
	"html/*",
	"html/images/*",
	"html/css/*",
	"html/webfonts/*",
	"html/js/*"
})

client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"

client_script '@rd-lib/client/cl_rpc.lua'
client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script "client/*"

shared_script "shared/sh_spawn.lua"
shared_script "@rd-lib/shared/sh_cache.lua"
server_scripts {
  '@rd-lib/server/sv_sql.lua',
  '@rd-lib/server/sv_asyncExports.lua',
  '@rd-lib/server/sv_rpc.lua',
}
server_script "server/*"
