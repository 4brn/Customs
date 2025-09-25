function menu_init()
    update = menu_update
    draw = menu_draw
end

function menu_update()
    if btnp(4) then
        if menu == "start" then
            menu = "overview"
            return
        end

        if menu == "overview" then
            game_init()
            return
        end

        if menu == "survived" then
            if game.day < 5 then
                game.day = game.day + 1
                menu = "overview"
            else
              menu = "win"
            end
            return
        end

        if menu == "lose" or "win" then
            _init()
            return
        end
    end
end

function menu_draw()
    cls()
    if menu == "start" then
        print("start", 7)
        return
    end

    if menu == "overview" then
        print("day: " .. (game.day) , 7)
        print("quota: " .. DIFFICULTY[game.day].quota, 7)
        return
    end

    if menu == "lose" then
        print("fired", 7)
        return
    end

    if menu == "win" then
        print("You survived the week", 7)
        return
    end

    if menu == "survived" then
        print("survived", 7)
        return
    end

end
