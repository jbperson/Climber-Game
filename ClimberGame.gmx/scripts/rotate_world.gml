// This script rotates all objects around rot god when keys are held

if(keyboard_check(ord('D')))
{
    rotate_paths_clockwise()
     
    obj_world_initialize_god.current_world_x -= ROTATION_SPEED * pi * WORLD_RADIUS / 180 // account for world rotation in world location variables
    if (obj_world_initialize_god.l_travel_distance != -1000)
        obj_world_initialize_god.l_travel_distance -= ROTATION_SPEED * pi * WORLD_RADIUS / 180
    if (obj_world_initialize_god.r_travel_distance != -1000)
        obj_world_initialize_god.r_travel_distance += ROTATION_SPEED * pi * WORLD_RADIUS / 180
        
    build_new_platforms_left_check()
}
if(keyboard_check(ord('A')))
{
    rotate_paths_counterclockwise()
    
    obj_world_initialize_god.current_world_x += ROTATION_SPEED * pi * WORLD_RADIUS / 180 // account for world rotation in world location variables
    
    if (obj_world_initialize_god.l_travel_distance != -1000)
        obj_world_initialize_god.l_travel_distance += ROTATION_SPEED * pi * WORLD_RADIUS / 180
    if (obj_world_initialize_god.r_travel_distance != -1000)
        obj_world_initialize_god.r_travel_distance -= ROTATION_SPEED * pi * WORLD_RADIUS / 180

    build_new_platforms_right_check()
}
/*with(obj_player)
{
    if(changed_paths)
    {
//        show_message("CHANGED")
    
        for(j = 0 ; j < path_get_number(movement_path) ; j++)
        {
            path_change_point(movement_path,j,path_get_point_x(movement_path,j),path_get_point_y(movement_path,j),100)
        }
    
        temp_pos = path_position
        temp_speed = path_speed
        path_end()
        path_start(movement_path,path_speed,2,true)
        path_position = temp_pos
        
    //    show_message("POS: " + string(x) + "," + string(y))
    }
}*/
