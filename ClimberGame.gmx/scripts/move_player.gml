// This is the overall player movement function. It decides what sort of movement we should use and calls other methods that deal with those
// types of movement

if (movement_locked) // movement is locked if we are on a path, ie on the ground/climbing. We can be sliding, clmbing, or walking
{

    if (path_move_speed != 0)   //  rotate the image angle to reflect the move speed
        image_angle = direction
        
    // This is a temp fix until auto jump is handled better - makes sure you don't jump off of the face of the earth for no reason    
    if (movement_path == obj_world.associated_path && abs(direction - previous_direction) <= 10)
        previous_direction = direction

    if(place_meeting(x,y,obj_bad_block))
    {
        hit_bad_block_from_walk()
    } // if you hit a bad block
    else
    {
        if (movement_controlled) // used to contain  && !auto_jump_check()
        {           
        // Regulates Jumping
            if (keyboard_check_pressed(vk_space))   //  start jump timer
                jump_timer = 7
            else if (keyboard_check(vk_space) && jump_timer > 0) // decrement timer
                jump_timer -= 1
            if (keyboard_check_released(vk_space)) // if you released space, try to jump
            {
                jump_player()
            }
            
            if (movement_locked)
            {
                if (!move_along_path())   // Set path_move_speed based on current keyboard input. We don't actually update the path position until the end of this script
                {
                    slide_check()   // if the player did not switch paths, do the slide check.
                }
                auto_jump_check() // after setting the move speed, check to see if we would auto jump in next step
            }
        }
        else    //  else player is sliding, assure slidingness
        {
            slide_check()
    
            if (path_move_speed > 0 )
                path_move_speed += G_FORCE
            else if (path_move_speed < 0)
                path_move_speed -= G_FORCE
            else if (path_move_speed == 0)
            {
                if(direction%180 < 90)
                    path_move_speed -= G_FORCE * h_right_is_forward
                if(direction%180 > 90)
                    path_move_speed += G_FORCE * h_right_is_forward
            }
            
        }
    
        if (movement_locked)    //  need to check this after doing auto jump check
        {
            unlock_movement_check() // after moving, check to see if we should unlock movement for the next step.
      //  if(!movement_locked)
    //        show_message("unlocked")
        }
    } // else you didn't hit a bad block
}
else //else movement is unlocked
{
    
    if (vspeed < MAX_FALL_SPEED) //  fall down
    {
        if vspeed == 0
            y += 1
        vspeed += G_FORCE
    }
    
    if(place_meeting(x,y,obj_bad_block_parent))
    {
        hspeed *= -1
        vspeed *= -1 // inverse direction
        speed = 6 // set speed vector length to 6
    } // if you hit bad block
    else
    {   
        //temp_block_collided = collision_rectangle(x-15,y-16,x+16,y+16,obj_block_parent,true,true)
        temp_block_collided = collision_circle(x,y,16,obj_block_parent,true,true)
        
        if (temp_block_collided != noone && (temp_block_collided.object_index != obj_world || point_distance(obj_world.x,obj_world.y,x,y) <= WORLD_RADIUS + 16))
        {   
            if (temp_block_collided.object_index == obj_world){
                make_player_world_path(1)
                path_move_speed = 0
                set_current_world_adjacency_path_list_index() // sets the ccurrent world adjacency path list index to the proper place in the list
            }
            else
            {
                find_nearest_path_position(temp_block_collided.associated_path)
                movement_path = temp_block_collided.associated_path
            
                path_start(movement_path,0,2,true)
            
                x = new_path_point_x
                y = new_path_point_y  

                path_position = new_path_position
                direction = new_path_direction
            }
           
            speed = 0
    
            movement_locked = true
            movement_controlled = true       
        
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
    } // else you didn't hit bad block
}   //  if unlocked

// Change previous direction variable
if(movement_locked)
    previous_direction = get_path_direction()
else
 previous_direction = direction
previous_path_move_speed = path_move_speed

path_position += path_move_speed / path_get_length(movement_path)
