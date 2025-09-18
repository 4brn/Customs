function init_areas()
    areas = {}

    -- debug
    add_area(50,50,100,100)
    add_area(30,30,70,70)
end

function inside_area(x,y)
    for area in all(areas) do
        if (x > area.x1 and y > area.y1) and (x < area.x2 and y < area.y2) then
            return true
        end
    end

    return false
end

function add_area(x1, y1, x2, y2)
    add(areas,{
        x1 = x1,
        y1 = y1,
        x2 = x2,
        y2 = y2
    })
end

function draw_areas()
    for a in all(areas) do
        oval(a.x1, a.y1, a.x2, a.y2, 8)
    end
end
