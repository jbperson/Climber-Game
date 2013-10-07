// This function causes the player to jump away from the current wall it is holding onto, with direction slightly skewed upward.

sprite_index = spr_player_circle    // use collision circle to ensure no corner collisions
movement_locked = false //   unlock movement
movement_climbable_surface = false
movement_currently_climbing = false //  turn off climbing
tempspeed = abs(path_speed)
tempdirection = direction   //  store speed and direction to reset it
path_end()

speed = tempspeed
direction = tempdirection

held_key = 0

motion_add(get_direction_perpendicular_to_ground(), ((7 - jump_timer) / 7 * 4) + .5)   //  since jump timer starts at 7, this just uses it as a charge-up variable for jump distance, the max jump speed you can add being 4
