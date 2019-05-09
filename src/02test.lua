---@type Camera
local Camera = require('love2d_camera/Camera')
---@type Player
local Player = require('src/player')

local m = {}

local vars = {}

local function callback_begin_contact(a, b)
    ---@type Player
    local player1 = a:getUserData()
    local bb = b:getUserData()
    log.debug('Collided:', player1, 'and', bb)
    if type(player1) ~= 'table' then
        log.warn(player1)
        return
    end

    if type(bb) == 'string' then
        -- and bb == 'ground'
        player1:boom_to_ground()
        player1:set_is_ground(true)
    else
        -- if type(bb) == 'table' then
        ---@type Player
        local player2 = bb
        player1:boom_to_player(player2)
    end
end

local function callback_end_contact(a, b)
    ---@type Player
    local player1 = a:getUserData()
    local bb = b:getUserData()
    log.debug('Collision ended:', player1, 'and', bb)
    if type(player1) ~= 'table' then
        log.warn(player1)
        return
    end

    if type(bb) == 'string' then
        -- and bb == 'ground'
        player1:set_is_ground(false)
    end
end

--local function preSolve(a, b, c)
--
--end
--
--local function postSolve(a, b, c)
--
--end

---@param args table В args.img лежит текстура выбранного персонажа
function m.init(args)
    vars.camera = Camera()
    vars.camera:setFollowStyle('LOCKON')
    --if is_debug_gui then
    --    vars.camera.draw_deadzone = true
    --end

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
    vars.player = Player:init(args.img, vars.world, -90 * 3, 912)

    ---@type Player[]
    vars.bots = {}
    for i, img in ipairs(args.imgs) do
        vars.bots[i] = Player:init(img, vars.world, 90 * (i - 2), 912)
    end

    -- Create the ground body at (0, 0) static
    local ground = love.physics.newBody(vars.world, 0, 0, 'static')
    vars.ground_shape = love.physics.newRectangleShape(400, 1000, 1300, 10)
    local ground_fixture = love.physics.newFixture(ground, vars.ground_shape)
    ground_fixture:setUserData('ground')

    vars.world:setCallbacks(callback_begin_contact, callback_end_contact)--, preSolve, postSolve)
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

    ---@type Player
    vars.player.is_up = love.keyboard.isDown('w')
    vars.player.is_down = love.keyboard.isDown('s')
    vars.player.is_left = love.keyboard.isDown('a')
    vars.player.is_right = love.keyboard.isDown('d')
    vars.player.is_rotate_left = love.keyboard.isDown('up')
    vars.player.is_rotate_right = love.keyboard.isDown('down')
    vars.player:update(dt)

    for _, b in ipairs(vars.bots) do
        b:update_bots_ai(vars.player)
        b:update(dt)
    end

    vars.camera:update(dt)
    vars.camera:follow(vars.player.body:getWorldCenter())
end

function m.draw()
    vars.camera:attach()

    local s = math.abs(vars.player.speed - 1.0)
    if s > 1.0 then
        vars.camera.scale = 2.0 - s / 60
    else
        vars.camera.scale = 2.0
    end

    local k = math.normalize(vars.player.prev_y, const.WORLD_LIMITY, 400)
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

    m._graw_ui()
end

function m._graw_ui()
    local r, g, b, a = love.graphics.getColor()

    local i0 = 15
    local x0 = 5 + i0 * 5
    local i;

    love.graphics.setColor(1.0, 1.0, 1.0, 0.5)
    i = i0 / 2
    while i < x0 do
        love.graphics.circle('line', x0, x0, i)
        i = i + i0
    end

    love.graphics.setColor(0.0, 0.0, 0.0, 0.5)
    i = i0 / 2
    while i < x0 do
        love.graphics.circle('line', x0, x0, i + 1)
        i = i + i0
    end

    local x1 = x0 - i0 * 5 + 5
    local y1 = x0
    local x2 = i0 * 10
    local y2 = i0 * 5 + 5
    love.graphics.line(x1, y1, x2, y2)
    --todo
    --love.graphics.line(math.rotate_point(x0, x0, 0.2, { x1, y1, x2, y2 }))

    love.graphics.setColor(r, g, b, a)
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
        z = z + 200
    end
    love.graphics.setColor(r, g, b, a)
end

return m
