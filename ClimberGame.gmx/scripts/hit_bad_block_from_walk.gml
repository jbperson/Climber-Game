// this method is called when the player hits a bad block while they are locked onto a path. It bounces the player in the direction opposite of the ground,
// unlocking their movement

    var bad_block_bounce_dir = get_direction_perpendicular_to_ground()

    movement_locked = false
    
    path_end()
    
    speed = 6
    direction = bad_block_bounce_dir
                                       
    movement_climbable_surface = false
    movement_currently_climbing = false //  stop climbing
                                
    sprite_index = spr_player_circle
    
