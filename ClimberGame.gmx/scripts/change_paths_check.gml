// This function decides whether the player should go from one path to an adjacent path and then does that switch if needed.
// This function returns 0 if no switch happened and 1 if it did.

if( !path_get_closed(movement_path) && movement_path != obj_world.associated_path)
{
    if ( (path_position + (path_move_speed/path_get_length(movement_path)) <= 0) && ds_map_find_value(global.path_map_prev,movement_path) != -1 )
    {
        temp_path_move_speed = path_move_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_map_find_value(global.path_map_prev,movement_path)
        if(movement_path != obj_world.associated_path) // if you weren't moved onto the world 
        {
            path_start(movement_path,0,2,true)
            path_position = ( (temp_path_position + (temp_path_move_speed/path_get_length(movement_path))) ) % 1
            
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
        }
        else // you were moved onto the world
        {
            x = path_get_x(movement_path,0)
            y = path_get_y(movement_path,0)// go to start of path so we properly calculate location
            make_player_world_path(1)
            set_current_world_adjacency_path_list_index() // make sure the index for the world adjacency list is correct
        }
        
        return 1
    }
    else if ( (path_position + (path_move_speed/path_get_length(movement_path)) >= 1) && ds_map_find_value(global.path_map_next,movement_path) != -1 )
    {
        temp_path_position = path_position
        temp_previous_path_id = movement_path
        path_end()
        movement_path = ds_map_find_value(global.path_map_next,movement_path)

        if(movement_path != obj_world.associated_path) // if we're not moving onto the world now
        {
            path_start(movement_path,0,2,true)
            path_position = (temp_path_position + (path_move_speed/path_get_length(movement_path))) % 1
            if (path_position > .5) // if you're too close to the end of the path, ie you didnt cross the end
                path_position = 0   //  just go to the start
        
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
        }
        else
        {
           // show_message("go to world")
           x = path_get_x(temp_previous_path_id,1)
           y = path_get_y(temp_previous_path_id,1) // go to the very end of the path so that we properly calculate your location
           show_message("pos : " + string(x) + "," + string(y))
           make_player_world_path(0) // else you are on the world
           set_current_world_adjacency_path_list_index() // make sure the index for the world adjacency list is correct
        }
        
        return 1
    }
}
else if(movement_path == obj_world.associated_path) // else we are currently on the world
{
    //show_message(point_distance(x,y,ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),0),ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),1))) // if you'll be on the path in the next step
    
    if(path_move_speed > 0 && path_move_speed >= point_distance(x,y,ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index-1),0),ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index-1),1))) // if you'll be on the path in the next step
    {
        temp_path_move_speed = path_move_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index-1),2)
        path_start(movement_path,0,2,true)
        path_position = 0 + ((abs(temp_path_move_speed) - point_distance(x,y,path_get_x(movement_path,1),path_get_y(movement_path,1))) / path_get_length(movement_path))
        
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
    if(path_move_speed < 0 && abs(path_move_speed) >= point_distance(x,y,ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),0),ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),1))) // if you'll be on the path in the next step
    {
        temp_path_move_speed = path_move_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),2)
        path_start(movement_path,0,2,true)
        path_position = 1 - ((abs(temp_path_move_speed) - point_distance(x,y,path_get_x(movement_path,1),path_get_y(movement_path,1))) / path_get_length(movement_path))
        
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
} // if you were on the world

return 0
