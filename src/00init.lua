--[[
Меню выбора персонажа сетка 5x2
]]--
---@type Player
local Player = require('src/player')

local m = {}

local vars = {}
vars.ponies = {}
vars.sel_index = 1

local map_frames = {
    { 0, 7, 7, 7, 7,
      1, 8, 7, 7, 7 },
    { 3, 0, 7, 7, 7,
      2, 1, 8, 7, 7 },
    { 3, 3, 0, 7, 7,
      3, 2, 1, 8, 7 },
    { 3, 3, 3, 0, 7,
      3, 3, 2, 1, 8 },
    { 3, 3, 3, 3, 0,
      3, 3, 3, 2, 1 },
    { 5, 6, 7, 7, 7,
      0, 7, 7, 7, 7 },
    { 4, 5, 6, 7, 7,
      3, 0, 7, 7, 7 },
    { 3, 4, 5, 6, 7,
      3, 3, 0, 7, 7 },
    { 3, 3, 4, 5, 6,
      3, 3, 3, 0, 7 },
    { 3, 3, 3, 4, 5,
      3, 3, 3, 3, 0 },
}

local function change()
    for i = 1, #vars.ponies do
        vars.ponies[i].sprite.is_animated = false  -- todo "докрутить" анимацию
        local v = map_frames[vars.sel_index][i]
        if v ~= 0 then
            vars.ponies[i].sprite:set_frame(v)
        end
    end
    vars.ponies[vars.sel_index].sprite.is_animated = true
end

---@param args table
function m.init(args)
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
    vars.ponies[1].sprite:set_frame(5)
    change()
end

--function m.exit()
    --todo фиг знает как вызвать сборщик мусора
    --vars.ponies[10].sprite.
    --vars:release()
--end

---@param k string
function m.keyreleased(k)
    if k == 'a' or k == 'left' then
        if vars.sel_index == 1 then
            vars.sel_index = 5
        elseif vars.sel_index == 6 then
            vars.sel_index = 10
        else
            vars.sel_index = vars.sel_index - 1
        end
        change()
        return
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
        return
    end

    if k == 'w' or k == 'up' or k == 's' or k == 'down' then
        if vars.sel_index <= 5 then
            vars.sel_index = vars.sel_index + 5
        else
            vars.sel_index = vars.sel_index - 5
        end
        change()
        return
    end

    if k == 'space' or k == 'return' then
        args = {}
        args.player = vars.ponies[vars.sel_index]
        load_module('02test', args)
        return
    end
    log.debug('keyreleased', k)
end

---@param dt number
function m.update(dt)
    for i = 1, #vars.ponies do
        vars.ponies[i]:update(dt)
    end
end

function m.draw()
    --todo надпись в шапке вверху другим шрифтом
    for i = 1, #vars.ponies do
        vars.ponies[i]:draw()
        --love.graphics.rectangle('line', self.x, self.y, 92, 92) --todo
    end
    --player:draw()
    --love.graphics.print(text, 50, 50)
end

return m
