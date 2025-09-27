FRAMERATE = 60
DELTA = FRAMERATE < 60 and 2 or 1
SIZE = 16 -- px

function _init()
    game = {
        day = 1,
        score = 0,
        quota = 0,
        employment = 20,
    }

    menu = MENU.start

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
