function init_debug()
    debug_active = false
end

function debug_mode()
    if debug_active then
        mouse_data()
        explosion_data()
    end
end

function mouse_data()
    cursor(2,2,7)
    print(mouse.x .. "/" .. mouse.y)
    if mouse.state == 0 then
        print("none")
    elseif mouse.state == 1  then
        print("left")
    elseif mouse.state == 2  then
        print("right")
    elseif mouse.state == 4  then
        print("middle")
    end
end

function explosion_data()
    cursor(30,2,7)
    print("expl:" .. (#explosion % particle_count))
    print("areas:" .. #areas)
end
