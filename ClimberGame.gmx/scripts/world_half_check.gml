// This method checks if we need to add a new world piece.

if(obj_world_initialize_god.world_half_travel_distance < 0) // if we're less than the current half
{  
    obj_world_initialize_god.world_half_travel_distance %= floor(WORLD_RADIUS * pi)
    obj_world_initialize_god.world_piece_index-- // decrement this index
    with(obj_world_initialize_god.right_world_half)
        instance_destroy()
        obj_world_initialize_god.right_world_half = obj_world_initialize_god.left_world_half
        
    var temp_world_piece_index = 0
    
    while(ds_list_find_value(ds_list_find_value(global.world_piece_list,temp_world_piece_index),0) <= obj_world_initialize_god.world_piece_index)
    {
        if(ds_list_find_value(ds_list_find_value(global.world_piece_list,temp_world_piece_index),0) == obj_world_initialize_god.world_piece_index)
        {
            obj_world_initialize_god.left_world_half = instance_create(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,ds_list_find_value(ds_list_find_value(global.world_piece_list,temp_world_piece_index),1))
            obj_world_initialize_god.left_world_half.image_angle = obj_world_initialize_god.right_world_half.image_angle - 180
            exit // make block and exit script
        }
        else
        {
            temp_world_piece_index++ // increment the position in the list we're checking
        }
    } // while the list check index is smaller than the actual index
        
    obj_world_initialize_god.left_world_half = instance_create(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,obj_world_half)
    obj_world_initialize_god.left_world_half.image_angle = obj_world_initialize_god.right_world_half.image_angle - 180
}
else if(obj_world_initialize_god.world_half_travel_distance > floor(WORLD_RADIUS * pi)) // if we're less than the current half
{  
    obj_world_initialize_god.world_half_travel_distance %= floor(WORLD_RADIUS * pi)
    obj_world_initialize_god.world_piece_index++ // increment this index
    with(obj_world_initialize_god.left_world_half)
        instance_destroy()
    obj_world_initialize_god.left_world_half = obj_world_initialize_god.right_world_half
    
    var temp_world_piece_index = 0
    
    while((ds_list_find_value(ds_list_find_value(global.world_piece_list,temp_world_piece_index),0) <= obj_world_initialize_god.world_piece_index + 1)
            &&
            obj_world_initialize_god.world_piece_index + 1 <= ds_list_find_value(ds_list_find_value(global.world_piece_list,ds_list_size(global.world_piece_list)+1),0))
    {
        if(ds_list_find_value(ds_list_find_value(global.world_piece_list,temp_world_piece_index),0) == obj_world_initialize_god.world_piece_index + 1)
        {   
            obj_world_initialize_god.right_world_half = instance_create(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,ds_list_find_value(ds_list_find_value(global.world_piece_list,temp_world_piece_index),1))
            obj_world_initialize_god.right_world_half.image_angle = obj_world_initialize_god.left_world_half.image_angle - 180
            exit // make block and exit script
        }
        else
        {
            temp_world_piece_index++ // increment the position in the list we're checking
        }
    } // while the list check index is smaller than the actual index
    
    obj_world_initialize_god.right_world_half = instance_create(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,obj_world_half)
    obj_world_initialize_god.right_world_half.image_angle = obj_world_initialize_god.left_world_half.image_angle + 180
}
