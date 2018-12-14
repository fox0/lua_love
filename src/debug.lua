log = require('lib/log')
log.usecolor = false
--log.level = 'info'
log.level = 'debug'

io.stdout:setvbuf 'line'  -- 'no'
log.debug(_VERSION, string.format('Love2d %d.%d.%d', love._version_major, love._version_minor, love._version_revision))

is_debug_gui = log.level == 'debug'

function debug_print_fps()
    local r, g, b, a = love.graphics.getColor()
    --local stats = love.graphics.getStats()
    --local s = string.format('FPS: %d. Memory: %.2f MB', love.timer.getFPS(), stats.texturememory / 1024 / 1024)
    local s = string.format('FPS %d', love.timer.getFPS())
    love.graphics.setColor(0.0, 0.0, 0.0, 0.5)
    --love.graphics.rectangle('fill', 0, 0, 190, 14)
    love.graphics.rectangle('fill', 0, 0, 50, 16)
    love.graphics.setColor(0.0, 1.0, 0.0, 1.0)
    love.graphics.print(s, 0, 0)
    love.graphics.setColor(r, g, b, a)
end

---@param world World
function debug_physics(world)
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.0, 0.0, 1.0, 1.0)
    --for _, body in pairs(world:getBodyList()) do
    for _, body in pairs(world:getBodies()) do
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
