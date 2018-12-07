function load_module(module_name)
    log.debug('load module ' .. module_name)
    game_exit()
    m = require('src/' .. module_name)
    game_update = m.update
    game_draw = m.draw
    game_exit = m.exit
    m.init()
    love.timer.step()
end

local game_init = function()
    io.stdout:setvbuf 'line'  -- 'no'

    log = require('src/log')
    log.usecolor = false
    log.level = 'debug'

    log.debug(string.format('%s Love2d %d.%d.%d', _VERSION,
            love._version_major, love._version_minor, love._version_revision))

    love.graphics.setFont(love.graphics.newFont(11))

    local stub = function()
        log.warn('stub()')
    end
    game_update = stub
    game_draw = stub
    game_exit = stub

    load_module('00init')
end

love.run = function()
    --if love.load then love.load(love.arg.parseGameArguments(arg), arg) end
    game_init()
    -- We don't want the first frame's dt to include time taken by love.load.
    --love.timer.step()
    local dt = 0
    -- Main loop
    return function()
        love.event.pump()
        for name, a, b, c, d, e, f in love.event.poll() do
            if name == 'quit' then
                game_exit()
                return 0
            end
            love.handlers[name](a, b, c, d, e, f)
        end
        dt = love.timer.step()
        game_update(dt)
        if love.graphics.isActive() then
            love.graphics.origin()
            love.graphics.clear(love.graphics.getBackgroundColor())
            love.graphics.print('FPS: ' .. love.timer.getFPS(), 0, 0)
            game_draw()
            love.graphics.present()
        end
        love.timer.sleep(0.001)
    end
end
