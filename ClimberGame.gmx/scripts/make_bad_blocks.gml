// This function makes new bad blocks and then either calls the same code in the next bad block it hits or, if the direction it was checking is the 
// opposite of the direction of the block it hits, it will end the code

test_x = x
test_y = y

test_next_block = collision_point(test_x,test_y,obj_bad_block_parent,false,true)

make_stack = ds_stack_create() // used to stack up coordinates of where to create block objects

while (test_next_block == noone)
{
    if(test_x != x && test_y != y)
    {
        ds_stack_push(make_stack,test_x)
        ds_stack_push(make_stack,test_y)
    }

    test_x += lengthdir_x(16,next_path_point_direction)
    test_y += lengthdir_y(16,next_path_point_direction)
    
    test_next_block = collision_point(test_x,test_y,obj_bad_block_parent,false,true)
    
    if (abs(test_x) > 25000 || abs(test_y) > 25000) // replace this with a better clause
    {
        ds_stack_destroy(make_stack)
        exit
    }
}

while(!ds_stack_empty(make_stack))
{
    make_y = ds_stack_pop(make_stack)
    make_x = ds_stack_pop(make_stack)
    
    new_block = instance_create(make_x,make_y,obj_bad_block)
    new_block.image_angle = image_angle
    new_block.parent_block_list = parent_block_list
}

ds_stack_destroy(make_stack)

global.comp_dir = next_path_point_direction

with(test_next_block)
{
    event_perform(ev_other,ev_user0)
} // call this event in next block
