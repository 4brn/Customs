MENU = {
    start = 1,
    email = 2,
    overview = 3,
    survived = 4,
    win = 5,
    lose = 6,
}
menu_delay_max = 50

function menu_init()
    menu_delay = menu_delay_max
    music = false

    sfx(3, 1)

    if menu == MENU.lose then
        sfx(4, 1)
    end

    update = menu_update
    draw = menu_draw
end

function menu_update()
    if menu_delay > 0 then
        menu_delay = menu_delay - 1
        return
    end

    if mouse_clicked("left") then
        menu_delay = menu_delay_max
        sfx(1)

        if menu == MENU.start then
            if game.day > 1 then
                menu = MENU.overview
                return
            end

            menu = MENU.email
            return
        end

        if menu == MENU.email then
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
        print("you have 1 new email!")
        print("click to read")
        return
    end

    if menu == MENU.email then
        print("subject: job offer\n", 7)
        print("hello, friend")
        print("we are pleased to inform you")
        print("that you have been selected")
        print("for the position of baggage")
        print("handler at e-corp.\n")
        print("please be present on monday")
        print("for you first day of work.\n")
        print("further details, regarding")
        print("work details, and schedule")
        print("will be given on monday.\n")
        print("best regards,")
        print("elliot alderson")
        return
    end

    if menu == MENU.overview then
        print("subject: day " .. game.day .. " ( " .. DIFFICULTY[game.day].name .. " )\n")

        if game.day == 1 then
            print("instructions:\n")
            print("- oversee conveyor belts", 10)
            print("- let red backpacks pass")
            print("- remove dangerous/illegal items\n")
            print("- 20 total mistakes", 10)
            print("- must meet daily quota\n")
            print("(that's how many backpacks", 7)
            print(" you need to pass for the day)\n")
            print("grabbing an item,stops time.", 3)
            print("moving fast will drop items.\n", 8)
        end

        print("quota: " .. DIFFICULTY[game.day].quota .. " <--" .. "\n", 7)
        print("good luck :)")
        return
    end

    if menu == MENU.lose then
        print("subject: job \n", 7)
        print("you are fired!", 8)
        print("go and find an easier job \n", 7)
        print("worst regards,")
        print("elliot alderson")
        return
    end

    if menu == MENU.win then
        print("subject: performance review \n", 7)
        print("hello, friend")
        print("you did an outstanding job this week", 3)
        print("unfortunately you are being let go", 7)
        print("nothing personal kid.\n", 7)

        print("best regards,")
        print("elliot alderson")
        return
    end

    if menu == MENU.survived then
        print("subject: day " .. game.day .. " ( " .. DIFFICULTY[game.day].name .. " )\n", 7)
        print("status: employed", 3)
        print("quota: met \n", 3)
        print("mistakes: " .. 20 - game.employment .. "/20\n", 7)
        print("you survived.")
        print("for now...")
        return
    end
end
