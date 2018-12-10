---@type Frame
local Frame = require('src/frame')

local Sprite = {}
Sprite.__index = Sprite

---@param self Sprite
---@param frames Frame[]
---@param delay number длительность кадра
---@param speed number множитель скорости анимации
---@return Sprite
function Sprite.init(self, frames, delay, speed)
    assert(frames)
    ---@class Sprite Спрайт
    local obj = {}
    obj._frames = frames
    obj.index = 1  -- нумерация с единицы
    obj._delay = delay or .15
    --obj.speed = speed or 1.
    obj.is_animated = true
    obj.timer = 0
    ---@type Frame
    obj.current_frame = obj._frames[obj.index]
    obj.x = 0
    obj.y = 0
    obj.r = 0
    return setmetatable(obj, Sprite)
end

---@param self Sprite
---@param index number
function Sprite.set_frame(self, index)
    assert(index)
    self.index = index
    self.current_frame = self._frames[self.index]
    assert(self.current_frame)
end

---@param self Sprite
---@param dt number
function Sprite.update(self, dt)
    if not self.is_animated then
        return
    end
    self.timer = self.timer + dt --* self.speed
    if self.timer > self._delay then
        self.timer = self.timer - self._delay
        self.index = self.index + 1
        if self.index > #self._frames then
            self.index = 1
        end
        self.current_frame = self._frames[self.index]
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
    ---@return Frame[]
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

    ---@class SpriteList
    local result = {}
    result.sprite1 = Sprite:init(get_frames(5))

    local frames = get_frames(5)
    for i = 0, 2 do
        frames[#frames + 1] = Frame:init(image, frames[4 - i]._quad, true)
    end
    assert(#frames == 8)
    result.sprite2 = Sprite:init(frames)

    result.sleep = Sprite:init(get_frames(3))

    x = 0
    y = 1
    result.walk1 = Sprite:init(get_frames(6))
    result.walk2 = Sprite:init(get_frames(6))

    frames = get_frames(6)
    result.walk_right = Sprite:init(frames)
    local frames2 = {}
    for i, v in ipairs(frames) do
        frames2[#frames2 + 1] = Frame:init(image, v._quad, true) --todo переписать зеркалирование
    end
    result.walk_left = Sprite:init(frames2)

    result.walk4 = Sprite:init(get_frames(6))
    result.walk5 = Sprite:init(get_frames(6))

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
    result.fly1 = Sprite:init(get_frames(6))
    result.fly2 = Sprite:init(get_frames(6))

    frames = get_frames(6)
    result.fly_right = Sprite:init(frames)
    frames2 = {}
    for i, v in ipairs(frames) do
        frames2[#frames2 + 1] = Frame:init(image, v._quad, true) --todo переписать зеркалирование
    end
    result.fly_left = Sprite:init(frames2)

    result.fly4 = Sprite:init(get_frames(6))
    result.fly5 = Sprite:init(get_frames(6))

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
