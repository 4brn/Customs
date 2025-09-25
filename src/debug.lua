local bitmap = {
    [0] = "nil",
    [1] = "l",
    [2] = "r",
    [3] = "l+r",
    [4] = "m",
    [5] = "l+m",
    [6] = "m+r",
    [7] = "l+m+r"
}

function init_debug()
    debug_active = false
    menuitem(1, "debug: off", function()
        debug_active = not debug_active
        menuitem(nil, "debug: " .. (debug_active and "on" or "off"))
        return true
    end
    )
end

function update_debug()
    -- remove later
    if stat(31) == "d" then debug_active = not debug_active end
end

function draw_debug()
    if debug_active then
        -- rectfill(0,0,127,20,0)
        mouse_data()
        explosion_data()
        item_data()
        game_data()
    end
end

function mouse_data()
    cursor(2,2,7)
    print(mouse.x .. "/" .. mouse.y)
    print(bitmap[mouse.state])
    print(mouse.state)
end

function explosion_data()
    cursor(27,2,7)
    print("xpls:" .. (#explosion / PARTICLE_COUNT))
    print("reas:" .. #areas)
end

function item_data()
    cursor(57,2,7)
    print("items:"..#items)
    print("slctd:".. (item_selected == nil and 0 or item_selected))
end

function game_data()
    cursor(97, 2, 7)
    print("q:" .. game.score .. "/" .. game.quota)
    print("e:" .. game.employment)
end
