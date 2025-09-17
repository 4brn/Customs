function _init()
    init_mouse()
    init_explosion()
    init_debug()

    add_area(64, 64, 88, 74)
    add_area(30, 30, 54, 54)

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
