---@type Player
local Player = require('src/player')

local m = {}

---@field bg Image
---@field world World
---@field player Player
vars = {}

text = "No collision yet."

---@param args table В args.img лежит текстура выбранного персонажа
function m.init(args)
    vars.bg = love.graphics.newImage('resourses/backgrounds/02.png')

    local CONST = 32  -- One meter is 32px in physics engine
    love.physics.setMeter(CONST)
    vars.world = love.physics.newWorld(0, 9.81 * CONST, true)
    vars.player = Player:init(args.img, vars.world, 400, 200)

    -- Create the ground body at (0, 0) static
    ground = love.physics.newBody(vars.world, 0, 0, "static")
    ground_shape = love.physics.newRectangleShape(400, 500, 600, 10)
    ground_fixture = love.physics.newFixture(ground, ground_shape)
    ground_fixture:setUserData("Ground") -- Set a string userdata

    -- Set the collision callback.
    vars.world:setCallbacks(beginContact, endContact)
end

---@param dt number
function m.update(dt)
    vars.world:update(dt)
    vars.player:update(dt)
end

local function debug_draw()

end

if log.level == 'debug' then
    function debug_draw()
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor(.0, .0, 1., 1.)
        --for _, body in pairs(world:getBodyList()) do
        for _, body in pairs(vars.world:getBodies()) do
            for _, fixture in pairs(body:getFixtures()) do
                local shape = fixture:getShape()
                if shape:typeOf('PolygonShape') then
                    love.graphics.polygon('line', body:getWorldPoints(shape:getPoints()))
                    --elseif shape:typeOf('CircleShape') then
                    --    local cx, cy = body:getWorldPoints(shape:getPoint())
                    --    love.graphics.circle('line', cx, cy, shape:getRadius())
                else
                    love.graphics.line(body:getWorldPoints(shape:getPoints()))
                end
            end
        end
        love.graphics.setColor(r, g, b, a)
    end
end

function m.draw()
    love.graphics.draw(vars.bg, 0, 0)

    -- Draws the ground.
    local r, g, b, a = love.graphics.getColor()

    love.graphics.setColor(.0, .0, .0, .7)
    love.graphics.polygon('fill', ground_shape:getPoints())

    love.graphics.setColor(.0, 1., .0, 1.)
    love.graphics.print(text, 5, 35)

    love.graphics.setColor(r, g, b, a)

    vars.player:draw()
    debug_draw()
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
