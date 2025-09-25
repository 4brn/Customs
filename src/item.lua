function init_items()
    SAFE_SPRITES = {64}
    DANGEROUS_SPRITES = {66, 68}

    items = {}
    id_counter = 0
    spawn_delay_max = flr(FRAMERATE / DIFFICULTY[game.day].spawn_rate)
    spawn_delay = spawn_delay_max
    item_selected = nil
end

function update_items()
    if spawn_delay <= 0 and not mouse.dragging then
        add_item()
        spawn_delay = spawn_delay_max
    else
        spawn_delay = spawn_delay - 1
    end

    for i = #items, 1, -1 do
        local item = items[i]

        local on_belt, belt_index = on_belt(item)
        -- item.on_belt = is_on_belt
        if on_belt and belt_index ~= nil then
            item.dx = belts[belt_index].dx * DELTA
        else
            item.dx = 0
        end

        -- dragging
        if inside_item(item) and mouse_clicked("left") then
            mouse.dragging = true

            item.x = mouse.x - 6
            item.y = mouse.y - 6

            item_selected = item.id

            del(items, item)
            add(items, item)

            mouse.mode = 2
            break
        else
            mouse.dragging = false
            item_selected = nil

            if inside_area(item.x + 8, item.y + 6) then
                add_explosion(item.x + 8, item.y + 6)
                if item.safe then game.employment = game.employment - 1 end
                del(items, item)
            elseif on_belt and (item.x < 0 or item.x > 112) then
                if item.safe then
                    game.score = game.score + 1
                else
                    game.employment = game.employment - 1
                end
                del(items, item)
            else
                item.x = item.x + item.dx
            end
        end
    end
end

function draw_items()
    for item in all(items) do
        spr(item.sprite, item.x, item.y, 2, 2)
    end
end

function add_item()
    id_counter = id_counter + 1

    -- local belt_index = flr(rnd(#belts)) + 1
    -- local belt = belts[belt_index]
    -- if belt == nil then menu_init() return end
    local belt = rnd(belts)
    local safe =  flr(rnd(2)) + 1 == 1

    -- random sprite based on dangerous (true or false)
    local sprite = safe
        and SAFE_SPRITES[flr(rnd(#SAFE_SPRITES)) + 1]
        or DANGEROUS_SPRITES[flr(rnd(#DANGEROUS_SPRITES)) + 1]

    add(items, {
        id = item_id_counter,
        x = belt.flipped and 112 or 0,
        y = belt.y - 3 + flr(rnd(3)),
        dx = 0,
        dy = 0,
        sprite = sprite,
        safe = safe,
        on_belt = nil
    }
    )
end

function inside_item(item)
    if (mouse.x > item.x and mouse.y > item.y)
        and (mouse.x < item.x + SIZE and mouse.y < item.y + SIZE) then
        mouse.mode = 3
        return true
    end

    return false
end
