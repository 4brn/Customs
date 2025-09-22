local safe_sprites = {4}
local dangerous_sprites = {6, 8}

function init_entities()
    Entities = {}

    dragging = false
    entity_id_counter = 0
    entity_selected = nil

    add_entity(0,40,false)
    add_entity(0,60,false)
end

function add_entity(x, y, dangerous)
    entity_id_counter = entity_id_counter + 1

    -- random sprite based on dangerous (true or false)
    local sprite =  dangerous
    and dangerous_sprites[flr(rnd(#dangerous_sprites)) + 1]
    or safe_sprites[flr(rnd(#safe_sprites)) + 1]

    add(Entities, {
        id = entity_id_counter,
        x = x,
        y = y,
        dx = 0,
        dy = 0,
        size = 16,
        sprite = sprite,
        safe = safe,
    }
    )
end

function inside_entity(entity)
    if (mouse.x > entity.x and mouse.y > entity.y)
        and (mouse.x < entity.x + entity.size and mouse.y < entity.y + entity.size) then
        return true
    end

    return false
end

function update_entities()
    for i = #Entities, 1, -1 do
        local entity = Entities[i]

        -- collision
        -- if entity.x < 0 then entity.x = 0 end
        -- if entity.y < 0 then entity.y = 0 end
        -- if entity.x + entity.size > 127 then entity.x = 127 - entity.size  end
        -- if entity.y + entity.size > 127 then entity.y = 127 - entity.size  end

        -- dragging
        if inside_entity(entity) then
            mouse.mode = 3
            if mouse_clicked("left") then
                mouse.mode = 2
                dragging = true
                entity_selected = entity.id
                entity.x = mouse.x - 6
                entity.y = mouse.y - 6

                del(Entities, entity)
                add(Entities, entity)
                break
            else
                if inside_area(entity.x + 8, entity.y + 8) then
                    add_explosion(entity.x + 8, entity.y + 8)
                    del(Entities, entity)
                end
                dragging = false
            end
        else
            entity_selected = nil
        end
    end
end

function draw_entities()
    for entity in all(Entities) do
        spr(entity.sprite, entity.x, entity.y, 2, 2)
    end
end
