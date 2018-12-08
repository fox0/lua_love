---@type Sprite
local Sprite = require('src/sprite')

---@class Player
---@field sprites table Словарь со спрайтами
---@field sprite Sprite
local Player = {}
Player.__index = Player

Player.SPEED = 400

---@param self Player
---@param image Image
---@return Player
function Player.init(self, image)
    local obj = {}
    obj.sprites = Sprite.parse_texture(image)
    obj.sprite = obj.sprites._sprite2_3
    obj.x = 0
    obj.y = 0
    return setmetatable(obj, Player)
end

---@param self Player
---@param dt number
function Player.update(self, dt)
    self.sprite:update(dt)
end

---@param self Player
function Player.draw(self)
    self.sprite.x = self.x
    self.sprite.y = self.y
    self.sprite:draw()
end

return Player
