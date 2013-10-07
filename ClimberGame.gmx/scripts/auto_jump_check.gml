// If the player needs to autojump, will cause the player to autojump. Returns TRUE if the player has jumped, and FALSE if the player has not

if (direction != previous_direction)
{

    if (direction % 180 != previous_direction % 180 && keyboard_check(vk_space) && jump_timer != 7) //  if the player is holding spaces but didn't just jump and didn't just turn around
    {
        if (keyboard_check(vk_right) && (((direction + 90) % 360) < ((previous_direction + 90) % 360)))
        {
            movement_locked = false
            tempspeed = abs(previous_path_speed)
            tempdirection = previous_direction   //  store speed and direction to reset it
            path_end()
            
            speed = tempspeed
            direction = tempdirection
            
            x = xprevious
            y = yprevious
            
            vspeed -= 5
            
            x += hspeed
            y += vspeed
            
            movement_climbable_surface = false
            movement_currently_climbing = false //  stop climbing
            
            held_key = 0    //  turn off held key
            
            return true
        } // For right-sided auto jump
        
        if (keyboard_check(vk_left) && (((direction) % 360) > ((previous_direction) % 360)))
        {
            movement_locked = false
            tempspeed = abs(previous_path_speed)
            tempdirection = previous_direction   //  store speed and direction to reset it
            path_end()
            
            speed = tempspeed
            direction = tempdirection
            
            x = xprevious
            y = yprevious
            
            vspeed -= 5
            
            x += hspeed
            y += vspeed
            
            movement_climbable_surface = false
            movement_currently_climbing = false //  stop climbing
            
            held_key = 0 // turn of held key
            
            return true
        } // for left auto jump
    }
}

return false // if no jump occurred
