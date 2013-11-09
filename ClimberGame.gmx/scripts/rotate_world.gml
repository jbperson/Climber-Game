// This script rotates all objects around rot god when keys are held

if(keyboard_check(ord('D')))
{
    rotate_paths_clockwise()
    
    obj_world_initialize_god.current_world_x -= ROTATION_SPEED * pi * WORLD_RADIUS / 180 // account for world rotation in world location variables
    obj_world_initialize_god.l_travel_distance -= ROTATION_SPEED * pi * WORLD_RADIUS / 180
    obj_world_initialize_god.r_travel_distance += ROTATION_SPEED * pi * WORLD_RADIUS / 180
}
if(keyboard_check(ord('A')))
{
    rotate_paths_counterclockwise()
    
    obj_world_initialize_god.current_world_x += ROTATION_SPEED * pi * WORLD_RADIUS / 180 // account for world rotation in world location variables
    obj_world_initialize_god.l_travel_distance += ROTATION_SPEED * pi * WORLD_RADIUS / 180
    obj_world_initialize_god.r_travel_distance -= ROTATION_SPEED * pi * WORLD_RADIUS / 180
}
