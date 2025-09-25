local SAFE_SPRITES = {64}
local DANGEROUS_SPRITES = {66, 68}

function init_items()
    items = {}

    id_counter = 1
    spawn_delay_max = flr(FRAMERATE / DIFFICULTY[game.day].spawn_rate)
    spawn_delay = spawn_delay_max
    item_selected = nil
end

function update_items()
    if spawn_delay <= 0 and not mouse.dragging then
        add_item()
        spawn_delay = spawn_delay_max
        return
    else
        spawn_delay = spawn_delay - 1
    end

    for i = #items, 1, -1 do
        local item = items[i]
        local on_belt, belt = get_belt(item)

        item.dx = belt ~= nil and belt.dx * DELTA or 0

        -- dragging
        if mouse_inside_item(item) and mouse_clicked("left") then
            mouse.dragging = true
            mouse.mode = 2

            item.x = mouse.x - 6
            item.y = mouse.y - 6

            item_selected = item.id

            del(items, item)
            add(items, item)
            break
        else
            mouse.dragging = false
            item_selected = nil

            if inside_area(item.x + 8, item.y + 6) then
                add_explosion(item.x + 8, item.y + 6)
                del(items, item)

                if item.safe then
                    game.employment = game.employment - 1
                end
            elseif  on_belt and mid(0, item.x, 112) ~= item.x then
                del(items, item)

                if item.safe then
                    game.score = game.score + 1
                else
                    game.employment = game.employment - 1
                end
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

function spawn_item()
end

function add_item()
    local item = {}
    local belt = rnd(belts)

    local safe =  flr(rnd(2)) + 1 == 1
    local sprite = safe
        and SAFE_SPRITES[flr(rnd(#SAFE_SPRITES)) + 1]
        or DANGEROUS_SPRITES[flr(rnd(#DANGEROUS_SPRITES)) + 1]

    item.id = id_counter
    item.x = belt.flipped and 112 or 0
    item.y = belt.y - 3 + flr(rnd(3))
    item.dx = 0
    item.safe = safe
    item.sprite = sprite

    add(items, item)
    id_counter = id_counter + 1
end
