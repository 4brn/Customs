function init_belts()
    belts = {}
    generate_belt(10, flr(rnd(2)) == 1)
    generate_belt(30, flr(rnd(2)) == 1)
    generate_belt(80, flr(rnd(2)) == 1)
    generate_belt(100, flr(rnd(2)) == 1)
end

function draw_belts()
    for belt in all(belts) do
        for tile in all(belt.tiles) do
            spr(BELT_SPRITES[tile.type], tile.x, belt.y, 2,2,belt.flipped)
        end
    end
end

function generate_belt(y, flipped)
    if flipped == nil then flipped = false end

    local belt = {}

    local iteration
    local start
    local finish

    if flipped then
        iteration = -SIZE
        start = 112
        finish = 0
    else
        start = 0
        finish = 112
        iteration = SIZE
    end
    -- WHY IS IT 112 INSTEAD OF 111 ??????????????

    belt.tiles = {}
    belt.y = y
    belt.flipped = flipped
    belt.dx = flipped and -BELT_SPEED or BELT_SPEED
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
            -- y = y,
            type = type,
        })
    end

    add(belts, belt)
end

function on_belt(obj)
    local y = obj.y
    for index,belt in pairs(belts) do
        if y + 8 > belt.y and y + 8 < belt.y + 16 then
            return true, index
        end
    end

    return false, nil
end
