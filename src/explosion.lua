function init_explosion()
    explosion = {}
    colors = { 5, 9, 10, 7 }
end

function add_explosion(x, y)
    for particle = 0, 20 do
        add(
            explosion, {
                x = x,
                y = y,
                dx = 1 - rnd(2),
                dy = 1 - rnd(2),
                scale = 2 + rnd(5),
                life = 5
            }
        )
    end
    sfx(rnd(3))
end

function update_explosion()
    for particle in all(explosion) do
        particle.x = particle.x + particle.dx
        particle.y = particle.y + particle.dy
        particle.scale = particle.scale - 0.3
        particle.life = particle.life - 0.2
        particle.color = colors[flr(particle.life)]
        if particle.life <= 0 then del(explosions, particle) end
    end
end

function draw_explosion()
    for particle in all(explosion) do
        circfill(particle.x, particle.y, particle.scale, particle.color)
    end
end
