// This function will use the variable next_path_point_direction in order to find the next path_point_block

test_x = x
test_y = y

test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)

while (test_next_block == noone)
{
    test_x += lengthdir_x(16,next_path_point_direction)
    test_y += lengthdir_y(16,next_path_point_direction)
    
    test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)
    
    if (test_x > 50000 || test_y > 50000) // replace this with a better clause
    {
        exit
    }
}

with(test_next_block)
{
    event_perform(ev_other,ev_user0)
}
