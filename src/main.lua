function _init()
    game = {
        day = 5,
        score = 0,
        quota = 0,
        employment = 20,
    }

    menu = "start"

    init_mouse()
    menu_init()
end

function _update60()
    update_mouse()
    update()
end

function _draw()
    draw()
    draw_mouse()
end
