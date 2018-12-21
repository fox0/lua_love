local const = {}

--сила трения воздуха
const.K_FORCE_SKY = 10
--сила трения о поверхность
const.K_FORCE_GROUNG = 100
--"потолок" мира
const.WORLD_LIMITY = -10000

const.BG_COLOR = { 0.62, 0.85, 0.9, 1.0 }

--силушка дефолтной поняши в лошадиных силах
const.FORCE_PONY = 1000

--todo
--const.PONIES = {
--    default = {
--        FORCE = 1000
--    }
--}

--различные коэффициенты
const.K_PONY_FORCE_FLY_Y = 0.3
const.K_PONY_FORCE_FLY_DJITTING = 0.05

const.K_PONY_JUMP = 0.5
const.K_PONY_R = math.pi * 0.5
const.K_PONY_ROTATE = 1000
const.K_PONY_P = 1.5
const.K_PONY_I = 100

--todo
--const.SPRITE_KEY_POINTS_GROUND = { 0.0, 0.25, 0.8, 1.0 }
--const.SPRITE_KEY_POINTS_FLY = { 0.0, 0.25, 0.8, 1.0 }

--высота половины полоски хитпойнтов
const.UI_HP_H_HALF = 4
const.UI_HP_KEY_POINTS = { 0.0, 0.25, 0.8, 1.0 }
const.UI_HP_COLOR_GREEN = { 0.0, 0.7, 0.0, 1.0 }
const.UI_HP_COLOR2 = { 0.7, 0.7, 0.0, 1.0 }
const.UI_HP_COLOR_RED = { 1.0, 0.0, 0.0, 1.0 }

const.UI_FORCE_X0 = 40
const.UI_FORCE_SIZE = 8
const.UI_FORCE_COLOR = { 0.0, 0.0, 1.0, 0.7 }

const.UI_SPEED_X0 = 40
const.UI_SPEED_STEP = 15
const.UI_SPEED_SIZE = 8
const.UI_SPEED_COLOR = { 0.0, 0.0, 0.0, 0.7 }
const.UI_SPEED_K = 0.05

--безопасная скорость, удары об другие объекты при которой не причиняют урон
const.DAMAGE_SAFE_SPEED = 5
--коэффициент в формуле кинетической энергии
const.K_DAMAGE = 0.01
--штраф за полёты на слишком большой высоте. HP/sec
const.DAMAGE_OVERFLY = 5
--автовосстановление
const.DAMAGE_NONE = 0.2

assert(#const.UI_HP_KEY_POINTS == 4)

return const
