// This function creates the path_map_prev and path_map_next maps, which store the next and previous maps (or -1 for invalid paths) of all maps currently
// in-world

global.path_map_prev = ds_map_create()
ds_map_add(global.path_map_prev,test_path_3,test_climb_path_2)
ds_map_add(global.path_map_prev,test_climb_path_2,test_path_3)

global.path_map_next = ds_map_create()
ds_map_add(global.path_map_next,test_path_3,test_climb_path_2)
ds_map_add(global.path_map_next,test_climb_path_2,test_path_3)

global.path_map_climbable = ds_map_create()
ds_map_add(global.path_map_climbable,test_climb_path_2,1)
ds_map_add(global.path_map_climbable,test_climb_path_1,1)
ds_map_add(global.path_map_climbable,test_climb_path_3,1)
ds_map_add(global.path_map_climbable,test_climb_path_4,1)
ds_map_add(global.path_map_climbable,test_climb_path_5,1)

var global.path_list[0] = test_path_3
    global.path_list[1] = test_climb_path_1
    global.path_list[2] = test_climb_path_2
    global.path_list[3] = obj_world.associated_path
    global.path_list[4] = test_climb_path_3
    global.path_list[5] = test_climb_path_4
    global.path_list[6] = test_path_4
    global.path_list[7] = test_path_5
    global.path_list[8] = test_climb_path_5
    global.path_list[9] = test_path_6
   // global.path_list[1] = test_climb_path_0
var global.path_list_count = 10
