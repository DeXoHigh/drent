--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SCRIPT BY REDYY#0449
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

Config = {}

Config.Locations = {
    ['Primarie'] = {
        coords = vector3(256.98416137695,-376.92916870117,44.555820465088),
        spawn_coords = {x =256.98416137695, y =-376.92916870117, z=44.555820465088, h=158.07},
        marker = {
            type = 2, 
            size  = {x = 0.5, y = 0.5, z = 0.5},
            color = {r = 204, g = 204, b = 0}, 
            text = '~w~[ ~b~/rent ~w~]' -- text of marker.
        },
        blip = {
            name = 'Rent Vehicle', 
            sprite = 523, 
            scale = 0.8,
            color = 2
        }
    },
}


Config.Vehicles = {
    ['m13fortwo'] = { -- vehicle spawn model name.
        label = 'Fortwo m13', -- name of vehicle in menu.
        description = 'O masina pentru drumuri lungi si consum mic.', -- description of vehicle in menu.
        image_name = 'fortow', -- image name in html/assets folder.
        -- IMAGE RESOLUTION --
        -- 310x250 Pixels --
        -- IMAGE RESOLUTION --
        price = 1000, -- price of the vehicle.
        type = 'car' -- type of the vehicle.
    },
    ['dominator7'] = { -- model name.
        label = 'Nissan GtR', -- name of vehicle in menu.
        description = 'O masina foarte buna pentru orice drum dar cu consum mare.', -- description of vehicle in menu.
        image_name = 'gtr', -- image name in html/assets folder.
        price = 10000, -- price of the vehicle.
        type = 'car' -- type of the vehicle.
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
}