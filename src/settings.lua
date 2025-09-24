FRAMERATE = 60
DELTA = FRAMERATE < 60 and 2 or 1
SIZE = 16 -- in pixels

-- Difficulty
DIFFICULTY = {
    [1] = {
        name = "monday",
        entity_spawn_rate = 2,
        belt_speed = 0.5
    },
    [2] = {
        name = "tuesday",
        entity_spawn_rate = 3,
        belt_speed = 0.7
    },
    [3] = {
        name = "wednesday",
        entity_spawn_rate = 4,
        belt_speed = 0.7
    },
    [4] = {
        name = "thursday",
        entity_spawn_rate = 5,
        belt_speed = 1
    },
    [5] = {
        name = "friday",
        entity_spawn_rate = 6,
        belt_speed = 1.2
    },
}

-- Entity
ENTITY_SPAWN_RATE = DIFFICULTY[1].entity_spawn_rate -- every second
SAFE_SPRITES = {64}
DANGEROUS_SPRITES = {66, 68}

-- Belt
BELT_SPEED = DIFFICULTY[1].belt_speed -- pixels moved each frame
BELT_SPRITES = {
    start = 4,
    horizontal = 6,
    finish = 8,
}

-- Explosion
EXPLOSION_COLORS = { 5, 9, 10, 7 }
PARTICLE_COUNT = 20
LIFE = 6
SUBTRACTION = 0.2 -- subtracted from LIFE each frame
MAX_SCALE = 4
