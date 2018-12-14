---@param module_name string
---@param args table
function load_module(module_name, args)
    assert(module_name)
    log.debug('load module', module_name)
    if game_exit then
        game_exit()
    end

    local m = require('src/' .. module_name)
    ---@type fun(dt:number)
    game_update = m.update
    game_draw = m.draw

    game_exit = nil
    if m.exit then
        game_exit = m.exit
    end

    game_keypressed = nil
    if m.keypressed then
        game_keypressed = m.keypressed
    end

    love.keyreleased = nil
    if m.keyreleased then
        love.keyreleased = m.keyreleased
    end

    m.init(args)
    love.timer.step()
end

---@param k string
function love.keypressed(k)
    if k == 'h' then
        is_debug_gui = not is_debug_gui
        return
    end
    if game_keypressed then
        game_keypressed(k)
    end
end

function love.run()
    require('src/debug')
    require('src/common')
    const = require('src/const')
    love.graphics.setFont(love.graphics.newFont('resources/fonts/Robotomedium.ttf', 14))
    love.graphics.setLineStyle('rough')
    love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

    --messages_bus = {}
    load_module('01menu')

    local dt = 0
    -- Main loop
    return function()
        love.event.pump()
        for name, a, b, c, d, e, f in love.event.poll() do
            if name == 'quit' then
                if game_exit then
                    game_exit()
                end
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
            if is_debug_gui then
                debug_print_fps()
            end
            love.graphics.present()
        end
        love.timer.sleep(0.001)
    end
end
