function init_explosion()
    explosion = {}
end

function add_explosion(x, y)
    if inside_area(x, y) then
        for i = 0, PARTICLE_COUNT do
            add(explosion,
                {
                    x = x,
                    y = y,
                    dx = (1 - rnd(2)) * DELTA,
                    dy = (1 - rnd(2)) * DELTA,
                    scale = 2 + rnd(MAX_SCALE),
                    life = LIFE
                }
            )
        end
        sfx(0)
    end
end

function update_explosion()
    for p in all(explosion) do
        p.x = p.x + p.dx
        p.y = p.y + p.dy
        p.scale = p.scale - SUBTRACTION
        p.life = p.life - (SUBTRACTION * DELTA)
        p.color = EXPLOSION_COLORS[flr(p.life)]
        if p.life <= 0 then
            del(explosion, p)
        end
    end
end

function draw_explosion()
    for p in all(explosion) do
        circfill(p.x, p.y, p.scale, p.color)
    end
end
