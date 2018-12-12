local const = {}

--сила трения воздуха
const.K_FORCE_SKY = 10
--сила трения о поверхность
const.K_FORCE_GROUNG = 100
--силушка дефолтной поняши в лошадиных силах
const.FORCE_PONY = 1000

--различные коэффициенты
const.K_PONY_ROTATE = 800
const.K_PONY_ROTATE2 = 1000
const.K_PONY_JUMP = 0.3
const.K_PONY_FLY = 0.05
const.K_PONY_P = 1.5
const.K_PONY_I = 100

--высота половины полоски хитпойнтов
const.HP_H_HALF = 4
const.HP_KEY_POINTS = { 0.0, 0.1, 0.8, 1.0 }
const.HP_COLOR_GREEN = { 0.0, 0.7, 0.0, 1.0 }
const.HP_COLOR2 = { 0.7, 0.7, 0.0, 1.0 }
const.HP_COLOR_RED = { 1.0, 0.0, 0.0, 1.0 }

const.DAMAGE_SAFE_SPEED = 5
const.K_DAMAGE = 0.02

assert(#const.HP_KEY_POINTS == 4)

return const
