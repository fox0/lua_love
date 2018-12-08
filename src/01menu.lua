--[[
Меню выбора персонажа сетка 5x2
]]--
---@type Player
local Player = require('src/player')

local m = {}

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
    for i, pony in ipairs(ponies) do
        pony.sprite.is_animated = false  -- todo "докрутить" анимацию
        local v = map_frames[sel_index][i]
        if v ~= 0 then
            pony.sprite:set_frame(v)
        end
    end
    ponies[sel_index].sprite.is_animated = true
end

---@param args table
function m.init(args)
    ---@type Player[]
    ponies = {}
    sel_index = 1

    local PONIES = { 'rainbow_dash', 'fluttershy', 'pinkie_pie', 'applejack', 'rarity',
                     'derpy', 'pinkamina', 'trixie', 'trixie2', 'twilight_sparkle' }

    local width, height = love.graphics.getDimensions()
    local xstep = width / (#PONIES / 2)
    local xborder = (xstep - 92) / 2  --todo hardcore
    --local yborder
    log.debug(string.format('window size: %dx%d step: %d', width, height, xstep))

    for i = 1, #PONIES / 2 do
        ponies[i] = Player:init(PONIES[i], xborder + xstep * (i - 1), 100)  --todo hardcore 100
    end
    for i = #PONIES / 2 + 1, #PONIES do
        ponies[i] = Player:init(PONIES[i], xborder + xstep * (i - 6), 92 + 200)  --todo hardcore
    end
    assert_fox(#ponies == #PONIES)
    assert_fox(#ponies == 10)
    ponies[1].sprite:set_frame(5)
    change()
end

function m.exit()
    log.debug('release')
    -- удаляем больше ненужные изображения
    for i, pony in ipairs(ponies) do
        if i ~= sel_index then
            pony:release()
        end
    end
    ponies = nil
    sel_index = nil
end

---@param k string
function m.keyreleased(k)
    if k == 'a' or k == 'left' then
        if sel_index == 1 then
            sel_index = 5
        elseif sel_index == 6 then
            sel_index = 10
        else
            sel_index = sel_index - 1
        end
        change()
        return
    end

    if k == 'd' or k == 'right' then
        if sel_index == 5 then
            sel_index = 1
        elseif sel_index == 10 then
            sel_index = 6
        else
            sel_index = sel_index + 1
        end
        change()
        return
    end

    if k == 'w' or k == 'up' or k == 's' or k == 'down' then
        if sel_index <= 5 then
            sel_index = sel_index + 5
        else
            sel_index = sel_index - 5
        end
        change()
        return
    end

    if k == 'space' or k == 'return' then
        load_module('02test', { player = ponies[sel_index] })
        return
    end
    log.debug('keyreleased', k)
end

---@param dt number
function m.update(dt)
    for _, pony in ipairs(ponies) do
        pony:update(dt)
    end
end

function m.draw()
    --todo надпись в шапке вверху другим шрифтом
    for _, pony in ipairs(ponies) do
        pony:draw()
    end
    --love.graphics.print(text, 50, 50)
end

return m
