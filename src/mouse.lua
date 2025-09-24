local MOUSE_SPRITES = {1, 2, 3} -- 1 => normal, 2 => drag, 3 => point
local BUTTONS = {left = 1, right = 2, middle = 4}

function init_mouse()
    mouse = {}
    mouse.x = 64
    mouse.y = 64
    mouse.state = 0

    mouse.mode = 1
end

function mouse_clicked(button)
    if mouse.state == BUTTONS[button] then return true end
    return false
end

function update_mouse()
    mouse.x = stat(32)
    mouse.y = stat(33)
    mouse.state = stat(34)

    -- use dragging sprite while holding left click
    mouse.mode = mouse.state == 1 and 2 or 1

    -- mouse collision
    if mouse.x < 0 then
        mouse.x = 0
    elseif mouse.x + 8 > 127 then
        mouse.x = 127 - 8
    end

    if mouse.y < 0 then
        mouse.y = 0
    elseif mouse.y + 8 > 127 then
        mouse.y = 127 - 8
    end
end

function draw_mouse()
    spr(MOUSE_SPRITES[mouse.mode], mouse.x, mouse.y)
end
