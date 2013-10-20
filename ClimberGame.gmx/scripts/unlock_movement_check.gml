// Checks if there is a collision with a walkable block below the player. If not, unlock player movement.
// Uses a buffer room of 8 for seeing if to start falling

/*if (!(collision_line(x-16,y-16,x-16,y-24  ,obj_block_parent,true,true)  ||
    collision_line(x-16,y+16,x-16,y+8   ,obj_block_parent,true,true)  ||
    collision_line(x+16,y-16,x+16,y-24  ,obj_block_parent,true,true)  ||
    collision_line(x+16,y+16,x+16,y+8   ,obj_block_parent,true,true)    )) */

temp_ground_direction = get_direction_perpendicular_to_ground()

    //  --> previous condition : "!place_meeting(x,y+8,obj_block_parent)"
if ( temp_ground_direction >= 180 && temp_ground_direction <= 360 && !movement_climbable_surface)
{
    //show_message("tempground:")
    //show_message(temp_ground_direction)
    //show_message("direction")
    //show_message(direction)
    path_position -= path_speed/path_get_length(movement_path)
    show_message("unlocking")
    movement_locked = false
    tempspeed = abs(path_speed)
    tempdirection = previous_direction   //  store speed and direction to reset it. Use previous direction in case you just walked off of a cliff
    path_end()
    
    if (tempspeed != 0)
    {
        speed = tempspeed
        direction = tempdirection
    }
    else
    {
        speed = .01
        direction = 270
    }                           //  If speed is 0, then start falling down at an unimportant pace. This is necessary so that if contact is made on a 
                                //  vertical cliff, the player won't jump back to the top.
                                       
    movement_climbable_surface = false
    movement_currently_climbing = false //  stop climbing
                                
    sprite_index = spr_player_circle
    
    y += 2
    vspeed += 1
}
