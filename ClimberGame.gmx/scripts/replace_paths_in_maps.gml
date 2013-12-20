// this script takes two paths as parameters and replaces all instances of the first path in the keys of path maps with the second given path
// ARGUMENT0 : path to replace
// ARGUMENT1 : new path id

if(ds_map_exists(global.path_map_next,argument0))
{
    replacement_value = ds_map_find_value(global.path_map_next,argument0)
    ds_map_add(global.path_map_next,argument1,replacement_value)
    ds_map_delete(global.path_map_next,argument0)
}

if(ds_map_exists(global.path_map_prev,argument0))
{
    replacement_value = ds_map_find_value(global.path_map_prev,argument0)
    ds_map_add(global.path_map_prev,argument1,replacement_value)
    ds_map_delete(global.path_map_prev,argument0)
}
