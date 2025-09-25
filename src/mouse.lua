local MOUSE_SPRITES = {1, 2, 3} -- 1 => normal, 2 => drag, 3 => point
local BUTTONS = {left = 1, right = 2, middle = 4}

function init_mouse()
    mouse = {}
    mouse.x = 64
    mouse.y = 64
    mouse.state = 0
    mouse.dragging = false
    mouse.mode = 1
end

function update_mouse()
    mouse.x = stat(32)
    mouse.y = stat(33)
    mouse.state = stat(34)

    -- use dragging sprite while holding left click
    mouse.mode = mouse.state == 1 and 2 or 1

    -- mouse collision
    mouse.x = mid(0, mouse.x, 120)
    mouse.y = mid(0, mouse.y, 120)
end

function draw_mouse()
    spr(MOUSE_SPRITES[mouse.mode], mouse.x - 2, mouse.y)
end

function mouse_clicked(button, delay)
    if mouse.state == BUTTONS[button] then
        return true
    end

    return false
end

function mouse_inside_item(item)
    -- whether mouse X is between the most left and most right of item X coords
    local cond1 = mid(item.x, mouse.x, item.x + SIZE) == mouse.x
    -- whether mouse X is between the most upper and lowest of item Y coords
    local cond2 = mid(item.y, mouse.y, item.y + SIZE) == mouse.y

    if cond1 and cond2 then
        mouse.mode = 3
        return true
    end

    return false
end
