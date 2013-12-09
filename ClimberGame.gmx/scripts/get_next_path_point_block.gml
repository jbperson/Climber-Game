// This function will use the variable next_path_point_direction in order to find the next path_point_block

//show_message("called")

test_x = x
test_y = y

test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)

make_stack = ds_stack_create() // used to stack up coordinates of where to create block objects

//show_message(string(next_path_point_direction + image_angle))

while (test_next_block == noone)
{
    if(test_x != x && test_y != y)
    {
        ds_stack_push(make_stack,test_x)
        ds_stack_push(make_stack,test_y)
    }

    test_x += lengthdir_x(16,next_path_point_direction)
    test_y += lengthdir_y(16,next_path_point_direction)
    
    test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)
    
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
    
    new_block = instance_create(make_x,make_y,obj_block)
    new_block.associated_path = associated_path
    new_block.image_angle = image_angle
    new_block.parent_block_list = parent_block_list
}

ds_stack_destroy(make_stack)

global.temp_associated_path = associated_path
global.temp_parent_block_list = parent_block_list
if (collision_point(x,y,obj_world,true,true) != noone)
    global.temp_was_inside_world = true
else
    global.temp_was_inside_world = false

with(test_next_block)
{
    if(!placed_into_path)
        associated_path = global.temp_associated_path // only modify associated path if you haven't been put on a path before
    parent_block_list = global.temp_parent_block_list

    event_perform(ev_other,ev_user0)
}
