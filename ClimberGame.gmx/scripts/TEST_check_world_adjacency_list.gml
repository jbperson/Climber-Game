// this script dislays some messages about the world adjacency list

show_message("index " + string(global.world_adjacency_path_list_current_index))
show_message("size " + string(ds_list_size(global.world_adjacency_path_list)))
show_message("Left x: " + string(ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,0),0)))
show_message("left path: " + string(ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,0),2)))
