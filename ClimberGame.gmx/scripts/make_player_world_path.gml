// This path alters the world path. Argument 0 specifies whether to start the path or not
    
    storePathSpeed = path_move_speed
    
    path_end()
        
    should_be_x = obj_world_initialize_god.world_center_x + lengthdir_x(WORLD_RADIUS + 16, point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,x,y))
    should_be_y = obj_world_initialize_god.world_center_y + lengthdir_y(WORLD_RADIUS + 16, point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,x,y))
    
    path_change_point(global.world_path,2,
                        x+lengthdir_x(10,point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,should_be_x,should_be_y) + 90 + ((180 * world_path_length)/(WORLD_RADIUS + 16))),
                        y+lengthdir_y(10,point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,should_be_x,should_be_y) + 90 + ((180 * world_path_length)/(WORLD_RADIUS + 16))),
                        100)

    path_change_point(global.world_path,1,should_be_x,should_be_y,100)
                        
    path_change_point(global.world_path,0,
                        x+lengthdir_x(10,point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,should_be_x,should_be_y) - 90 - ((180 * world_path_length)/(WORLD_RADIUS + 16))),
                        y+lengthdir_y(10,point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,should_be_x,should_be_y) - 90 - ((180 * world_path_length)/(WORLD_RADIUS + 16))),
                        100) // we ensure that the start of the path is on the right to remain consistent with the other paths
    
   // show_message(" : " + string(should_be_x) + "," + string(should_be_y))
   // show_message("pos : " + string(x) + "," + string(y))
                        
    if (argument0 == 1)
    {
        x = should_be_x
        y = should_be_y
        
        movement_path = global.world_path
        path_start(global.world_path,0,2,true)
    
        path_position = .25
    }
