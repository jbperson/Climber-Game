// This function takes n as argument0 and removes n paths from the path_list, and then sets the count to be correct. As it deletes those paths, it also
// removes them from any maps they were on.

n = argument0

for(i = 0 ; i < n ; i++)
{
    path_to_destroy = ds_list_find_value(global.path_list,ds_list_size(global.path_list) - (1+i))
    if (ds_map_exists(global.path_map_climbable,path_to_destroy))
        ds_map_delete(global.path_map_climbable,path_to_destroy)
    if (ds_map_exists(global.path_map_next,path_to_destroy))
        ds_map_delete(global.path_map_next,path_to_destroy)
    if (ds_map_exists(global.path_map_prev,path_to_destroy))
        ds_map_delete(global.path_map_prev,path_to_destroy)
}

for(i = 0 ; i < n ; i++)
{
    path_delete(ds_list_find_value(global.path_list,ds_list_size(global.path_list)-1))
    ds_list_delete(global.path_list,ds_list_size(global.path_list) - 1)
}
