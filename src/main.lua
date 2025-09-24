STATE = {
    menu = "menu",
    start = "start",
    in_game = "in_game",
    game_over = "game_over",
}

game = {
    state = STATE.in_game,
    difficulty = 4,
    high_score = 0
}

function _init()
    init_mouse()
    init_menu()
    init_debug()
    init_areas()
    init_explosion()
    init_belts()
    init_entities()
end

function _update60()
    update_mouse()

    if game.state == STATE.in_game then
        update_entities()
        update_explosion()
        update_debug()
        update_color()
    end
end

function _draw()
    cls()
    if game.state == STATE.in_game then
        cls(3) -- green background
        map()
        draw_areas()
        draw_belts()
        draw_entities()
        draw_explosion()
        draw_debug()
    elseif game.state == STATE.game_over then
        cursor(64,64, 7)
        print("game over!")
    elseif game.state == STATE.start then
        cursor (50, 50, 7)
        print("Start:")
    end
    draw_mouse()
end
