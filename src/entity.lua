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
        on_belt = nil
    }
    )
end

function inside_entity(entity)
    if (mouse.x > entity.x and mouse.y > entity.y)
        and (mouse.x < entity.x + entity.size and mouse.y < entity.y + entity.size) then
        mouse.mode = 3
        return true
    end

    return false
end

function update_entities()
    for i = #Entities, 1, -1 do
        local entity = Entities[i]

        is_on_belt, belt_index = on_belt(entity)
        entity.on_belt = is_on_belt and true or false
        if belt_index ~= nil then
            entity.dx = belts[belt_index].dx
        else
            entity.dx = 0
        end

        -- collision
        -- if entity.x < 0 then entity.x = 0 end
        -- if entity.y < 0 then entity.y = 0 end
        -- if entity.x + entity.size > 127 then entity.x = 127 - entity.size  end
        -- if entity.y + entity.size > 127 then entity.y = 127 - entity.size  end

        -- dragging
        if inside_entity(entity) and mouse_clicked("left") then
            dragging = true
            entity.x = mouse.x - 6
            entity.y = mouse.y - 6
            entity_selected = entity.id

            del(Entities, entity)
            add(Entities, entity)

            mouse.mode = 2
            break
        else
            if inside_area(entity.x + 8, entity.y + 8) then
                del(Entities, entity)
                add_explosion(entity.x + 8, entity.y + 8)
            end
            dragging = false
            entity_selected = nil
        end

        entity.x = entity.x + entity.dx
    end
end

function draw_entities()
    for entity in all(Entities) do
        spr(entity.sprite, entity.x, entity.y, 2, 2)
    end
end
