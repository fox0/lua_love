---@type Player
local Player = require('src/player')

local m = {}

---@field bg Image
---@field world World
---@field player Player
local vars = {}

---@param args table В args.img лежит текстура выбранного персонажа
function m.init(args)
    vars.sound = love.audio.newSource('resourses/soundtracks/EuroBeat_Brony_Discord_Instrumental_edit1.ogg', 'stream')
    vars.sound:play()
    vars.sound:setVolume(0.7)
    vars.bg = love.graphics.newImage('resourses/backgrounds/02.png')

    local CONST = 32  -- One meter is 32px in physics engine
    love.physics.setMeter(CONST)
    vars.world = love.physics.newWorld(0, 9.81 * CONST, true)
    ---@type Player
    vars.player = Player:init(args.img, vars.world, 400, 200)
    vars.diffx = (window_width - vars.player.sprite.current_frame.W) / 2
    vars.diffy = (window_height - vars.player.sprite.current_frame.H) / 2
    vars.x0, vars.y0 = 0, 0

    -- Create the ground body at (0, 0) static
    ground = love.physics.newBody(vars.world, 0, 0, "static")
    ground_shape = love.physics.newRectangleShape(400, 300, 600, 10)
    ground_fixture = love.physics.newFixture(ground, ground_shape)
    ground_fixture:setUserData("Ground") -- Set a string userdata

    -- Set the collision callback.
    vars.world:setCallbacks(beginContact, endContact)
end

-- This is called every time a collision begin.
function beginContact(a, b, c)
    local aa = a:getUserData()
    local bb = b:getUserData()
    --text = "Collided: " .. aa .. " and " .. bb
    vars.player:set_is_ground(true)
end

-- This is called every time a collision end.
function endContact(a, b, c)
    local aa = a:getUserData()
    local bb = b:getUserData()
    --text = "Collision ended: " .. aa .. " and " .. bb
    vars.player:set_is_ground(false)
end

function m.exit()
    vars.sound:stop()
    vars = nil
end

---@param dt number
function m.update(dt)
    vars.world:update(dt)
    vars.player:update(dt)
    vars.x0 = -vars.player.prev_x + vars.diffx
    vars.y0 = -vars.player.prev_y + vars.diffy
end

function m.draw()
    love.graphics.draw(vars.bg, vars.x0 / 10, vars.y0 / 50)
    --love.graphics.push()
    --love.graphics.scale(0.5, 0.5)
    love.graphics.translate(vars.x0, vars.y0)
    -- Draws the ground.
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.0, 0.0, 0.0, 0.7)
    love.graphics.polygon('fill', ground_shape:getPoints())
    love.graphics.setColor(r, g, b, a)

    vars.player:draw()
    --love.graphics.pop()
    debug_physics(vars.world)
    love.graphics.origin()
end

return m
