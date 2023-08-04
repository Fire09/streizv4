fx_version 'cerulean'
games { 'gta5' }

client_scripts {
  "@rd-lib/shared/sh_util.lua",
  "@rd-lib/shared/sh_models.lua",
}

shared_scripts {
  "shared/sh_*.lua"
}

client_scripts {
  "@rd-locales/client/lib.lua",
  "@rd-lib/client/cl_state.lua",
  "client/cl_*.lua",
  "client/entries/cl_*.lua"
}

ui_page "html/ui.html"

files {
  "html/ui.html",
  "html/js/*.js",
  'html/css/*.css',
  'html/webfonts/*.eot',
  'html/webfonts/*.svg',
  'html/webfonts/*.ttf',
  'html/webfonts/*.woff',
  'html/webfonts/*.woff2'
}
