function init_entities()
    Entities = {}

    spawn_delay = framerate / entity_spawn_rate
    dragging = false
    entity_id_counter = 0
    entity_selected = nil
end

function update_entities()
    spawn_entities()

    for i = #Entities, 1, -1 do
        local entity = Entities[i]

        local is_on_belt, belt_index = on_belt(entity)
        entity.on_belt = is_on_belt
        if is_on_belt and belt_index ~= nil then
            entity.dx = belts[belt_index].dx
        else
            entity.dx = 0
        end


        -- dragging
        if inside_entity(entity) and mouse_clicked("left") then
            entity.x = mouse.x - 6
            entity.y = mouse.y - 6

            dragging = true
            entity_selected = entity.id

            del(Entities, entity)
            add(Entities, entity)

            mouse.mode = 2
            break
        else
            dragging = false
            entity_selected = nil

            if inside_area(entity.x + 7, entity.y + 7) then
                del(Entities, entity)
                add_explosion(entity.x + 7, entity.y + 7)
            elseif is_on_belt and (entity.x < 0 or entity.x > 112) then
                del(Entities, entity)
            else
                entity.x = entity.x + entity.dx
            end
        end
    end
end

function draw_entities()
    for entity in all(Entities) do
        spr(entity.sprite, entity.x, entity.y, 2, 2)
    end
end

function add_entity(dangerous)
    entity_id_counter = entity_id_counter + 1

    local index = flr(rnd(#belts)) + 1
    local belt = belts[index]

    -- random sprite based on dangerous (true or false)
    local sprite =  (flr(rnd(2)) + 1) == 1
    and dangerous_sprites[flr(rnd(#dangerous_sprites)) + 1]
    or safe_sprites[flr(rnd(#safe_sprites)) + 1]

    add(Entities, {
        id = entity_id_counter,
        x = belt.flipped and 112 or 0,
        y = belt.y - 3 + flr(rnd(3)),
        dx = 0,
        dy = 0,
        sprite = sprite,
        safe = safe,
        on_belt = nil
    }
    )
end

function inside_entity(entity)
    if (mouse.x > entity.x and mouse.y > entity.y)
        and (mouse.x < entity.x + size and mouse.y < entity.y + size) then
        mouse.mode = 3
        return true
    end

    return false
end

function spawn_entities()
    if spawn_delay <= 0 and not dragging then
        add_entity()
        spawn_delay = framerate / entity_spawn_rate
    else
        spawn_delay = spawn_delay - 1
    end
end
