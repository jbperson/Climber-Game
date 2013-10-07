// Start Player Controlled Movement Block
if (movement_locked)
{
    image_angle = direction

    if (movement_controlled && !auto_jump_check())
    {       
    // Regulates Jumping
        if (keyboard_check_pressed(vk_space))
            jump_timer = 7
        else if (keyboard_check(vk_space) && jump_timer > 0)
            jump_timer -= 1
        if (keyboard_check_released(vk_space))
        {
            jump_player()
        }
    
        if (!move_along_path())
            slide_check()   // if the player did not switch paths, do the slide check.
            

    }
    else    //  else player is sliding
    {
        slide_check()
    
        if (path_speed > 0 )
            path_speed += G_FORCE
        else if (path_speed < 0)
            path_speed -= G_FORCE
            
    }
    
    if (movement_locked)    //  need to check this after doing auto jump check
        unlock_movement_check() // after moving, check to see if we should unlock movement for the next step.
        
}
else //else movement is unlocked
{
    
    if (vspeed < MAX_FALL_SPEED) //  fall down
    {
        if vspeed == 0
            y += 1
        vspeed += G_FORCE
    }
        
    temp_block_collided = collision_rectangle(x-16,y-16,x+16,y+16,obj_block_parent,true,true)

    if (temp_block_collided != noone)
    {   
        find_nearest_path_position(temp_block_collided.associated_path)
           
        speed = 0
    
        movement_locked = true
        movement_controlled = true
        
        movement_path = temp_block_collided.associated_path
        
        path_start(movement_path,.01,2,true)
        x = new_path_point_x
        y = new_path_point_y
              
        path_position = new_path_position
        direction = new_path_direction
        
        if (object_is_ancestor(temp_block_collided.object_index,obj_climb_block_parent))
            movement_climbable_surface = true   //  if you landed on a climbable surface, set climbable surface to true
        
        slide_check()
        if (movement_controlled)
        {
            speed = 0
        }
        
        sprite_index = spr_player_block
        image_angle = direction
    }
}   //  if unlocked

// Change previous direction variable
previous_direction = direction
previous_path_speed = path_speed
