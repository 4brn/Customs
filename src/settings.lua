FRAMERATE = 60
DELTA = FRAMERATE < 60 and 2 or 1
SIZE = 16 -- in pixels

DIFFICULTY = {
    [1] = {
        spawn_rate = 2,
        speed = 0.5,
        belts = 2,
        quota = 1,
    },
    [2] = {
        spawn_rate = 3,
        speed = 0.7,
        belts = 3,
        quota = 1,
    },
    [3] = {
        spawn_rate = 4,
        speed = 0.7,
        belts = 4,
        quota = 1,
    },
    [4] = {
        spawn_rate = 5,
        speed = 1,
        belts = 4,
        quota = 1,
    },
    [5] = {
        spawn_rate = 6,
        speed = 1.2,
        belts = 4,
        quota = 1,
    },
}
