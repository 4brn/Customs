function _init()
    init_explosion()
end

function _update60()
    if btnp(4) then add_explosion(64, 64) end

    update_explosion()
end

function _draw()
    cls()

    draw_explosion()
end
