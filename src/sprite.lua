---@type Frame
local Frame = require('src/frame')

local Sprite = {}
Sprite.__index = Sprite

---@param frames Frame[]
---@param delay number длительность кадра
---@param speed number множитель скорости анимации
---@return Sprite
function Sprite:init(frames, delay)--, speed)
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
    obj.W = obj.current_frame.W
    obj.H = obj.current_frame.H
    obj.x = 0
    obj.y = 0
    obj.r = 0
    return setmetatable(obj, Sprite)
end

---@param index number
function Sprite:set_frame(index)
    assert(index)
    self.index = index
    self.current_frame = self._frames[self.index]
    assert(self.current_frame)
end

---@param dt number
function Sprite:update(dt)
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

function Sprite:draw()
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

    local function mirror(f)
        local r = {}
        for _, v in ipairs(f) do
            r[#r + 1] = Frame:init(image, v._quad, true)
        end
        return r
    end

    x = 0
    y = 1
    result.walk1 = Sprite:init(get_frames(6))
    result.walk2 = Sprite:init(get_frames(6))
    frames = get_frames(6)
    result.left_walk = Sprite:init(mirror(frames))
    result.right_walk = Sprite:init(frames)
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
    result.run1 = Sprite:init(get_frames(6))
    result.run2 = Sprite:init(get_frames(6))
    frames = get_frames(6)
    result.left_run = Sprite:init(mirror(frames))
    result.right_run = Sprite:init(frames)
    result.run4 = Sprite:init(get_frames(6))
    result.run5 = Sprite:init(get_frames(6))

    x = 0
    y = 4
    result.fly_wait1 = Sprite:init(get_frames(6))
    result.fly_wait2 = Sprite:init(get_frames(6))
    frames = get_frames(6)
    result.left_fly_wait = Sprite:init(mirror(frames))
    result.right_fly_wait = Sprite:init(frames)
    result.fly_wait4 = Sprite:init(get_frames(6))
    result.fly_wait5 = Sprite:init(get_frames(6))

    x = 0
    y = 5
    result.fly1 = Sprite:init(get_frames(6))
    result.fly2 = Sprite:init(get_frames(6))
    frames = get_frames(6)
    result.left_fly = Sprite:init(mirror(frames))
    result.right_fly = Sprite:init(frames)
    result.fly4 = Sprite:init(get_frames(6))
    result.fly5 = Sprite:init(get_frames(6))

    x = 0
    y = 6
    result.fly_run1 = Sprite:init(get_frames(6))
    result.fly_run2 = Sprite:init(get_frames(6))
    frames = get_frames(6)
    result.left_fly_run = Sprite:init(mirror(frames))
    result.right_fly_run = Sprite:init(frames)
    result.fly_run4 = Sprite:init(get_frames(6))
    result.fly_run5 = Sprite:init(get_frames(6))

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
