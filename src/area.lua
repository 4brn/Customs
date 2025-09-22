area_colors = {
    fill = 0,
    outline = 8
}

function init_areas()
    areas = {}

    add_area(40,40,50,30)
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
        ovalfill(a.x, a.y, a.x + a.width, a.y + a.height, area_colors.fill)
        oval(a.x, a.y, a.x + a.width, a.y + a.height, area_colors.outline)
    end
end
