---@type Sprite
local Sprite = require('src/sprite')
---@type Frame
local Frame = require('src/frame')

---@class Player
---@field public x number
---@field public y number
---@field image Image
---@field sprite Sprite
local Player = {}
Player.__index = Player

Player.SPEED = 400

---@param self Player
---@param name string
---@param x number
---@param y number
---@return Player
function Player.init(self, name, x, y)
    assert(name)
    assert(x)
    assert(y)
    log.debug('create', name)
    local obj = {}
    setmetatable(obj, Player)
    obj.image = love.graphics.newImage(string.format('resourses/textures/%s.png', name))  -- 12.6 MB
    obj:_load_sprites()
    obj.x = x
    obj.y = y
    return obj
end

---@param self Player
function Player._load_sprites(self)
    local S = 96
    local B = 2
    local H, W = self.image:getDimensions()

    local x = 0
    local y = 0
    ---@param count number
    local function get_frames(count)
        local result = {}
        local e = x + count
        while x < e do
            local q = love.graphics.newQuad(B + x * S, B + y * S, S - 2 * B, S - 2 * B, H, W)
            result[#result + 1] = Frame:init(self.image, q)
            x = x + 1
        end
        return result
    end

    self._sprite1_1 = Sprite:init(get_frames(5))
    local frames = get_frames(5)
    for i = 0, 2 do
        frames[#frames + 1] = Frame:init(self.image, frames[4 - i]._quad, true)
    end
    self._sprite1_2 = Sprite:init(frames)
    self._sprite1_3 = Sprite:init(get_frames(3)) --sleep

    x = 0
    y = 1
    self._sprite2_1 = Sprite:init(get_frames(6))
    self._sprite2_2 = Sprite:init(get_frames(6))
    self._sprite2_3 = Sprite:init(get_frames(6)) --walk
    self._sprite2_4 = Sprite:init(get_frames(6))
    self._sprite2_5 = Sprite:init(get_frames(6))

    x = 0
    y = 2
    self._sprite3_1 = Sprite:init(get_frames(6))
    self._sprite3_2 = Sprite:init(get_frames(6))
    self._sprite3_3 = Sprite:init(get_frames(6))  --подпрыгивает
    self._sprite3_4 = Sprite:init(get_frames(6))
    self._sprite3_5 = Sprite:init(get_frames(6))

    x = 0
    y = 3
    self._sprite4_1 = Sprite:init(get_frames(6))
    self._sprite4_2 = Sprite:init(get_frames(6))
    self._sprite4_3 = Sprite:init(get_frames(6))  --run
    self._sprite4_4 = Sprite:init(get_frames(6))
    self._sprite4_5 = Sprite:init(get_frames(6))

    x = 0
    y = 4
    self._sprite5_1 = Sprite:init(get_frames(6))
    self._sprite5_2 = Sprite:init(get_frames(6))
    self._sprite5_3 = Sprite:init(get_frames(6))  --fly wait up
    self._sprite5_4 = Sprite:init(get_frames(6))
    self._sprite5_5 = Sprite:init(get_frames(6))

    x = 0
    y = 5
    self._sprite6_1 = Sprite:init(get_frames(6))
    self._sprite6_2 = Sprite:init(get_frames(6))
    self._sprite6_3 = Sprite:init(get_frames(6))  --fly wait
    self._sprite6_4 = Sprite:init(get_frames(6))
    self._sprite6_5 = Sprite:init(get_frames(6))

    x = 0
    y = 6
    self._sprite7_1 = Sprite:init(get_frames(6))
    self._sprite7_2 = Sprite:init(get_frames(6))
    self._sprite7_3 = Sprite:init(get_frames(6))  --fly run
    self._sprite7_4 = Sprite:init(get_frames(6))
    self._sprite7_5 = Sprite:init(get_frames(6))

    x = 0
    y = 7
    self._sprite8_1 = Sprite:init(get_frames(2))
    self._sprite8_2 = Sprite:init(get_frames(2))
    self._sprite8_3 = Sprite:init(get_frames(2))  --jump up
    self._sprite8_4 = Sprite:init(get_frames(2))
    self._sprite8_5 = Sprite:init(get_frames(2))

    x = 0
    y = 8
    self._sprite9_1 = Sprite:init(get_frames(2))
    self._sprite9_2 = Sprite:init(get_frames(2))
    self._sprite9_3 = Sprite:init(get_frames(2))  --jump down
    self._sprite9_4 = Sprite:init(get_frames(2))
    self._sprite9_5 = Sprite:init(get_frames(2))

    x = 0
    y = 9
    self._sprite10_1 = Sprite:init(get_frames(9))  --kink down
    self._sprite10_2 = Sprite:init(get_frames(5))  --kick up

    x = 0
    y = 10
    self._sprite11_1 = Sprite:init(get_frames(2))  --?
    self._sprite11_2 = Sprite:init(get_frames(3))
    self._sprite11_3 = Sprite:init(get_frames(1))
    self._sprite11_4 = Sprite:init(get_frames(8)) --покачивается злая (idle?)

    x = 0
    y = 11
    self._sprite12_1 = Sprite:init(get_frames(4)) --нокаиутирована

    x = 0
    y = 12
    --todo у Пинки есть ещё ряд

    --по умолчанию персонаж сидит
    self.sprite = self._sprite1_2
end

---@param self Player
---@param dt number
function Player.update(self, dt)
    self.sprite:update(dt)
end

---@param self Player
function Player.draw(self)
    self.sprite.current_frame:draw(self.x, self.y)
end

return Player
