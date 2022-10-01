-- by Redyy#0449
fx_version 'cerulean'
games { 'gta5' }
lua54 'true'

author 'DeXo'
version '1.0'

ui_page {'html/index.html'}

client_scripts {
	"@vrp/core_client/Tunnel.lua",
	"@vrp/core_client/Proxy.lua",
    'config.lua',
    'client/main.lua',
    'functions/main.lua',
    'functions/events.lua',
}
server_script {'@vrp/lib/utils.lua', 'config.lua', 'server/main.lua'}

files {'html/index.html','html/js/*.js','html/css/*.css', 'html/assets/*.png', 'html/assets/*.jpg'}
