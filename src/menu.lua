MENU = {
    start = 1,
    overview = 2,
    survived = 3,
    win = 4,
    lose = 5,
}

function menu_init()
    menu_delay = 10

    update = menu_update
    draw = menu_draw
end

function menu_update()
    if menu_delay > 0 then
        menu_delay = menu_delay - 1
        return
    end

    if mouse_clicked("left") then
        menu_delay = 10

        if menu == MENU.start then
            menu = MENU.overview
            return
        end

        if menu == MENU.overview then
            game_init()
            return
        end

        if menu == MENU.survived then

            if game.day >= #DIFFICULTY then
                menu = MENU.win
                return
            end

            game.day = game.day + 1
            menu = MENU.overview
            return
        end

        if menu == MENU.win or MENU.lose then
            _init()
            return
        end
    end
end

function menu_draw()
    cls()
    if menu == MENU.start then
        print("start", 7)
        return
    end

    if menu == MENU.overview then
        print("day: " .. (game.day) , 7)
        print("quota: " .. DIFFICULTY[game.day].quota, 7)
        return
    end

    if menu == MENU.lose then
        print("fired", 7)
        return
    end

    if menu == MENU.win then
        print("You survived the week", 7)
        return
    end

    if menu == MENU.survived then
        print("survived", 7)
        return
    end
end
