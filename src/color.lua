function update_color()
    if dragging then
        -- grey-scale color pallet
        pal({129,130,134,5,5,7,7,5,6,7,6,131,6,5,7}, 1)
    else
        pal()
    end
end
