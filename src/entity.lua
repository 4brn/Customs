local padding = 5
local safe_sprites = {4}
local dangerous_sprites = {6}

function init_entities()
    Entities = {}

    entity_id_counter = 0
    entity_selected = nil

    add_entity(20,20, false)
    add_entity(50,50, true)
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
        dx = 0.1,
        dy = 0.1,
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
        if inside_entity(entity) then
            entity_selected = entity.id

            if mouse_clicked("left") then
                entity.x = mouse.x - 6
                entity.y = mouse.y - 6

                del(Entities, entity)
                add(Entities, entity)
                break
            end
        else
            entity_selected = nil
        end
    end

    for entity in all(Entities) do
        entity.x = entity.x + entity.dx
        if entity.x < 0 then entity.x = 0 end
        if entity.y < 0 then entity.y = 0 end
        if entity.x + entity.size > 127 then entity.x = 127 - entity.size  end
        if entity.y + entity.size > 127 then entity.y = 127 - entity.size  end
    end

end

function draw_entities()
    for entity in all(Entities) do
        spr(entity.sprite, entity.x, entity.y, 2, 2)
    end
end
