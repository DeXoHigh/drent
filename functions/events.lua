-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  
RegisterNUICallback("rent",function(data)
    local model = data.model
    local price = data.price
    local location = data.location

    rent_vehicle(model, price, location)
end)

RegisterNUICallback("CloseUI",function()
    close_ui()
end)
