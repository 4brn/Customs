local area_colors = {
    fill = 0,
    outline = 6
}

function init_areas()
    areas = {}
    add_area(44,51,40,20)
end

function inside_area(x,y)
    for area in all(areas) do
        if (x > area.x and y > area.y) and
            (x < area.x + area.width and y < area.y + area.height) then
            return true
        end
    end

    return false
end

function add_area(x1, y1, width, height)
    add(areas,{
        x = x1,
        y = y1,
        width = width,
        height = height
    })
end

function draw_areas()
    for a in all(areas) do
        ovalfill(a.x, a.y, a.x + a.width, a.y + a.height, 5)
        oval(a.x, a.y, a.x + a.width, a.y + a.height, 0)
        ovalfill(a.x, a.y + 4, a.x + a.width, a.y + a.height + 4, area_colors.fill)
        oval(a.x, a.y + 4, a.x + a.width, a.y + a.height + 4, 0)
    end
end
