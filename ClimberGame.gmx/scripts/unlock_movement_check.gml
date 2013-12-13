// By using the standardized directionality of paths (that is, all floors go from right to left and ceilings to left to right, etc), this function unlocks
// player movement if the player is on an upside down portion of the path

temp_ground_direction = get_direction_perpendicular_to_ground()

    //  --> previous condition : "!place_meeting(x,y+8,obj_block_parent)"
if ( temp_ground_direction >= 180 && temp_ground_direction <= 360 && !movement_climbable_surface)
{

    path_position -= path_move_speed/path_get_length(movement_path) // return to previous position in case you just rounded a corner; ie you slid off a ledge with a turn into a ceiling

    movement_locked = false
    tempspeed = abs(path_move_speed)
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
