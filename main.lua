io.stdout:setvbuf 'line'  -- 'no'

log = require('src/log')
log.usecolor = false
log.level = 'debug'

function love.load()
    log:debug(string.format("love2d %d.%d.%d", love._version_major, love._version_minor, love._version_revision))
    love.graphics.setFont(love.graphics.newFont(11))
    local Player = require('src/player')
    player = Player:init(400, 300)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    --love.graphics.setCaption('FPS: ' .. love.timer.getFPS())
    love.graphics.print('dt: ' .. love.timer.getDelta(), 50, 100)
    player:draw()
end

--function love.keypressed(k)
--end
