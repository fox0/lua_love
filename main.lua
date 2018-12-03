DEBUG = true

if DEBUG then
    io.stdout:setvbuf 'line'  -- 'no'
end

function love.load()
    love.graphics.setCaption('lua_love 0.0.1')
    love.graphics.setFont(love.graphics.newFont(11))

    image = love.graphics.newImage('img/love-ball.png')
end

function love.update(dt)

end

function love.draw()
    love.graphics.setCaption('FPS: ' .. love.timer.getFPS())
    love.graphics.print('dt: ' .. love.timer.getDelta(), 50, 100)

    love.graphics.draw(image, 400, 300)
end

function love.keypressed(k)
    print(k)
end
