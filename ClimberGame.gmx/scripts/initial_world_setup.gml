// This code sets up the initial left, right and in world platform lists from global.worl_list. It then creates all the currently present blocks

global.left_platform_list = ds_list_create()
global.right_platform_list = ds_list_create()
global.in_world_platform_list = ds_list_create()
global.path_destroy_list = ds_list_create()

//current_check_x = ds_list_find_value(ds_list_find_value(global.world_list,0),0)

for(i = 0 ; i < ds_list_size(global.world_list) ; i++)
{
    current_check_x = ds_list_find_value(ds_list_find_value(global.world_list,i),0)
    //show_message("Current Check x: " + string(current_check_x))
    
    if (current_check_x < world_start_x - (pi * WORLD_RADIUS))
        ds_list_add(global.left_platform_list,ds_list_find_value(global.world_list,i))
    if (current_check_x >= world_start_x - (pi * WORLD_RADIUS) && current_check_x <= world_start_x + (pi*WORLD_RADIUS))
        ds_list_add(global.in_world_platform_list,ds_list_find_value(global.world_list,i))
    if (current_check_x > world_start_x + (pi * WORLD_RADIUS))
        ds_list_add(global.right_platform_list,ds_list_find_value(global.world_list,i))
}

global.temp_path_list_position = 0

for(i = 0 ; i < ds_list_size(global.in_world_platform_list) ; i++)
{
    temp_direction_destroy_path_count = make_block_lists_from_zone_list(ds_list_find_value(global.in_world_platform_list,i))
    
    ds_list_add(global.path_destroy_list,temp_direction_destroy_path_count) // add the number of paths to destroy to the path to destroy list
} // for each zone list in the world right now, create the platforms for it

if (ds_list_size(global.left_platform_list) != 0)
    l_travel_distance = ds_list_find_value(ds_list_find_value(global.left_platform_list,ds_list_size(global.left_platform_list)-1),2) - (ds_list_find_value(ds_list_find_value(global.in_world_platform_list,0),0) - (current_world_x - (pi * WORLD_RADIUS)))// get distance to travel left until reaching next platform. The '2' is where that data is stored in a zone list
else
    l_travel_distance = -1000 // -1000 is the sentinel value for being maximum far left.
    
if (ds_list_size(global.right_platform_list) != 0)
    r_travel_distance = ds_list_find_value(ds_list_find_value(global.in_world_platform_list,ds_list_size(global.in_world_platform_list) - 1),2) - ((current_world_x + (pi * WORLD_RADIUS)) - ds_list_find_value(ds_list_find_value(global.in_world_platform_list,ds_list_size(global.in_world_platform_list) - 1),0))// see above
else
    r_travel_distance = -1000 // see above
