--[[
Меню выбора персонажа сетка 5x2
]]--
---@type Sprite
local Sprite = require('src/sprite')

local m = {}

vars = {}
vars.ponies_img = {}
---@type Sprite[]
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
    for i, pony in ipairs(vars.ponies) do
        pony.is_animated = false  -- todo "докрутить" анимацию
        local v = map_frames[vars.sel_index][i]
        if v ~= 0 then
            pony:set_frame(v)
        end
    end
    vars.ponies[vars.sel_index].is_animated = true
end

-- Выполняется много времени > 2 секунд
function m.init()
    for _, pony in ipairs({ 'rainbow_dash', 'fluttershy', 'pinkie_pie', 'applejack', 'rarity',
                            'derpy', 'pinkamina', 'trixie', 'trixie2', 'twilight_sparkle' }) do
        local img = love.graphics.newImage(string.format('resourses/textures/%s.png', pony))  -- 12.6 MB
        vars.ponies_img[#vars.ponies_img + 1] = img
    end
    assert_fox(#vars.ponies_img == 10)
    for _, img in ipairs(vars.ponies_img) do
        vars.ponies[#vars.ponies + 1] = Sprite.parse_texture(img)._sprite1_2
    end

    local width, height = love.graphics.getDimensions()
    local xstep = width / 5
    local xborder = (xstep - 92) / 2  --todo hardcore
    --local yborder
    log.debug(string.format('window size: %dx%d step: %d', width, height, xstep))
    for i = 1, 5 do
        vars.ponies[i].x = xborder + xstep * (i - 1)
        vars.ponies[i].y = 100 --todo
    end
    for i = 6, 10 do
        vars.ponies[i].x = xborder + xstep * (i - 6)
        vars.ponies[i].y = 92 + 200
    end
    vars.ponies[1]:set_frame(5)
    change()
end

function m.exit()
    log.debug('release')
    -- удаляем больше ненужные изображения
    for i, img in ipairs(vars.ponies_img) do
        if i ~= vars.sel_index then
            img:release()
        end
    end
    vars = nul
end

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
        load_module('02test', { img = vars.ponies_img[vars.sel_index] })
        return
    end
    log.debug('keyreleased', k)
end

---@param dt number
function m.update(dt)
    for _, pony in ipairs(vars.ponies) do
        pony:update(dt)
    end
end

function m.draw()
    --todo надпись в шапке вверху другим шрифтом
    for _, pony in ipairs(vars.ponies) do
        pony:draw()
    end
    --love.graphics.print(text, 50, 50)
end

return m
