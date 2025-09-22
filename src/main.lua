function _init()
    init_mouse()
    init_entities()
    init_areas()
    init_explosion()
    init_debug()
end

function _update60()
    update_mouse()
    update_entities()
    update_explosion()
    update_debug()
    update_color()
end

function _draw()
    cls(3) -- green background
    map()
    draw_areas()
    draw_entities()
    draw_explosion()
    draw_mouse()
    draw_debug()
end
