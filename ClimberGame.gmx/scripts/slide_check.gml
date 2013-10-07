// This script governs whether to prevent the player from controlling their movement.

temp_ground_direction = get_direction_perpendicular_to_ground()

if (!(temp_ground_direction < STEEPEST_WALKABLE_GRADE - 90 && temp_ground_direction > STEEPEST_WALKABLE_GRADE - 210))
{
    if (!movement_climbable_surface)
    {
        //show_message(temp_ground_direction)
        movement_controlled = false // unlock player movement if not on a climbable slope
    }
    else
        movement_currently_climbing = true  //  else, player is currently climbing
}
else
{
    change_key_check()

    movement_controlled = true // player must be able to be controlled, since there are still no collisions

    movement_currently_climbing = false // else, player cannot be climbing
}
