fx_version 'cerulean'
games {'gta5'}

ui_page "ui/index.html"

files({
    "ui/index.html",
    "ui/js/*.js",
    "ui/css/*.css",
    "ui/media/*.ogg",
    "ui/images/*.svg",
    "ui/images/*.png",
    "ui/images/*.jpg"
})

client_scripts {
    '@rd-libh/client/cl_rpc.lua',
    'client/cl_exports.lua',
    'client/cl_lib.lua',
    'client/model/cl_*.lua'
  }
  
  server_scripts {
    '@rd-libh/server/sv_rpc.lua',
    'server/sv_*.lua',
    'server/sv_*.js'
  }