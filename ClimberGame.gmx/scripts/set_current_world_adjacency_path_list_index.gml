// This script should be called when the player touches the world. It finds the place in the world adjacency path list where the player is currently located.

global.world_adjacency_path_list_current_index = 0 // set indx to zero

temp_list_id = ds_list_find_value(global.world_adjacency_path_list,global.world_adjacency_path_list_current_index)

while(abs(((point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,obj_player.x,obj_player.y) + 90) % 360 )- (point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,ds_list_find_value(temp_list_id,0),ds_list_find_value(temp_list_id,1)) + 90 % 360)) > .001
        &&
        (point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,obj_player.x,obj_player.y) + 90) % 360 < (point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,ds_list_find_value(temp_list_id,0),ds_list_find_value(temp_list_id,1)) + 90 % 360))
{
 //   show_message(" end of p path : " + string(path_get_x(obj_player.movement_path,1)) + "," + string(path_get_y(obj_player.movement_path,1)))
 //   show_message("possss : " + string(obj_player.x) + "," + string(obj_player.y))
   // show_message(" in list : " + string(ds_list_find_value(temp_list_id,0)) + "," + string(ds_list_find_value(temp_list_id,1)))
 //   show_message("dir 1 : " + string((point_direction(obj_world.x,obj_world.y,obj_player.x,obj_player.y) + 90) % 360))
   // show_message("dir 2 : " + string((point_direction(obj_world.x,obj_world.y,ds_list_find_value(temp_list_id,0),ds_list_find_value(temp_list_id,1)) + 90 % 360)))
   // show_message("loop")
    if(global.world_adjacency_path_list_current_index == ds_list_size(global.world_adjacency_path_list) - 1) // if at end of list
    {
        global.world_adjacency_path_list_current_index++ // increment
        break // leave loop
    }
    else // else there's more in the list
        temp_list_id = ds_list_find_value(global.world_adjacency_path_list,++global.world_adjacency_path_list_current_index) // increment and check next list
} // once we're out of this loop, we should have the index in the appropriate place
