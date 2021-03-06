// This function takes a list as argument0, a zone ID as argument1, and adds its own data to that list (object_index, x relative to zone, y relative to zone). It then calls the
// function for the next block in the path.

if(!placed_into_path)
{
    list_to_add_to = argument0

    zone_x = argument1.x
    zone_y = argument1.y  // the zone coordinates

    ds_list_add(list_to_add_to,self.object_index)           //  add your obj index to save the type of block to make
    ds_list_add(list_to_add_to,x - zone_x)                  //  the coordinates of block in relation to the zone
    ds_list_add(list_to_add_to,y - zone_y)      

    placed_into_path = true

    test_x = x
    test_y = y

    test_next_block = collision_point(test_x,test_y,obj_bad_block_parent,false,true)

    while (test_next_block == noone)      //  until we fin next block
    {

        test_x += lengthdir_x(16,next_path_point_direction)
        test_y += lengthdir_y(16,next_path_point_direction)
    
        test_next_block = collision_point(test_x,test_y,obj_bad_block_parent,false,true)
    
        if (abs(test_x) > 25000 || abs(test_y) > 25000) // replace this with a better clause
        {
            exit
        }
    }

    global.temp_list = list_to_add_to
    global.temp_zone_id = argument1         

    if test_next_block == noone
        test_next_block = test_next_block_climb

    with(test_next_block)
    {
        event_perform(ev_other,ev_user1)
        add_next_bad_block_to_list(global.temp_list,global.temp_zone_id)
    }
}
