local COLORS = {
    fill = 0,
    outline = 6,
    shade = 5
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
        ovalfill(a.x + 1, a.y, a.x - 1 + a.width, a.y + a.height, COLORS.shade)
        ovalfill(a.x + 1, a.y + 3, a.x + a.width - 1, a.y + a.height + 4, COLORS.fill)
        oval(a.x, a.y - 1, a.x + a.width, a.y + a.height + 5, COLORS.outline)
    end
end
