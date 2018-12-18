---@type Frame
local Frame = require('src/frame')

local Sprite = {}
Sprite.__index = Sprite

---@param frames Frame[]
---@return Sprite
function Sprite:init(frames)
    --, k_speed)
    assert(frames)
    assert(type(frames) == 'table')
    assert(#frames > 0)
    ---@class Sprite Спрайт
    local obj = {}
    obj._frames = frames
    obj.index = 1  -- нумерация с единицы
    obj._delay = 0.15-- / (k_speed or 1.0)
    obj.timer = 0
    ---@type Frame
    obj.current_frame = obj._frames[obj.index]
    assert(obj.current_frame)
    obj.W = obj.current_frame.W
    obj.H = obj.current_frame.H

    --public field
    obj.is_animated = true
    obj.x = 0
    obj.y = 0
    obj.r = 0
    obj.is_mirror = false

    return setmetatable(obj, Sprite)
end

---@param index number
function Sprite:set_frame(index)
    self.index = index
    self.current_frame = self._frames[self.index]
    assert(self.current_frame)
end

---@param dt number
function Sprite:update(dt)
    if not self.is_animated then
        return
    end
    self.timer = self.timer + dt
    if self.timer > self._delay then
        self.timer = self.timer - self._delay
        self.index = self.index + 1
        if self.index > #self._frames then
            self.index = 1
        end
        self.current_frame = self._frames[self.index]
    end
end

function Sprite:draw()
    self.current_frame:draw(self.x, self.y, self.r, self.is_mirror)
end

---@param image Image
---@param sx number
---@param sy number
---@param bx number
---@param by number
---@return fun(y:number, x:number, x2:number):Sprite
local function get_slicer(image, sx, sy, bx, by)
    assert(image)
    assert(sx)
    assert(sy)
    assert(bx)
    assert(by)
    local h, w = image:getDimensions()
    return function(y, x, x2)
        local frames = {}
        for i = x, x2 do
            local q = love.graphics.newQuad(sx * i + bx, sy * y + by, sx - 2 * bx, sy - 2 * by, h, w)
            table.insert(frames, Frame:init(image, q))
        end
        return Sprite:init(frames)
    end
end

--- Статическая функция
---@param image Image
---@return table словарь со спрайтами
function Sprite.parse_texture(image)
    local parser = get_slicer(image, 96, 96, 2, 2)

    ---@class SpriteList
    local result = {}
    result.wait = parser(0, 2, 2)
    result.sprite2 = parser(0, 0, 8) --todo split
    result.sleep = parser(0, 10, 12)

    result.walk = parser(1, 12, 16)
    --result._ = parser(2, 12, 16)  --подпрыгивает
    result.run = parser(3, 12, 16)
    result.fly_wait = parser(4, 12, 16)
    result.fly = parser(5, 12, 16)
    result.fly_run = parser(6, 12, 16)

    --
    --x = 0
    --y = 7
    --result._sprite8_1 = Sprite:init(get_frames(2))
    --result._sprite8_2 = Sprite:init(get_frames(2))
    --result._sprite8_3 = Sprite:init(get_frames(2))  --jump up
    --result._sprite8_4 = Sprite:init(get_frames(2))
    --result._sprite8_5 = Sprite:init(get_frames(2))
    --
    --x = 0
    --y = 8
    --result._sprite9_1 = Sprite:init(get_frames(2))
    --result._sprite9_2 = Sprite:init(get_frames(2))
    --result._sprite9_3 = Sprite:init(get_frames(2))  --jump down
    --result._sprite9_4 = Sprite:init(get_frames(2))
    --result._sprite9_5 = Sprite:init(get_frames(2))
    --
    --x = 0
    --y = 9
    --result._sprite10_1 = Sprite:init(get_frames(9))  --kink down
    --result._sprite10_2 = Sprite:init(get_frames(5))  --kick up
    --
    --x = 0
    --y = 10
    --result._sprite11_1 = Sprite:init(get_frames(2))  --?
    --result._sprite11_2 = Sprite:init(get_frames(3))
    --result._sprite11_3 = Sprite:init(get_frames(1))
    --result._sprite11_4 = Sprite:init(get_frames(8)) --покачивается злая (idle?)
    --
    --x = 0
    --y = 11
    --result._sprite12_1 = Sprite:init(get_frames(4))
    ----нокаиутирована
    --
    --x = 0
    --y = 12
    ----todo у Пинки есть ещё ряд

    return result
end

return Sprite
