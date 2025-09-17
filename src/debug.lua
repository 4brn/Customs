local bitmap = {
    [0] = "none",
    [1] = "left",
    [2] = "right",
    [3] = "l+r",
    [4] = "mid",
    [5] = "l+mid",
    [6] = "mid+r",
    [7] = "l+mid+r"
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
    end
end

function mouse_data()
    cursor(2,2,7)
    print(mouse.x .. "/" .. mouse.y)
    print(bitmap[mouse.state])
    print(mouse.state)
end

function explosion_data()
    cursor(30,2,7)
    print("expl:" .. (#explosion % particle_count))
    print("areas:" .. #areas)
end
