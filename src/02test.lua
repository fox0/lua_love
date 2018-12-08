local m = {}

text = "No collision yet."

---@param args table
function m.init(args)
    ---@type Player
    player = args.player

    love.physics.setMeter(32)

    -- Create a world with standard gravity
    world = love.physics.newWorld(0, 9.81 * 32, true)

    -- Create the ground body at (0, 0) static
    ground = love.physics.newBody(world, 0, 0, "static")

    -- Create the ground shape at (400,500) with size (600,10).
    ground_shape = love.physics.newRectangleShape(400, 500, 600, 10)

    -- Create fixture between body and shape
    ground_fixture = love.physics.newFixture(ground, ground_shape)
    ground_fixture:setUserData("Ground") -- Set a string userdata

    -- Load the image of the ball.
    ball = love.graphics.newImage("resourses/love-ball.png")

    -- Create a Body for the circle.
    body = love.physics.newBody(world, 400, 200, "dynamic")

    -- Attatch a shape to the body.
    circle_shape = love.physics.newCircleShape(0, 0, 32)

    -- Create fixture between body and shape
    fixture = love.physics.newFixture(body, circle_shape)

    fixture:setUserData("Ball") -- Set a string userdata

    -- Calculate the mass of the body based on attatched shapes.
    -- This gives realistic simulations.
    body:setMassData(circle_shape:computeMass(1))

    -- Set the collision callback.
    world:setCallbacks(beginContact, endContact)
end

---@param k string
function m.keypressed(k)
    if k == "space" then
        -- Apply a random impulse
        body:applyLinearImpulse(150 - math.random(0, 300), -math.random(0, 1500))
    end
end

---@param dt number
function m.update(dt)
    world:update(dt)

    local SPEED = 400
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        player.x = player.x - dt * SPEED
    end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        player.x = player.x + dt * SPEED
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        player.y = player.y - dt * SPEED
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        player.y = player.y + dt * SPEED
    end
    player:update(dt)
end

function m.draw()
    -- Draws the ground.
    love.graphics.polygon("line", ground_shape:getPoints())

    -- Draw the circle.
    love.graphics.draw(ball, body:getX(), body:getY(), body:getAngle(), 1, 1, 32, 32)

    -- Instructions
    love.graphics.print("space: Apply a random impulse", 5, 5)

    -- Draw text.
    love.graphics.print(text, 5, 25)

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
