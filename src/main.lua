function _init()
    init_mouse()
    init_areas()
    init_explosion()
    init_debug()
end

function _update60()
    update_mouse()
    update_explosion()
    update_debug()
end

function _draw()
    cls()

    draw_areas()
    draw_explosion()
    draw_mouse()

    draw_debug()
end
