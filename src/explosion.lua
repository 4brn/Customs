local colors = { 5, 9, 10, 7 }
local particle_count = 30
local max_scale = 6
local life = 5
local subtraction = 0.2

function init_explosion()
    explosion = {}
end

function add_explosion(x, y)
    if inside_area(x, y) then
        for i = 0, particle_count do
            add(explosion,
                {
                    x = x,
                    y = y,
                    dx = 1 - rnd(2),
                    dy = 1 - rnd(2),
                    scale = 2 + rnd(max_scale),
                    life = life
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
        p.scale = p.scale - subtraction
        p.life = p.life - subtraction
        p.color = colors[flr(p.life)]
        if p.life <= 0 then
            del(explosion, p)
        end
    end
end

function draw_explosion()
    for p in all(explosion) do
        circfill(p.x, p.y, p.scale, p.color)
        circ(p.x, p.y, p.scale, p.color)
    end
end
