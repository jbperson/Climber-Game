// This function looks up its associated_zone object in the zone_list map, then constructs a block list for its own platform and adds it to that zone_list.
// 

associated_zone = collision_point(x,y,obj_zone_parent,true,true)

zone_list_to_add_to = ds_map_find_value(global.zone_list_map,associated_zone)

//show_message("Adding block list to zone list")

block_list = ds_list_create()
global.temp_list = block_list
global.temp_zone_id = associated_zone

start_block = collision_point(x,y,obj_block_path_point_parent,true,true)
if start_block == noone
    start_block = collision_point(x,y,obj_block_path_point_climb_parent,true,true)
    
with (start_block)
{
    event_perform(ev_other,ev_user1)
    add_next_path_point_to_list(global.temp_list,global.temp_zone_id)
}

ds_list_add(zone_list_to_add_to,block_list)
