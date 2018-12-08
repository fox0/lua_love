---@type Sprite
local Sprite = require('src/sprite')

---@class Player
---@field public x number
---@field public y number
---@field image Image
---@field sprites table Словарь со спрайтами
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
    assert_fox(name)
    assert_fox(x)
    assert_fox(y)
    log.debug('create', name)
    local obj = {}
    setmetatable(obj, Player)
    obj.image = love.graphics.newImage(string.format('resourses/textures/%s.png', name))  -- 12.6 MB

    obj.name = name  --todo delme
    obj.x = x
    obj.y = y

    obj.sprites = Sprite.parse_texture(obj.image)
    obj.sprite = obj.sprites._sprite1_2  --по умолчанию персонаж сидит
    assert_fox(obj.sprite)
    return obj
end

---@param self Player
function Player.release(self)
    self.image:release()
end

--if log.level == 'debug' then
--    ---@param self Player
--    ---@return string
--    function Player.__tostring(self)
--        return string.format('<Player> x=%d y=%d name="%s"', self.x, self.y, self.name)
--    end
--end

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
