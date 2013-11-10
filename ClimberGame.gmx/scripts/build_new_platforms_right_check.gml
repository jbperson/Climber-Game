// This script is called as the current_world_x increases. It checks whether to add platforms on the right and destroy platforms on the left

if (r_travel_distance <= 0 && r_travel_distance != -1000) // add new platforms to right side
{
    ds_list_add(global.in_world_platform_list,ds_list_find_value(global.right_platform_list,0)) // add zone to the new list

    global.temp_path_list_position = ds_list_size(global.path_list) // set the new position to start adding to to the end of the list
    number_of_paths_made = make_block_lists_from_zone_list(ds_list_find_value(global.in_world_platform_list,ds_list_size(global.in_world_platform_list) -  1)) // create platforms
    ds_list_delete(global.right_platform_list,0) // and delete the entry from the right platform list
    if(ds_list_size(global.right_platform_list) != 0)
        r_travel_distance = ds_list_find_value(ds_list_find_value(global.right_platform_list,0),0) - (current_world_x + (pi*WORLD_RADIUS)) // and reset right travel distance
    else // there are no more platforms to the right
        r_travel_distance = -1000 // so set to sentinel
    ds_list_add(global.path_destroy_list,number_of_paths_made)
}

if (ds_list_size(global.in_world_platform_list) != 0 && ds_list_find_value(ds_list_find_value(global.in_world_platform_list,0),0) < current_world_x - (pi * WORLD_RADIUS))
{
    destroy_in_world_platforms_from_zone_list(ds_list_find_value(global.in_world_platform_list,0))
    ds_list_add(global.left_platform_list,ds_list_find_value(global.in_world_platform_list,0))
    ds_list_delete(global.in_world_platform_list,0)
    
    destroy_n_paths_from_start_of_path_list(ds_list_find_value(global.path_destroy_list,0))
    ds_list_delete(global.path_destroy_list,0)
    
    l_travel_distance = (current_world_x - (pi*WORLD_RADIUS)) - ds_list_find_value(ds_list_find_value(global.left_platform_list,ds_list_size(global.left_platform_list)-1),0)
    /*if (ds_list_size(global.in_world_platform_list) != 0)
        l_travel_distance = ds_list_find_value(ds_list_find_value(global.left_platform_list,ds_list_size(global.left_platform_list)-1),2) - (ds_list_find_value(ds_list_find_value(global.in_world_platform_list,0),0) - (current_world_x - (pi * WORLD_RADIUS)))// get distance to travel left until reaching next platform. The '2' is where that data is stored in a zone list
    else
        l_travel_distance = ds_list_find_value(ds_list_find_value(global.left_platform_list,ds_list_size(global.left_platform_list)-1),2) - (ds_list_find_value(ds_list_find_value(global.right_platform_list,0),0) - (current_world_x - (pi * WORLD_RADIUS)))// get distance to travel left until reaching next platform. The '2' is where that data is stored in a zone list
    */
} // destroy left side platforms
