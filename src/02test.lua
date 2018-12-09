---@type Player
local Player = require('src/player')

local m = {}

text = "No collision yet."

---@param args table В args.img лежит текстура выбранного персонажа
function m.init(args)
    bg = love.graphics.newImage('resourses/backgrounds/02.png')

    local CONST = 32  -- One meter is 32px in physics engine
    love.physics.setMeter(CONST)
    world = love.physics.newWorld(0, 9.81 * CONST, true)
    player = Player:init(args.img, world, 400, 200)

    -- Create the ground body at (0, 0) static
    ground = love.physics.newBody(world, 0, 0, "static")
    ground_shape = love.physics.newRectangleShape(400, 500, 600, 10)
    ground_fixture = love.physics.newFixture(ground, ground_shape)
    ground_fixture:setUserData("Ground") -- Set a string userdata

    -- Set the collision callback.
    world:setCallbacks(beginContact, endContact)
end

---@param dt number
function m.update(dt)
    world:update(dt)
    player:update(dt)
end

function m.draw()
    love.graphics.draw(bg, 0, 0)

    -- Draws the ground.
    local r, g, b, a = love.graphics.getColor()

    love.graphics.setColor(.0, .0, .0, .7)
    love.graphics.polygon('fill', ground_shape:getPoints())

    love.graphics.setColor(.0, 1., .0, 1.)
    love.graphics.print(text, 5, 35)

    love.graphics.setColor(r, g, b, a)

    player:draw()
end

-- This is called every time a collision begin.
function beginContact(a, b, c)
    local aa = a:getUserData()
    local bb = b:getUserData()
    text = "Collided: " .. aa .. " and " .. bb
end

-- This is called every time a collision end.
function endContact(a, b, c)
    local aa = a:getUserData()
    local bb = b:getUserData()
    text = "Collision ended: " .. aa .. " and " .. bb
end

return m
