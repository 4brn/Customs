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
end

function update_debug()
    if stat(31) == "d" then debug_active = not debug_active end
end

function draw_debug()
    if debug_active then
        mouse_data()
        explosion_data()
        entity_data()
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
    print("xpls:" .. (#explosion % particle_count))
    print("reas:" .. #areas)
end

function entity_data()
    cursor(57,2,7)
    print("nttys:"..#Entities)
    print("slctd:".. (selected == nil and "nil" or selected))
end
