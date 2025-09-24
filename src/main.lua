function _init()
    init_mouse()
    init_menu()
    init_debug()

    set_difficulty(difficulty.job)

    init_belts()
    init_entities()
    init_areas()
    init_explosion()
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
    draw_belts()
    draw_entities()
    draw_explosion()
    draw_debug()
    draw_mouse()
end
