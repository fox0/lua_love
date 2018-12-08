---@type Sprite
local Sprite = require('src/sprite')

---@class Player
---@field public sprite Sprite
---@field sprites table Словарь со спрайтами
---@field body any
---@field shape any
local Player = {}
Player.__index = Player

---@param self Player
---@param image Image
---@param world any
---@param x number
---@param y number
---@return Player
function Player.init(self, image, world, x, y)
    local obj = {}
    obj.sprites = Sprite.parse_texture(image)
    ---@type Sprite
    obj.sprite = obj.sprites._sprite2_3

    obj.body = love.physics.newBody(world, x, y, 'dynamic')
    --local _, _, w, h = obj.sprite.current_frame._quad:getViewport()
    --log.debug(w,h)
    local w, h = 92, 92
    obj.shape = love.physics.newCircleShape(w / 2, h / 2, 35)
    local fixture = love.physics.newFixture(obj.body, obj.shape)
    fixture:setUserData('player')
    obj.body:setMassData(obj.shape:computeMass(1))

    return setmetatable(obj, Player)
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
    self.sprite.x = self.body:getX()
    self.sprite.y = self.body:getY()
    self.sprite.r = self.body:getAngle()
    self.sprite:update(dt)
end

---@param self Player
function Player.draw(self)
    self.sprite:draw()
    self:_debug_draw()
end

function Player._debug_draw()

end

if log.level == 'debug' then
    ---@param self Player
    function Player._debug_draw(self)
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor(.0, .0, 1., 1.)
        --love.graphics.setLineStyle('rough')  --todo getlinetype
        local x, y = self.shape:getPoint()
        love.graphics.circle('line', self.sprite.x + x, self.sprite.y + y, self.shape:getRadius())
        love.graphics.setColor(r, g, b, a)
    end
end

return Player
