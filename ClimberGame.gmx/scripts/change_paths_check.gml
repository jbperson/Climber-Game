// This function decides whether the player should go from one path to an adjacent path and then does that switch if needed.
// This function returns 0 if no switch happened and 1 if it did.

if( !path_get_closed(movement_path) && movement_path != obj_world.associated_path)
{
    if ( (path_position + (path_speed/path_get_length(movement_path)) <= 0) && ds_map_find_value(global.path_map_prev,movement_path) != -1 )
    {
        show_message("trans 2")
        temp_path_speed = path_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_map_find_value(global.path_map_prev,movement_path)
        if(movement_path != obj_world.associated_path) // if you weren't moved onto the world 
        {
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
        }
        else // you were moved onto the world
        {
            make_player_world_path(1)
        }
        
        return 1
    }
    else if ( (path_position + (path_speed/path_get_length(movement_path)) >= 1) && ds_map_find_value(global.path_map_next,movement_path) != -1 )
    {
        show_message("trans")
        //show_message(path_position)
        
        temp_path_speed = path_speed
        temp_path_position = path_position
        temp_previous_path_id = movement_path
        path_end()
        movement_path = ds_map_find_value(global.path_map_next,movement_path)
        if(movement_path != obj_world.associated_path)
        {
            show_message("new path : " + string(movement_path))
            show_message("world path : " + string(obj_world.associated_path))
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
        }
        else
        {
            show_message("go to world")
            make_player_world_path(1) // else you are on the world
        }
        
        return 1
    }
}
else if(movement_path == obj_world.associated_path)
{
    //show_message(point_distance(x,y,ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),0),ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),1))) // if you'll be on the path in the next step
    
    if(path_speed > 0 && path_speed >= point_distance(x,y,ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index-1),0),ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index-1),1))) // if you'll be on the path in the next step
    {
        show_message("off world")
        temp_path_speed = path_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),2)
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
    if(path_speed < 0 && abs(path_speed) >= point_distance(x,y,ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),0),ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),1))) // if you'll be on the path in the next step
    {
        // temp var
        changed_paths = true;
        //show_message("off world negative")
        temp_path_speed = path_speed
        temp_path_position = path_position
        path_end()
        movement_path = ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index),2)
        //show_message("new path " + string(movement_path))
        path_start(movement_path,temp_path_speed,2,true)
        //path_position = (temp_path_position + (path_speed/path_get_length(movement_path))) % 1
        path_position = .99
 //       x = path_get_x(movement_path,path_position)
   //     y = path_get_y(movement_path,path_position)
   /*     show_message("coords: " )
        show_message(path_get_x(movement_path,path_position))
        show_message(path_get_y(movement_path,path_position))
        show_message(x)
        show_message(y) */
        //x = path_get_x(movement_path,path_position)
        //y = path_get_y(movement_path,path_position)
       // show_message(path_position)
        
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
     //       show_message("locked: " + string(movement_locked))
        }
        
      //  show_message("mov path: " + string(movement_path))
        
        return 1
    }
}

return 0
