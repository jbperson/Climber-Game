// This function takes a list as argument0, a zone ID as argument1, and adds its own data to that list (object_index, x relative to zone, y relative to zone). It then calls the
// function for the next block in the path. argument2 is the rotate angle

list_to_add_to = argument0

zone_x = argument1.x
zone_y = argument1.y  // the zone coordinates
zone_rotate = argument2 // how much we want to rotate the block around the start point
//show_message("zone rot: " + string(zone_rotate))

ds_list_add(list_to_add_to,self.object_index)           //  add your obj index to save the type of block to make

zone_to_self_vector_dir = point_direction(zone_x,zone_y,x,y) + zone_rotate
zone_to_self_vector_len = point_distance(zone_x,zone_y,x,y)

ds_list_add(list_to_add_to,lengthdir_x(zone_to_self_vector_len,zone_to_self_vector_dir))                  //  the coordinates of block in relation to the zone
ds_list_add(list_to_add_to,lengthdir_y(zone_to_self_vector_len,zone_to_self_vector_dir))      

placed_into_path = true

if(object_is_ancestor(self.object_index,obj_block_path_point_end_parent)) // if this is an end block
    exit

test_x = x
test_y = y

test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)
test_next_block_climb = collision_point(test_x,test_y,obj_block_path_point_climb_parent,false,true)        

while (test_next_block == noone && test_next_block_climb == noone)      //  until we fin next block
{

    test_x += lengthdir_x(16,next_path_point_direction)
    test_y += lengthdir_y(16,next_path_point_direction)
    
    test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)
    test_next_block_climb = collision_point(test_x,test_y,obj_block_path_point_climb_parent,false,true)
    
    if (abs(test_x) > 25000 || abs(test_y) > 25000) // replace this with a better clause
    {
        exit
    }
}

global.temp_list = list_to_add_to
global.temp_zone_id = argument1         
global.temp_rotate = argument2

if test_next_block == noone
    test_next_block = test_next_block_climb

with(test_next_block)
{
    if(!placed_into_path)
    {
        event_perform(ev_other,ev_user1)
        add_next_path_point_to_list(global.temp_list,global.temp_zone_id,global.temp_rotate)
    } // if next block hasn't been added to path.
}
