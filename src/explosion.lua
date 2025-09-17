function init_explosion()
    explosion = {}
    areas = {}
    particle_count = 20
    colors = { 5, 9, 10, 7 }
end

function add_explosion(origin_x, origin_y)
    for a in all(areas) do
        if (origin_x > a.x1 and origin_y > a.y1 and origin_x < a.x2 and origin_y < a.y2) then
            for i = 0, particle_count do
                add(
                    explosion, {
                        x = origin_x,
                        y = origin_y,
                        dx = 1 - rnd(2),
                        dy = 1 - rnd(2),
                        scale = 2 + rnd(5),
                        life = 5
                    }
                )
            end
            sfx(0)
        end
    end
end

function update_explosion()
    for particle in all(explosion) do
        particle.x = particle.x + particle.dx
        particle.y = particle.y + particle.dy
        particle.scale = particle.scale - 0.2
        particle.life = particle.life - 0.2
        particle.color = colors[flr(particle.life)]
        if particle.life <= 0 then
            del(explosion, particle)
        end
    end
end

function draw_explosion()
    for particle in all(explosion) do
        circfill(particle.x, particle.y, particle.scale, particle.color)
    end
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
