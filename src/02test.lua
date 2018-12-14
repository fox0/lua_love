---@type Camera
local Camera = require('lib/camera')
---@type Player
local Player = require('src/player')

local m = {}

local vars = {}

local function beginContact(a, b, c)
    local aa = a:getUserData()
    local bb = b:getUserData()
    log.debug('Collided: ' .. aa .. ' and ' .. bb)
    --vars.player:boom() --todo!!! Различать объекты
    --vars.player:set_is_ground(true)
end

local function endContact(a, b, c)
    local aa = a:getUserData()
    local bb = b:getUserData()
    log.debug('Collision ended: ' .. aa .. ' and ' .. bb)
    --vars.player:set_is_ground(false)--todo!!! Различать объекты
end

local function preSolve(a, b, c)

end

local function postSolve(a, b, c)

end

---@param args table В args.img лежит текстура выбранного персонажа
function m.init(args)
    vars.camera = Camera()
    vars.camera:setFollowStyle('LOCKON')

    vars.sound = love.audio.newSource('resources/soundtracks/EuroBeat_Brony_Discord_Instrumental_edit1.ogg', 'stream')
    vars.sound:setVolume(0.7)
    vars.sound:play()
    vars.sound:setLooping(true)

    love.graphics.setBackgroundColor(0.62, 0.85, 0.9, 1.0)
    vars.bg = love.graphics.newImage('resources/backgrounds/02.png')

    local CONST = 32  -- One meter is 32px in physics engine
    love.physics.setMeter(CONST)
    vars.world = love.physics.newWorld(0, 9.81 * CONST, true)
    ---@type Player
    vars.player = Player:init(args.img, vars.world, -90*3, 912)

    ---@type Player[]
    vars.bots = {}
    for i, img in ipairs(args.imgs) do
        vars.bots[i] = Player:init(img, vars.world, 90 * (i-2), 912)
    end

    -- Create the ground body at (0, 0) static
    local ground = love.physics.newBody(vars.world, 0, 0, 'static')
    vars.ground_shape = love.physics.newRectangleShape(400, 1000, 1300, 10)
    local ground_fixture = love.physics.newFixture(ground, vars.ground_shape)
    ground_fixture:setUserData('ground')

    vars.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end

function m.exit()
    vars.sound:stop()
    vars.sound:release()
    vars.bg:release()
    vars = nil
end

---@param k string
function m.keypressed(k)
    if k == 'space' then
        vars.player:jump()
        return
    end
    --todo 'left' - kick 'right'
    log.debug(k)
end

---@param dt number
function m.update(dt)
    vars.world:update(dt)

    vars.player.is_up = love.keyboard.isDown('w')
    vars.player.is_down = love.keyboard.isDown('s')
    vars.player.is_left = love.keyboard.isDown('a')
    vars.player.is_right = love.keyboard.isDown('d')
    vars.player.is_rotate_left = love.keyboard.isDown('up')
    vars.player.is_rotate_right = love.keyboard.isDown('down')
    vars.player:update(dt)

    for _, b in ipairs(vars.bots) do
        b:update(dt)
    end

    vars.camera:update(dt)
    vars.camera:follow(vars.player.body:getWorldCenter())
end

function m.draw()
    vars.camera:attach()

    local k = normalize(vars.player.prev_y, const.WORLD_LIMITY, 400)
    love.graphics.setBackgroundColor(const.BG_COLOR[1] * k, const.BG_COLOR[2] * k, const.BG_COLOR[3] * k, const.BG_COLOR[4])

    love.graphics.draw(vars.bg, 0, 600)

    if is_debug_gui then
        debug_physics(vars.world)
        m._debug_draw()
    end

    -- Draws the ground.
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.0, 0.0, 0.0, 0.7)
    love.graphics.polygon('fill', vars.ground_shape:getPoints())
    love.graphics.setColor(r, g, b, a)

    vars.player:draw()
    for _, b in ipairs(vars.bots) do
        b:draw()
    end

    vars.camera:detach()
    vars.camera:draw()
end

function m._debug_draw()
    local r, g, b, a = love.graphics.getColor()
    --love.graphics.setColor(const.BG_COLOR)
    love.graphics.setColor(0.3, 0.6, 0.3, 1.0)
    local Z = -const.WORLD_LIMITY
    local z = -Z
    while z < Z do
        love.graphics.line(z, -Z, z, Z)
        love.graphics.line(-Z, z, Z, z)
        z = z + 100
    end
    love.graphics.setColor(r, g, b, a)
end

return m
