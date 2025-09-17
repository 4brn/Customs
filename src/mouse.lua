function init_mouse()
    mouse = {}
    mouse.x = 64
    mouse.y = 64
    mouse.state = 1
    mouse.delay = 0

    mouse.sprites = {1, 2} -- 1 => normal, 2 => drag
    mouse.mode = 1
end

function mouse_click(button)
    local buttons = {left = 1, right = 2, middle = 4}
    if mouse.state == buttons[button] then return true end

    return false
end

function update_mouse()
    mouse.x = stat(32)
    mouse.y = stat(33)

    -- stat(34) => 0 (none)
    -- stat(34) => 1 (left click)
    -- stat(34) => 2 (right click)
    -- stat(34) => 4 (mouse wheel click)
    mouse.state = stat(34)

    if mouse_click("left") and mouse.delay <= 0 then
        add_explosion(mouse.x, mouse.y)
        mouse.delay = 1
    else
        mouse.delay = mouse.delay - 0.2
    end

    mouse.mode = mouse.state == 2 and 2 or 1
end

function draw_mouse()
    spr(mouse.sprites[mouse.mode], mouse.x, mouse.y)
end
