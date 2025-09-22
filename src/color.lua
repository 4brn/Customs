function grayscale()
    pal({129,130,134,5,5,6,7,7,6,7,5,131,6,5,7}, 1)
end

function update_color()
    if dragging then
        grayscale()
    else
        pal()
    end
end
