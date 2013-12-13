// This function jumps the player as they tap spacebar

if (!movement_currently_climbing && jump_timer > 0)
{
    sprite_index = spr_player_circle    // use collision circle to ensure no corner collisions
    movement_locked = false //   unlock movement
    movement_climbable_surface = false
    movement_currently_climbing = false //  turn off climbing
    tempspeed = abs(path_move_speed)
    tempdirection = get_path_direction()   //  store speed and direction to reset it
    //if (movement_path == obj_world.associated_path && keyboard_check(vk_left))
      //  tempdirection -= 180
    
    path_end()
    speed = tempspeed
    direction = tempdirection   
    show_message("Dir : " + string(tempdirection))

    vspeed -= 4
    y -= 4
    
    held_key = 0
}
else if (movement_currently_climbing)
{
    jump_from_climb()
}
