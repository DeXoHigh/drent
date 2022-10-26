-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  
Config = {}

Config.Options = {
    ['time'] = true, -- Enable time for rent.
    ['time_rent'] = 10, -- Time for rent in minutes.
    ['time_finished'] = 'Masina pe care ai inchiriat-o a fost returnata !', -- Message when time is finished.
    ['car_error'] = 'Masina nu a fost incarcata!', -- Message when car is not loaded.
    ['rent_no_money'] = 'Nu ai suficienti bani pentru a cumpara aceasta masina.', -- Message when player has no money.
}

Config.Locations = {
    ['Primarie'] = { -- Location name.
        coords = vector3(256.98416137695,-376.92916870117,44.555820465088), -- Location coords.
        spawn_coords = {x =235.54547119141, y =-369.52252197266, z=43.851169586182}, -- Spawn coords.

        markers = { -- Markers.
            spawn = {
                key = 38, -- Key for marker. ( E = 38)
                type = 21, -- Marker type.
                size  = {x = 0.3, y = 0.3, z = 0.3}, -- Marker size.
                color = {r = 3, g = 140, b = 252}, -- Marker color. In RGB.
                text = '[ ~b~E~w~ ] Rent Vehicle' -- Marker text.
            }
        },
        blips = {
            spawn = {
                name = 'Rent Primarie', -- Blip name.
                sprite = 523, -- Blip sprite.
                scale = 0.8, -- Blip scale.
                color = 1 -- Blip color.
            }
        }
    },
}

Config.Vehicles = {
    ['m13fortwo'] = { -- Vehicle code.
        label = 'Fortwo m13', -- Vehicle name.
        description = 'O masina pentru drumuri lungi si consum mic.', -- Description.
        image_name = 'fortow', -- Image name.
        price = 1000, -- Price.
        type = 'car' -- Type of vehicle. ( car, bike, bicycle )
    },
    ['dominator7'] = {
        label = 'Nissan GtR',
        description = 'O masina foarte buna pentru orice drum dar cu consum mare.',
        image_name = 'gtr',
        price = 10000,
        type = 'car'
    },
    ['BATI2'] = { 
        label = 'Bati Motorcycles',
        description = 'Un motor bun de oras.',
        image_name = 'bmw',
        price = 2000,
        type = 'bike'
    },
    ['TRIBIKE2'] = { 
        label = 'TRI BIKE',
        description = 'Buna pentru drumuri scurte si plimbari.',
        image_name = 'bike',
        price = 200,
        type = 'bicycle'
    },

    -- Example:
    -- ['CARCODEHERE'] = { -- Vehicle code.
    --     label = 'CARNAMEHRE', -- Vehicle name.
    --     description = 'CARDESCHERE', -- Description.
    --     image_name = 'CARIMAGEHERE', -- Image name.
    --     price = 1000, -- Price.
    --     type = 'CARTYPE' -- Type of vehicle. ( car, bike, bicycle )
    -- },
}
