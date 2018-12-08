local Player = require('src/player')

local m = {}

m.init = function()
    player = Player:init('rainbow_dash', 400, 300)
    --player = Player:init('pinkie_pie', 400, 300)
    --player = Player:init('fluttershy', 400, 300)
    --player = Player:init('applejack', 400, 300)
    --player = Player:init('derpy', 400, 300)
    --player = Player:init('pinkamina', 400, 300)
    --player = Player:init('rarity', 400, 300)
    --player = Player:init('trixie', 400, 300)
    --player = Player:init('trixie2', 400, 300)
    --player = Player:init('twilight_sparkle', 400, 300)
end

m.exit = function()
    player = nil
end

m.update = function(dt)
    player:update(dt)
end
--
--text = [[
--   Lorem ipsum dolor sit amet, consectetur adipiscing elit,
--sed do eiusmod tempor incididunt ut labore et dolore magna
--aliqua. Ut enim ad minim veniam, quis nostrud exercitation
--ullamco laboris nisi  ut aliquip ex ea commodo  consequat.
--Duis aute irure dolor in  reprehenderit  in voluptate velit
--esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
--occaecat cupidatat non proident, sunt  in culpa qui officia
--deserunt mollit anim id est laborum.
--   Lorem ipsum dolor sit amet, consectetur adipiscing elit,
--sed do eiusmod tempor incididunt ut labore et dolore magna
--aliqua. Ut enim ad minim veniam, quis nostrud exercitation
--ullamco laboris nisприыроаиоаыивао иыо иыо иculpa qui officia
--deserunt mollit anim id est laborum.
--]]

m.draw = function()
    player:draw()
    --love.graphics.print(text, 50, 50)
end

return m
