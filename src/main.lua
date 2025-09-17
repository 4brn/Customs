function _init()
    init_mouse()
    init_explosion()
end

function _update60()
    update_mouse()
    update_explosion()
end

function _draw()
    cls()
    draw_explosion()
    draw_mouse()

    cursor(2,2,7)
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
