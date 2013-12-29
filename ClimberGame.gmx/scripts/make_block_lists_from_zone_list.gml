// This script takes a zone list as argument0 and, for every block list in the zone list, calls the block list create code.
// The script returns the number of paths that it made

make_zone_list = argument0

mrk_zone_x = ds_list_find_value(make_zone_list,0)
mrk_zone_y = ds_list_find_value(make_zone_list,1)   //  named as such to avoid problems with called code

global.temp_destroy_path_count = 0 // Reset the number of paths to return. This number is incremented in the path starter and path type switch objects

for(index = 3 ; index < ds_list_size(make_zone_list) ; index++)
{
    make_platforms_from_block_list(ds_list_find_value(make_zone_list,index),mrk_zone_x,mrk_zone_y)
}

sort_world_adjacency_list()

return global.temp_destroy_path_count
