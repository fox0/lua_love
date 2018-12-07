love.conf = function(t)
    t.version = "11.2"
    t.accelerometerjoystick = false

    t.window.title = "lua_love 0.0.1"
    t.window.icon = nil
    t.window.width = 800
    t.window.height = 600
    t.window.resizable = true
    t.window.minwidth = 800
    t.window.minheight = 600

    -- todo begin
    t.modules.audio = true              -- Enable the audio module (boolean)
    t.modules.data = true               -- Enable the data module (boolean)
    t.modules.event = true              -- Enable the event module (boolean)
    t.modules.font = true               -- Enable the font module (boolean)
    t.modules.image = true              -- Enable the image module (boolean)

    t.modules.joystick = false

    t.modules.math = true               -- Enable the math module (boolean)
    t.modules.mouse = true              -- Enable the mouse module (boolean)
    t.modules.physics = true            -- Enable the physics module (boolean)
    t.modules.sound = true              -- Enable the sound module (boolean)
    t.modules.system = true             -- Enable the system module (boolean)
    t.modules.thread = true             -- Enable the thread module (boolean)
    -- todo end

    t.modules.touch = false
    t.modules.video = false
end
