// If the player needs to autojump, will cause the player to autojump. Returns TRUE if the player has jumped, and FALSE if the player has not

check_value_signed = get_path_direction() - point_direction(path_get_x(movement_path,path_position),path_get_y(movement_path,path_position),path_get_x(movement_path,path_position + path_move_speed/path_get_length(movement_path)),path_get_y(movement_path,path_position + path_move_speed/path_get_length(movement_path)))
check_value = abs(check_value_signed)

if(path_move_speed != 0 && check_value > .1 && abs(check_value - 180) > .1) // If we turned but didn't just turn around
{
 //   show_message("triggered")   
    if (keyboard_check(vk_space) && !movement_currently_climbing) //  if the player is holding space
    {
        if ((keyboard_check(vk_right) && check_value_signed > 0) || (keyboard_check(vk_left) && check_value_signed < 0)) // if holding right and over a convex edge
        {
    //        show_message("jump")
            movement_locked = false
            tempspeed = abs(path_move_speed)
            tempdirection = get_path_direction()   //  store speed and direction to reset it
            path_end()
            
            speed = tempspeed
            direction = tempdirection
            
            vspeed -= 5
            
            x += hspeed
            y += vspeed
            
            movement_climbable_surface = false
            movement_currently_climbing = false //  stop climbing
            
            held_key = 0    //  turn off held key
            
            return true 
        } // For right-sided auto jump
    }
}

return false // if no jump occurred
