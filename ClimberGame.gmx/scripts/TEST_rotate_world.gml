// This script rotates all objects around rot god when keys are held

if(keyboard_check(ord('D')))
{
    
    obj_world_initialize_god.current_world_x -= ROTATION_SPEED * pi * WORLD_RADIUS / 180 // account for world rotation in world location variables
    if (obj_world_initialize_god.l_travel_distance != -1000)
        obj_world_initialize_god.l_travel_distance -= ROTATION_SPEED * pi * WORLD_RADIUS / 180
    if (obj_world_initialize_god.r_travel_distance != -1000)
        obj_world_initialize_god.r_travel_distance += ROTATION_SPEED * pi * WORLD_RADIUS / 180
        
    build_new_platforms_left_check()
}
if(keyboard_check(ord('A')))
{
    obj_world_initialize_god.current_world_x += ROTATION_SPEED * pi * WORLD_RADIUS / 180 // account for world rotation in world location variables
    
    if (obj_world_initialize_god.l_travel_distance != -1000)
        obj_world_initialize_god.l_travel_distance += ROTATION_SPEED * pi * WORLD_RADIUS / 180
    if (obj_world_initialize_god.r_travel_distance != -1000)
        obj_world_initialize_god.r_travel_distance -= ROTATION_SPEED * pi * WORLD_RADIUS / 180

    build_new_platforms_right_check()
}
