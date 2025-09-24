framerate = 60
size = 16 -- pixels

-- Entity
entity_spawn_rate = nil -- every second
safe_sprites = {64}
dangerous_sprites = {66, 68}

-- Belt
belt_speed = nil -- pixels moved each frame
belt_sprites = {
    start = 4,
    horizontal = 6,
    finish = 8,
}

-- Difficulty
difficulty = {
    baby = "baby",
    loser = "loser",
    easy = "easy",
    job = "job",
}

function set_difficulty(level)
    if level == "baby" then
        entity_spawn_rate = 3
        belt_speed = 0.5
    elseif level == "loser" then
        entity_spawn_rate = 4
        belt_speed = 0.7
    elseif level == "easy" then
        entity_spawn_rate = 4
        belt_speed = 1
    elseif level == "job" then
        belt_speed = 1.2
        entity_spawn_rate = 5
    else
        entity_spawn_rate = 4
        belt_speed = 0.7
    end
end
