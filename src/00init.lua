local Player = require('src/player')

local m = {}

m.init = function()
    player = Player:init('rainbow_dash', 400, 300)
    --player = Player:init('pinkie_pie', 400, 300)
    --player = Player:init('fluttershy', 400, 300)
end

m.exit = function()
    player = nil
end

m.update = function(dt)
    player:update(dt)
end

m.draw = function()
    player:draw()
end

return m
