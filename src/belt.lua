local BELT_SPRITES = {
    start = 4,
    horizontal = 6,
    finish = 8,
}

function init_belts()
    belts = {}
    speed = DIFFICULTY[game.day].speed

    add(belts,generate_belt(10, flr(rnd(2)) == 1))
    add(belts,generate_belt(30, flr(rnd(2)) == 1))
    add(belts,generate_belt(80, flr(rnd(2)) == 1))
    add(belts,generate_belt(100, flr(rnd(2)) == 1))
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

    local step, start, finish
    if flipped then
        start = 112
        finish = 0
        step = -SIZE
    else
        start = 0
        finish = 112
        step = SIZE
    end

    belt.tiles = {}
    belt.y = y
    belt.start = start
    belt.finish = finish
    belt.flipped = flipped
    belt.dx = flipped and -speed or speed

    for i = start, finish, step do
        local type

        if i == start then type = "start"
        elseif i == finish then type = "finish"
        else type = "horizontal" end

        add(belt.tiles, { x = i, type = type, })
    end

    return belt
end

function get_belt(obj)
    for belt in all(belts) do
        if mid(belt.y, obj.y + 8, belt.y + 16) == obj.y + 8 then
            return true, belt
        end
    end

    return false, nil
end
