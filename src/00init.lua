--[[
Меню выбора персонажа сетка 5x2
]]--
local Player = require('src/player')

local m = {}

local vars = {}
vars.ponies = {}
vars.sel_index = 1

local change = function()
    for i = 1, #vars.ponies do
        vars.ponies[i].sprite.is_animated = false
        vars.ponies[i].sprite:set_frame(3)
    end
    vars.ponies[vars.sel_index].sprite.is_animated = true
end

m.init = function()
    local PONIES = { 'rainbow_dash', 'fluttershy', 'pinkie_pie', 'applejack', 'rarity',
                     'derpy', 'pinkamina', 'trixie', 'trixie2', 'twilight_sparkle' }

    local width, height = love.graphics.getDimensions()
    local xstep = width / (#PONIES / 2)
    local xborder = (xstep - 92) / 2  --todo hardcore
    --local yborder
    log.debug(string.format('window size: %dx%d step: %d', width, height, xstep))

    for i = 1, #PONIES / 2 do
        vars.ponies[i] = Player:init(PONIES[i], xborder + xstep * (i - 1), 100)  --todo hardcore 100
    end
    for i = #PONIES / 2 + 1, #PONIES do
        vars.ponies[i] = Player:init(PONIES[i], xborder + xstep * (i - 6), 92 + 200)  --todo hardcore
    end
    change()
end

m.exit = function()
    --player = nil
    --** после выбора попробовать почистить память Object:release( )
end

m.keyreleased = function(k)
    if k == 'a' or k == 'left' then
        if vars.sel_index == 1 then
            vars.sel_index = 5
        elseif vars.sel_index == 6 then
            vars.sel_index = 10
        else
            vars.sel_index = vars.sel_index - 1
        end
        change()
    end

    if k == 'd' or k == 'right' then
        if vars.sel_index == 5 then
            vars.sel_index = 1
        elseif vars.sel_index == 10 then
            vars.sel_index = 6
        else
            vars.sel_index = vars.sel_index + 1
        end
        change()
    end

    if k == 'w' or k == 'up' or k == 's' or k == 'down' then
        if vars.sel_index <= 5 then
            vars.sel_index = vars.sel_index + 5
        else
            vars.sel_index = vars.sel_index - 5
        end
        change()
    end

    --todo enter or space
end

m.update = function(dt)
    for i = 1, #vars.ponies do
        vars.ponies[i]:update(dt)
    end
end

m.draw = function()
    --todo надпись в шапке вверху другим шрифтом
    for i = 1, #vars.ponies do
        vars.ponies[i]:draw()
        --love.graphics.rectangle('line', self.x, self.y, 92, 92) --todo
    end
    --player:draw()
    --love.graphics.print(text, 50, 50)
end

return m
