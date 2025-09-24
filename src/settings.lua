FRAMERATE = 60
SIZE = 16 -- pixels

-- Entity
ENTITY_SPAWN_RATE = nil -- every second
SAFE_SPRITES = {64}
DANGEROUS_SPRITES = {66, 68}

-- Belt
BELT_SPEED = nil -- pixels moved each frame
BELT_SPRITES = {
    start = 4,
    horizontal = 6,
    finish = 8,
}

-- Difficulty
DIFFICULTY = {
    baby = "baby",
    loser = "loser",
    easy = "easy",
    job = "job",
}

function set_difficulty(level)
    if level == "baby" then
        ENTITY_SPAWN_RATE = 3
        BELT_SPEED = 0.5
    elseif level == "loser" then
        ENTITY_SPAWN_RATE = 4
        BELT_SPEED = 0.7
    elseif level == "easy" then
        ENTITY_SPAWN_RATE = 4
        BELT_SPEED = 1
    elseif level == "job" then
        ENTITY_SPAWN_RATE = 5
        BELT_SPEED = 1.2
    else
        ENTITY_SPAWN_RATE = 4
        BELT_SPEED = 0.7
    end
end
