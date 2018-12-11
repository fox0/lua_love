--[[
Меню выбора персонажа сетка 5x2
]]--
---@type Sprite
local Sprite = require('src/sprite')

local m = {}

---@field ponies_img Image[]
---@field ponies Sprite[]
---@field sel_index number
local vars = {}

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
    vars.ponies_img = {}
    for _, pony in ipairs({ 'rainbow_dash', 'fluttershy', 'pinkie_pie', 'applejack', 'rarity',
                            'derpy', 'pinkamina', 'trixie', 'trixie2', 'twilight_sparkle' }) do
        log.debug(string.format('loading %s...', pony))
        local img = love.graphics.newImage(string.format('resourses/textures/%s.png', pony))  -- 12.6 MB
        vars.ponies_img[#vars.ponies_img + 1] = img
    end
    assert(#vars.ponies_img == 10)

    ---@type Sprite[]
    vars.ponies = {}
    for _, img in ipairs(vars.ponies_img) do
        ---@type SpriteList
        local sprites = Sprite.parse_texture(img)
        vars.ponies[#vars.ponies + 1] = sprites.sprite2
    end

    vars.xstep = window_width / 5
    vars.ystep = window_height / 2
    local W, H = vars.ponies[1].current_frame.W, vars.ponies[1].current_frame.H
    local xborder = (vars.xstep - W) / 2
    local yborder = (vars.ystep - H) / 2
    for i = 1, 5 do
        vars.ponies[i].x = xborder + vars.xstep * (i - 1)
        vars.ponies[i].y = yborder --+ vars.ystep * 0
    end
    for i = 6, 10 do
        vars.ponies[i].x = xborder + vars.xstep * (i - 6)
        vars.ponies[i].y = yborder + vars.ystep * 1
    end
    vars.ponies[1]:set_frame(5)
    vars.sel_index = 1
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
    vars = nil
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
    --todo может заанимировать прозрачность фона? (зациклить)
end

function m.draw()
    local r, g, b, a = love.graphics.getColor()
    local X, Y = vars.xstep, vars.ystep

    love.graphics.setColor(0.35, 0.65, 0.79, 0.7)
    love.graphics.rectangle('fill', X * 0, 0, X, Y)
    love.graphics.setColor(0.84, 0.64, 0.71, 0.7)
    love.graphics.rectangle('fill', X * 1, 0, X, Y)
    love.graphics.setColor(0.67, 0.15, 0.33, 0.7)
    love.graphics.rectangle('fill', X * 2, 0, X, Y)
    love.graphics.setColor(0.78, 0.75, 0.36, 0.7)
    love.graphics.rectangle('fill', X * 3, 0, X, Y)
    love.graphics.setColor(0.38, 0.32, 0.63, 0.7) --todo чуть другой
    love.graphics.rectangle('fill', X * 4, 0, X, Y)

    love.graphics.setColor(0.0, 0.5, 0.2, 0.7)
    love.graphics.rectangle('fill', X * 0, Y, X, Y)
    love.graphics.setColor(0.0, 0.6, 0.2, 0.7)
    love.graphics.rectangle('fill', X * 1, Y, X, Y)
    love.graphics.setColor(0.0, 0.7, 0.2, 0.7)
    love.graphics.rectangle('fill', X * 2, Y, X, Y)
    love.graphics.setColor(0.0, 0.8, 0.2, 0.7)
    love.graphics.rectangle('fill', X * 3, Y, X, Y)
    love.graphics.setColor(0.04, 0.10, 0.33, 0.7)
    love.graphics.rectangle('fill', X * 4, Y, X, Y)

    --todo
    love.graphics.setColor(0.9, 0.9, 0.9, 1.0)
    love.graphics.print('Select charapter', 480, 270)

    love.graphics.setColor(r, g, b, a)
    for _, pony in ipairs(vars.ponies) do
        pony:draw()
    end
end

return m
