// This function creates the path_map_prev and path_map_next maps, which store the next and previous maps (or -1 for invalid paths) of all maps currently
// in-world

global.path_map_prev = ds_map_create()
ds_map_add(global.path_map_prev,test_path_0,test_climb_path_0)
ds_map_add(global.path_map_prev,test_climb_path_0,test_path_0)

global.path_map_next = ds_map_create()
ds_map_add(global.path_map_next,test_path_0,test_climb_path_0)
ds_map_add(global.path_map_next,test_climb_path_0,test_path_0)

global.path_map_climbable = ds_map_create()
ds_map_add(global.path_map_climbable,test_climb_path_0,1)

global.world_path_adjacency_list = ds_list_create() // this list says which paths are adjacent to the world path.

global.path_list = ds_list_create()
