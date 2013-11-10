// This function will use the variable next_path_point_direction in order to find the next path_point_block
// This function modifies the associated path for the next block in the path. It's called when we need to append two paths together

//show_message("called")

test_x = x
test_y = y

test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)

modify_stack = ds_stack_create()

while (test_next_block == noone)
{
    test_x += lengthdir_x(16,next_path_point_direction)
    test_y += lengthdir_y(16,next_path_point_direction)
    
    ds_stack_push(modify_stack,test_x)
    ds_stack_push(modify_stack,test_y)
    
    test_next_block = collision_point(test_x,test_y,obj_block_path_point_parent,false,true)
    
    if (abs(test_x) > 25000 || abs(test_y) > 25000) // replace this with a better clause
    {
        ds_stack_destroy(modify_stack)
        exit
    }
}

while(!ds_stack_empty(modify_stack))
{
    modify_y = ds_stack_pop(modify_stack)
    modify_x = ds_stack_pop(modify_stack)
    
    modify_block = collision_point(modify_x,modify_y,obj_block,true,true)
    modify_block.associated_path = associated_path
}

ds_stack_destroy(modify_stack)

global.temp_associated_path = associated_path
global.temp_parent_block_list = parent_block_list

if(!object_is_ancestor(test_next_block.object_index,obj_block_path_point_WtC_parent))
{
    with(test_next_block)
    {
        associated_path = global.temp_associated_path

        modify_path_from_append_next_path_point_block()
    }
} // only do this if it isn't a transitory block
