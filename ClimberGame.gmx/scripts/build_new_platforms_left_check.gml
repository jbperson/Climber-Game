// This script is called as the current_world_x increases. It checks whether to add platforms on the right and destroy platforms on the left

if (l_travel_distance <= 0 && l_travel_distance != -1000) // add new platforms to right side
{
    ds_list_insert(global.in_world_platform_list,0,ds_list_find_value(global.left_platform_list,ds_list_size(global.left_platform_list)-1)) // add zone to the new list

    global.temp_path_list_position = 0
    number_of_paths_made = make_block_lists_from_zone_list(ds_list_find_value(global.in_world_platform_list,0)) // create platforms
    ds_list_delete(global.left_platform_list,ds_list_size(global.left_platform_list)-1) // and delete the entry from the left platform list
    
    if (ds_list_size(global.left_platform_list) != 0)
        l_travel_distance += ds_list_find_value(ds_list_find_value(global.left_platform_list,ds_list_size(global.left_platform_list) - 1),2) // and reset left travel distance
    else
        l_travel_distance = -1000 // else set to sentinel
    ds_list_insert(global.path_destroy_list,0,number_of_paths_made) // insert number of paths made to path destroy list
}

if (ds_list_size(global.in_world_platform_list) != 0 && ds_list_find_value(ds_list_find_value(global.in_world_platform_list,ds_list_size(global.in_world_platform_list)-1),0) > current_world_x + (pi * WORLD_RADIUS))
{
    destroy_in_world_platforms_from_zone_list(ds_list_find_value(global.in_world_platform_list,ds_list_size(global.in_world_platform_list)-1))
    ds_list_insert(global.right_platform_list,0,ds_list_find_value(global.in_world_platform_list,0))
    ds_list_delete(global.in_world_platform_list,ds_list_size(global.in_world_platform_list)-1)
    
    destroy_n_paths_from_end_of_path_list(ds_list_find_value(global.path_destroy_list,ds_list_size(global.path_destroy_list)-1))
    ds_list_delete(global.path_destroy_list,ds_list_size(global.path_destroy_list)-1)
    
    r_travel_distance = ds_list_find_value(ds_list_find_value(global.in_world_platform_list,ds_list_size(global.in_world_platform_list)-1),2) - (ds_list_find_value(ds_list_find_value(global.right_platform_list,0),0) - (current_world_x + (pi * WORLD_RADIUS)))// get distance to travel left until reaching next platform. The '2' is where that data is stored in a zone lis
} // destroy right side platforms
