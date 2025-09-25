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

local COLOR = 1
function init_debug()
    debug_active = false
    menuitem(1, "debug: off", function()
        debug_active = not debug_active
        menuitem(nil, "debug: " .. (debug_active and "on" or "off"))
        return true
    end
    )
end

function draw_debug()
    if debug_active then
        mouse_data()
        explosion_data()
        item_data()
        game_data()
    end
end

function mouse_data()
    cursor(2,2,COLOR)
    print("mouse:")
    print(mouse.x .. "/" .. mouse.y)
    print(bitmap[mouse.state])
    print(mouse.state)
end

function explosion_data()
    cursor(27,2,COLOR)
    print("boom:" .. (#explosion / PARTICLE_COUNT))
    print("count:" .. #areas)
end

function item_data()
    cursor(57,2,COLOR)
    print("items:"..#items)
    print("id:".. (item_selected ~= nil and item_selected or "nil"))
end

function game_data()
    cursor(97, 2, COLOR)
    print("day:" .. game.day)
    print("q:" .. game.score .. "/" .. game.quota)
    print("e:" .. game.employment)
end
