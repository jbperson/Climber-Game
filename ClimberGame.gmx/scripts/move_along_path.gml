// This script moves the player along the path according to their and sets the variable held_key to the key they were holding when changing directions
// The function returns 1 if the player switched paths, 0 if they did not.
returnvalue = 0

if (!keyboard_check(held_key))
{
    if (keyboard_check(vk_left))
    {        
        path_speed = -(h_right_is_forward)

        if (keyboard_check(vk_space) && jump_timer == 0 && !movement_currently_climbing)
            path_speed *= 5 //  move faster if running
        else
            path_speed *= 3 //  move normally
    }
    if (keyboard_check(vk_right))
    {
        path_speed = (h_right_is_forward)

        if (keyboard_check(vk_space) && jump_timer == 0 && !movement_currently_climbing)
            path_speed *= 5
        else
            path_speed *= 3
    }
    if (keyboard_check(vk_down))
    {        
        path_speed = -(v_up_is_forward)

        if (keyboard_check(vk_space) && jump_timer == 0 && !movement_currently_climbing)
            path_speed *= 5 //  move faster if running
        else
            path_speed *= 3 //  move normally
    }
    if (keyboard_check(vk_up))
    {
        path_speed = (v_up_is_forward)

        if (keyboard_check(vk_space) && jump_timer == 0 && !movement_currently_climbing)
            path_speed *= 5
        else
            path_speed *= 3
    }
}   //  if held key is being pressed, continue motion. otherwise, do normal motion checks
else if (abs(path_speed) == 3 && keyboard_check(vk_space) && jump_timer == 0 && !movement_currently_climbing)
    path_speed *= 5/3   //  if you are using the held key and running
    
if (!(keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_right) || keyboard_check(vk_left))) // if no arrows are being pressed
{
    path_speed = 0
}

if(change_paths_check())    //  checks to see if we should switch onto the other path
        returnvalue = 1
        
if (keyboard_check_released(vk_anykey))
{
    if (keyboard_check_released(vk_right) && held_key = vk_right)
        held_key = 0
    if (keyboard_check_released(vk_left) && held_key = vk_left)
        held_key = 0
    if (keyboard_check_released(vk_up) && held_key = vk_up)
        held_key = 0
    if (keyboard_check_released(vk_down) && held_key = vk_down)
        held_key = 0
} // if a key has been released, see if it was the held_key. If so, held key = 0


if (direction != previous_direction || keyboard_check_released(vk_anykey))
{
    change_key_check()
}   //  if the direction changes, change keys

return returnvalue
