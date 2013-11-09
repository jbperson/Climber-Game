// This function decides whether the player should go from one path to an adjacent path and then does that switch if needed.
// This function returns 0 if no switch happened and 1 if it did.

if( !path_get_closed(movement_path) )
{
    if ( (path_position + (path_speed/path_get_length(movement_path)) <= 0) && ds_map_find_value(global.path_map_prev,movement_path) != -1 )
    {
        show_message("trans 2")
        temp_path_speed = path_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_map_find_value(global.path_map_prev,movement_path)
        path_start(movement_path,temp_path_speed,2,true)
        path_position = ( (temp_path_position + (temp_path_speed/path_get_length(movement_path))) ) % 1
            
        if (ds_map_find_value(global.path_map_climbable,movement_path))
        {
            movement_climbable_surface = 1
            slide_check()
        }
        else
        {
            movement_currently_climbing = 0
            movement_climbable_surface = 0
            
            slide_check()
        }
        
        return 1
    }
    else if ( (path_position + (path_speed/path_get_length(movement_path)) >= 1) && ds_map_find_value(global.path_map_next,movement_path) != -1 )
    {
        show_message("trans")
        //show_message(path_position)
        
        temp_path_speed = path_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_map_find_value(global.path_map_next,movement_path)
        path_start(movement_path,temp_path_speed,2,true)
        path_position = (temp_path_position + (path_speed/path_get_length(movement_path))) % 1
        if (path_position > .5) // if you're too close to the end of the path, ie you didnt cross the end
            path_position = 0   //  just go to the start
        //show_message(path_position)
        
        if (ds_map_find_value(global.path_map_climbable,movement_path))
        {
            movement_climbable_surface = 1
            slide_check()
        }
        else
        {  
            movement_currently_climbing = 0
            movement_climbable_surface = 0
            
            slide_check()
        }
        
        return 1
    }
}

return 0
