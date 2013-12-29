// This function looks up its associated_zone object in the zone_list map, then constructs a block list for its own platform and adds it to that zone_list.
// 

associated_zone = collision_point(x,y,obj_zone_parent,true,true)

zone_list_to_add_to = ds_map_find_value(global.zone_list_map,associated_zone)

block_list = ds_list_create()
global.temp_list = block_list
global.temp_zone_id = associated_zone
global.temp_rotate = point_direction(associated_zone.x,associated_zone.y,x,y) - 90
global.temp_starter_id = self.id

ds_list_add(block_list,global.temp_rotate) // add rotation angle to block list at index 0

start_block = collision_point(x,y,obj_block_path_point_parent,true,true)    //  try a normal path
if start_block == noone
    start_block = collision_point(x,y,obj_block_path_point_climb_parent,true,true) // if no normal path found, try a climb path
if start_block == noone
    start_block = collision_point(x,y,obj_bad_block_parent,true,true) // if no climb path found, try a bad block    

with (start_block)
{
    event_perform(ev_other,ev_user1)
    if (object_is_ancestor(self.object_index,obj_bad_block_parent))
        add_next_bad_block_to_list(global.temp_list,self.id)    //  bad block call code is different
    else
        add_next_path_point_to_list(global.temp_list,global.temp_starter_id,global.temp_rotate)
}

ds_list_add(zone_list_to_add_to,block_list)
