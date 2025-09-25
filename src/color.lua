function update_color()
    if  mouse.dragging then
        -- grayish color pallet
        pal({129,130,134,5,5,7,7,5,6,7,6,131,6,5,7}, 1)
        return
    end

    pal()
end
