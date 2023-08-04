fx_version 'cerulean'
games { 'rdr3', 'gta5' }

-- --[[ dependencies {
--   "rd-lib",
--   "rd-ui"
-- } ]]--

server_scripts {
  '@rd-lib/server/sv_rpcs.lua',
  '@rd-lib/server/sv_sql.lua',
  'server/config.lua',
  'server/sv_*.lua',
}

lua54 'yes'