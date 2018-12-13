local const = {}

--сила трения воздуха
const.K_FORCE_SKY = 10
--сила трения о поверхность
const.K_FORCE_GROUNG = 100
--"потолок" мира
const.WORLD_LIMITY = -10000

const.BG_COLOR = {0.62, 0.85, 0.9, 1.0}

--силушка дефолтной поняши в лошадиных силах
const.FORCE_PONY = 1000

--различные коэффициенты
const.K_PONY_JUMP = 0.5
const.K_PONY_R = math.pi * 0.5
const.K_PONY_FLY = 0.05
const.K_PONY_ROTATE = 1000
const.K_PONY_P = 1.5
const.K_PONY_I = 100

--высота половины полоски хитпойнтов
const.HP_H_HALF = 4
const.HP_KEY_POINTS = { 0.0, 0.25, 0.8, 1.0 }
const.HP_COLOR_GREEN = { 0.0, 0.7, 0.0, 1.0 }
const.HP_COLOR2 = { 0.7, 0.7, 0.0, 1.0 }
const.HP_COLOR_RED = { 1.0, 0.0, 0.0, 1.0 }

--безопасная скорость, удары об другие объекты при которой не причиняют урон
const.DAMAGE_SAFE_SPEED = 5
--коэффициент в формуле кинетической энергии
const.K_DAMAGE = 0.01
--штраф за полёты на слишком большой высоте. HP/sec
const.DAMAGE_OVERFLY = 5
--автовосстановление
const.DAMAGE_NONE = 0.2

assert(#const.HP_KEY_POINTS == 4)

return const
