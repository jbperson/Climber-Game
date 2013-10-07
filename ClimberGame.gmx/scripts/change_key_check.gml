// This function tries to determine which keys should activate movement
    if (path_get_x(movement_path,(path_position + 1/path_get_length(movement_path))%1) > x)
        h_right_is_forward = 1  // if right is forward along the path
    else if (path_get_x(movement_path,(path_position + 1/path_get_length(movement_path))%1) < x)
        h_right_is_forward = -1  //  if left is forward along the path
    else
        h_right_is_forward = 0  // if the path is vertical
    
    if (movement_currently_climbing)
    {
        if (path_get_y(movement_path,(path_position + 1/path_get_length(movement_path))%1) > y)
            v_up_is_forward = -1 //  if up is forward
        else if (path_get_y(movement_path,(path_position + 1/path_get_length(movement_path))%1) < y)
            v_up_is_forward = 1 // if down is forward
        else
            v_up_is_forward = 0 // if the path is horizontal
    } // only do check if you are currently climbing
    else
        v_up_is_forward = 0 //  else set this to 0
        
    if keyboard_check(vk_left)
        held_key = vk_left
    if keyboard_check(vk_right)
        held_key = vk_right
    if keyboard_check(vk_down)
        held_key = vk_down
    if keyboard_check(vk_up)
        held_key = vk_up
