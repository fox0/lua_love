local m = {}

m.init = function()
    Player = require('src/player')
    player = Player:init(400, 300)
end

m.exit = function()
    Player = nil
    player = nil
end

m.update = function(dt)
    player:update(dt)
end

m.draw = function()
    player:draw()
end

return m
