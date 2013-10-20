// Start Player Controlled Movement Block

if (movement_locked)
{
    image_angle = direction
    if (movement_path == obj_world.associated_path && abs(direction - previous_direction) <= 10)
        previous_direction = direction

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
        
         
        /*if(jump_timer == 0 && keyboard_check(vk_space))
        {
            //show_message("pow")
            world_path_length = 5
        }
        else
            world_path_length = 3*/
    
        if (movement_locked)
            if (!move_along_path())
                slide_check()   // if the player did not switch paths, do the slide check.
            

    }
    else    //  else player is sliding
    {
        slide_check()
        
        //show_message(get_direction_perpendicular_to_ground())
    
        if (path_speed > 0 )
            path_speed += G_FORCE
        else if (path_speed < 0)
            path_speed -= G_FORCE
        else if (path_speed == 0)
        {
            if(direction%180 < 90)
                path_speed -= G_FORCE * h_right_is_forward
            if(direction%180 > 90)
                path_speed += G_FORCE * h_right_is_forward
        }
            
    }
    
    if (movement_locked)    //  need to check this after doing auto jump check
        unlock_movement_check() // after moving, check to see if we should unlock movement for the next step.
        
}
else //else movement is unlocked
{
    //show_message("unlocked step")
    
    if (vspeed < MAX_FALL_SPEED) //  fall down
    {
        if vspeed == 0
            y += 1
        vspeed += G_FORCE
    }
        
    temp_block_collided = collision_rectangle(x-15,y-16,x+16,y+16,obj_block_parent,true,true)

    if (temp_block_collided != noone && (temp_block_collided.object_index != obj_world || point_distance(obj_world.x,obj_world.y,x,y) <= WORLD_RADIUS + 16))
    {   
        if (temp_block_collided.object_index == obj_world){
            //show_message(point_distance(obj_world.x,obj_world.y,x,y))
            make_player_world_path(1)
            path_speed = 0
        }
        else
        {
            //show_message("hit")
            find_nearest_path_position(temp_block_collided.associated_path)
            movement_path = temp_block_collided.associated_path
           
           // show_message(new_path_point_x)
           // show_message(new_path_point_y)
             
              
            
            path_start(movement_path,.01,2,true)
            
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
            //show_message("being controlled")
            speed = 0
        }
        
        sprite_index = spr_player_block
        image_angle = direction
    }
}   //  if unlocked

// Change previous direction variable
previous_direction = direction
previous_path_speed = path_speed
