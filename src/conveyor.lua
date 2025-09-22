local belt_sprites = {
    start = 64,
    horizontal = 66,
    finish = 68,
}
local size = 16
local belt_speed = 0.2
local animation_delay = 10

function init_belts()
    belts = {}
    -- generate_belt(10, flr(rnd(2)) == 1)
    generate_belt(30, flr(rnd(2)) == 1)
    generate_belt(80, flr(rnd(2)) == 1)
    -- generate_belt(100, flr(rnd(2)) == 1)
end

function draw_belts()
    for belt in all(belts) do
        for tile in all(belt.tiles) do
            spr(belt_sprites[tile.type], tile.x, tile.y, 2,2,belt.flipped)
        end
    end
end

function generate_belt(y, flipped)
    if flipped == nil then flipped = false end

    local iteration = flipped and -size or size
    -- WHY IS IT 112 INSTEAD OF 111 ??????????????
    local start = flipped and 112 or 0
    local finish = flipped and 0 or 112

    local belt = {}

    belt.tiles = {}
    belt.y = y
    belt.flipped = flipped
    belt.dx = flipped and -belt_speed or belt_speed
    belt.dy = 0

    for i = start, finish, iteration do
        local type

        if i == start then
            type = "start"
        elseif i == finish then
            type = "finish"
        else
            type = "horizontal"
        end

        add(belt.tiles, {
            x = i,
            y = y,
            type = type,
        })
    end

    add(belts, belt)
end

-- function on_belt(entity)
--     for index,belt in pairs(belts) do
--         if (entity.x >= 0 and entity.y >= belt.y) and
--         (entity.x + entity.size <= 127 + size and entity.y + entity.size <= belt.y - size ) then
--             return index
--         end
--     end

--     return nil
-- end
