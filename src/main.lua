STATE = {
   start = 1,
   day = 2,
   in_game = 3,
   game_over = 4,
   overview = 5
}

game = {
    state = STATE.start,
    day = 2,
    high_score = 0
}

function _init()
    init_mouse()
    init_menu()

    if game.state == STATE.in_game then
        init_areas()
        init_explosion()
        init_belts()
        init_entities()
        init_debug()
    end
end

function _update60()
    update_mouse()
    if stat(31) == " " then
        game.state = game.state == STATE.overview and 1 or game.state + 1
    end

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
        cursor (50, 50, 7)
        print("game over!")
    elseif game.state == STATE.day then
        cursor (50, 50, 7)
        print("day: " .. DAY[game.day].name)
    elseif game.state == STATE.overview then
        cursor (50, 50, 7)
        print("day: " .. DAY[game.day].name)
        print("highscore: " .. game.high_score)
    elseif game.state == STATE.start then
        cursor (50, 50, 7)
        print("Start:")
    end
    draw_mouse()
end
