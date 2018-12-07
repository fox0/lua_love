love.run = function()
    --if love.load then love.load(love.arg.parseGameArguments(arg), arg) end
    game_init()
    -- We don't want the first frame's dt to include time taken by love.load.
    love.timer.step()
    local dt = 0
    -- Main loop
    return function()
        -- Process events.
        -- todo
        if love.event then
            love.event.pump()
            for name, a, b, c, d, e, f in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return a or 0
                    end
                end
                love.handlers[name](a, b, c, d, e, f)
            end
        end
        dt = love.timer.step()
        game_update(dt)
        if love.graphics.isActive() then
            love.graphics.origin()
            love.graphics.clear(love.graphics.getBackgroundColor())
            game_draw()
            love.graphics.present()
        end
        love.timer.sleep(0.001)
    end
end

game_init = function()
    io.stdout:setvbuf 'line'  -- 'no'
    log = require('src/log')
    log.usecolor = false
    log.level = 'debug'
    log:debug(_VERSION)
    log:debug(string.format("Love2d %d.%d.%d", love._version_major, love._version_minor, love._version_revision))

    love.graphics.setFont(love.graphics.newFont(11))

    Player = require('src/player')
    player = Player:init(400, 300)
end

game_update = function(dt)
    player:update(dt)
end

game_draw = function()
    --love.graphics.setColor(0, 1, 0, .5)
    love.graphics.print('FPS: ' .. love.timer.getFPS(), 0, 0)
    player:draw()
end

--love.keypressed = function(k)
--end
