io.stdout:setvbuf 'line'  -- 'no'

log = require('lib/log')
log.usecolor = false
log.level = 'debug'

log.debug(_VERSION, string.format('Love2d %d.%d.%d', love._version_major, love._version_minor, love._version_revision))

function load_module(module_name)
    log.debug('load module', module_name)
    game_exit()
    m = require('src/' .. module_name)
    game_update = m.update
    game_draw = m.draw
    game_exit = m.exit
    m.init()
    love.timer.step()
end

local game_init = function()
    local default_font = love.graphics.newFont('resourses/fonts/Robotomedium.ttf', 14)
    love.graphics.setFont(default_font)

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

    local debug_print_fps = function()
    end
    if log.level == 'debug' then
        debug_print_fps = function()
            local stats = love.graphics.getStats()
            local s = string.format('FPS: %d. Memory: %.2f MB', love.timer.getFPS(), stats.texturememory / 1024 / 1024)
            local r, g, b, a = love.graphics.getColor()
            love.graphics.setColor(.0, 1., .0, 1.)
            love.graphics.print(s, 0, 0)
            love.graphics.setColor(r, g, b, a)
        end
    end

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
            game_draw()
            debug_print_fps()
            love.graphics.present()
        end
        love.timer.sleep(0.001)
    end
end
