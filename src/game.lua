function game_init()
    game.score = 0
    game.quota = DIFFICULTY[game.day].quota

    init_areas()
    init_explosion()
    init_belts()
    init_items()
    init_debug()

    update = game_update
    draw = game_draw
end

function game_update()
    -- remove later
    if btnp(4) then
        menu = "lose"
        menu_init()
        return
    end

    if game.score >= game.quota then
        menu = "survived"
        menu_init()
        return
    end

    if game.employment <= 0 then
        menu = "lose"
        menu_init()
        return
    end

    update_items()
    update_color()
    update_explosion()
    update_debug()
end

function game_draw()
    cls(3)
    map()
    draw_areas()
    draw_belts()
    draw_items()
    draw_explosion()
    draw_debug()
end
