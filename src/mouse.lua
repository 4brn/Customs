function init_mouse()
    mouse = {}
    mouse.x = 64
    mouse.y = 64
    mouse.state = 1
    mouse.delay = 0

    mouse.sprites = {1, 2} -- 1 => normal, 2 => drag
    mouse.mode = 1
end

function mouse_clicked(button)
    local buttons = {left = 1, right = 2, middle = 4}
    if mouse.state == buttons[button] then return true end

    return false
end

function handle_click()
    if mouse_clicked("left") and mouse.delay <= 0 then
        add_explosion(mouse.x, mouse.y)
        mouse.delay = 2
    else
        mouse.delay = mouse.delay - 0.1
    end
end

-- stat(30) => keyboard key pressed
-- stat(31) => keyboard input ("d")
-- stat(32) => mouse X coords
-- stat(33) => mouse Y coords
-- stat(34) => mouse button bitmap
-- 0 => none, 1 => left, 2 => right, 4 => middle
function update_mouse()
    mouse.x = stat(32)
    mouse.y = stat(33)
    mouse.state = stat(34)

    -- use dragging mouse sprite while holding left click
    mouse.mode = mouse.state == 1 and 2 or 1
    handle_click()
end

function draw_mouse()
    spr(mouse.sprites[mouse.mode], mouse.x, mouse.y)
end
