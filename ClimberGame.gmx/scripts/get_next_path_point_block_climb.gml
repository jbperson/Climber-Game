// This function will use the variable next_path_point_direction in order to find the next path_point_block_climb

show_message("2")

test_x = x + lengthdir_x(16,next_path_point_direction)
test_y = y + lengthdir_x(16,next_path_point_direction)

test_next_block = collision_point(test_x,test_y,obj_block_path_point_climb_parent,false,true)

show_message("3")

while (test_next_block == noone)
{
    test_x += lengthdir_x(16,next_path_point_direction)
    test_y += lengthdir_y(16,next_path_point_direction)
    
    test_next_block = collision_point(test_x,test_y,obj_block_path_point_climb_parent,false,true) 
    
    if (abs(test_x) > 50000 || abs(test_y) > 50000) // replace this with a better clause
    {
        show_message("6")
        exit
    }
}

with(test_next_block)
{
    show_message("7")

    associated_path = global.temp_associated_path

    event_perform(ev_other,ev_user0)
    
    show_message("8")
}
