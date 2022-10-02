-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  
fx_version 'cerulean'
games { 'gta5' }
lua54 'true'

author 'Redyy'
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
