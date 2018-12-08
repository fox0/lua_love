---@type Frame
local Frame = require('src/frame')

---@class Sprite Спрайт
---@field public speed number множитель скорости анимации
---@field public is_animated boolean
---@field public timer number
---@field public current_frame Frame
---@field public x number
---@field public y number
---@field _frames Frame[]
---@field _index number
---@field _delay number
local Sprite = {}
Sprite.__index = Sprite

---@param self Sprite
---@param frames Frame[]
---@param delay number длительность кадра
---@param speed number множитель скорости анимации
---@return Sprite
function Sprite.init(self, frames, delay, speed)
    assert_fox(frames)
    local obj = {}
    obj._frames = frames
    obj._index = 1  -- нумерация с единицы
    obj._delay = delay or .15
    obj.speed = speed or 1.
    obj.is_animated = true
    obj.timer = 0
    ---@type Frame
    obj.current_frame = obj._frames[obj._index]
    obj.x = 0
    obj.y = 0
    obj.r = 0
    return setmetatable(obj, Sprite)
end

---@param self Sprite
---@param index number
function Sprite.set_frame(self, index)
    assert_fox(index)
    self._index = index
    self.current_frame = self._frames[self._index]
end

---@param self Sprite
---@param dt number
function Sprite.update(self, dt)
    if not self.is_animated then
        return
    end
    self.timer = self.timer + dt * self.speed
    if self.timer > self._delay then
        self.timer = self.timer - self._delay
        self._index = self._index + 1
        if self._index > #self._frames then
            self._index = 1
        end
        self.current_frame = self._frames[self._index]
    end
end

---@param self Sprite
function Sprite.draw(self)
    self.current_frame:draw(self.x, self.y, self.r)
end

--- Статическая функция
---@param image Image
---@return table словарь со спрайтами
function Sprite.parse_texture(image)
    local S = 96
    local B = 2
    local H, W = image:getDimensions()

    local x = 0
    local y = 0
    ---@param count number
    local function get_frames(count)
        local r = {}
        local e = x + count
        while x < e do
            local q = love.graphics.newQuad(B + x * S, B + y * S, S - 2 * B, S - 2 * B, H, W)
            r[#r + 1] = Frame:init(image, q)
            x = x + 1
        end
        return r
    end

    local result = {}
    result._sprite1_1 = Sprite:init(get_frames(5))
    local frames = get_frames(5)
    for i = 0, 2 do
        frames[#frames + 1] = Frame:init(image, frames[4 - i]._quad, true)
    end
    result._sprite1_2 = Sprite:init(frames)
    result._sprite1_3 = Sprite:init(get_frames(3)) --sleep

    x = 0
    y = 1
    result._sprite2_1 = Sprite:init(get_frames(6))
    result._sprite2_2 = Sprite:init(get_frames(6))
    result._sprite2_3 = Sprite:init(get_frames(6)) --walk
    result._sprite2_4 = Sprite:init(get_frames(6))
    result._sprite2_5 = Sprite:init(get_frames(6))

    x = 0
    y = 2
    result._sprite3_1 = Sprite:init(get_frames(6))
    result._sprite3_2 = Sprite:init(get_frames(6))
    result._sprite3_3 = Sprite:init(get_frames(6))  --подпрыгивает
    result._sprite3_4 = Sprite:init(get_frames(6))
    result._sprite3_5 = Sprite:init(get_frames(6))

    x = 0
    y = 3
    result._sprite4_1 = Sprite:init(get_frames(6))
    result._sprite4_2 = Sprite:init(get_frames(6))
    result._sprite4_3 = Sprite:init(get_frames(6))  --run
    result._sprite4_4 = Sprite:init(get_frames(6))
    result._sprite4_5 = Sprite:init(get_frames(6))

    x = 0
    y = 4
    result._sprite5_1 = Sprite:init(get_frames(6))
    result._sprite5_2 = Sprite:init(get_frames(6))
    result._sprite5_3 = Sprite:init(get_frames(6))  --fly wait up
    result._sprite5_4 = Sprite:init(get_frames(6))
    result._sprite5_5 = Sprite:init(get_frames(6))

    x = 0
    y = 5
    result._sprite6_1 = Sprite:init(get_frames(6))
    result._sprite6_2 = Sprite:init(get_frames(6))
    result._sprite6_3 = Sprite:init(get_frames(6))  --fly wait
    result._sprite6_4 = Sprite:init(get_frames(6))
    result._sprite6_5 = Sprite:init(get_frames(6))

    x = 0
    y = 6
    result._sprite7_1 = Sprite:init(get_frames(6))
    result._sprite7_2 = Sprite:init(get_frames(6))
    result._sprite7_3 = Sprite:init(get_frames(6))  --fly run
    result._sprite7_4 = Sprite:init(get_frames(6))
    result._sprite7_5 = Sprite:init(get_frames(6))

    x = 0
    y = 7
    result._sprite8_1 = Sprite:init(get_frames(2))
    result._sprite8_2 = Sprite:init(get_frames(2))
    result._sprite8_3 = Sprite:init(get_frames(2))  --jump up
    result._sprite8_4 = Sprite:init(get_frames(2))
    result._sprite8_5 = Sprite:init(get_frames(2))

    x = 0
    y = 8
    result._sprite9_1 = Sprite:init(get_frames(2))
    result._sprite9_2 = Sprite:init(get_frames(2))
    result._sprite9_3 = Sprite:init(get_frames(2))  --jump down
    result._sprite9_4 = Sprite:init(get_frames(2))
    result._sprite9_5 = Sprite:init(get_frames(2))

    x = 0
    y = 9
    result._sprite10_1 = Sprite:init(get_frames(9))  --kink down
    result._sprite10_2 = Sprite:init(get_frames(5))  --kick up

    x = 0
    y = 10
    result._sprite11_1 = Sprite:init(get_frames(2))  --?
    result._sprite11_2 = Sprite:init(get_frames(3))
    result._sprite11_3 = Sprite:init(get_frames(1))
    result._sprite11_4 = Sprite:init(get_frames(8)) --покачивается злая (idle?)

    x = 0
    y = 11
    result._sprite12_1 = Sprite:init(get_frames(4)) --нокаиутирована

    x = 0
    y = 12
    --todo у Пинки есть ещё ряд

    return result
end

return Sprite
