// This function jumps the player as they tap spacebar

if (!movement_currently_climbing && jump_timer > 0)
{
    sprite_index = spr_player_circle    // use collision circle to ensure no corner collisions
    movement_locked = false //   unlock movement
    movement_climbable_surface = false
    movement_currently_climbing = false //  turn off climbing
    tempspeed = abs(path_speed)
    tempdirection = direction   //  store speed and direction to reset it
    path_end()
    speed = tempspeed
    direction = tempdirection   
    vspeed -= 4
    y -= 4
    
    held_key = 0
}
else
    jump_from_climb()
