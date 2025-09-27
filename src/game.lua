function game_init()
    game.score = 0
    game.quota = DIFFICULTY[game.day].quota

    init_areas()
    init_explosion()
    init_belts()
    init_items()
    init_debug()

    sfx(2, 1)

    update = game_update
    draw = game_draw
end

function game_update()
    if game.score >= game.quota then
        menu = MENU.survived
        sfx()
        menu_init()
        return
    end

    if game.employment <= 0 then
        menu = MENU.lose
        sfx()
        menu_init()
        return
    end

    update_items()
    update_color()
    update_explosion()
end

function game_draw()
    cls(3)
    map()
    cursor(53,2,7)
    print("day: "..game.day)
    cursor(10, 55, 7)
    print("quota:")
    print(" "..game.score .. "/" .. game.quota)
    cursor(88, 55, 7)
    print("mistakes:")
    print("  " .. 20 - game.employment .. "/20")
    draw_areas()
    draw_belts()
    draw_items()
    draw_explosion()
    draw_debug()
end
