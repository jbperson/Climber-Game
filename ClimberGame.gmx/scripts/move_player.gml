// Start Player Controlled Movement Block

if (movement_locked)
{

    if (path_move_speed != 0)
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
            if (!move_along_path())   // IN HERE
            {

                slide_check()   // if the player did not switch paths, do the slide check.
            }
           // else
         //       show_message("NEW move path : " + string(movement_path)

    }
    else    //  else player is sliding
    {
        slide_check()
        
        //show_message(get_direction_perpendicular_to_ground())
    
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

    // BEFORE
    
    if (movement_locked)    //  need to check this after doing auto jump check
    {
        unlock_movement_check() // after moving, check to see if we should unlock movement for the next step.
        if(!movement_locked)
            show_message("unlocked")
    }
        

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
            show_message("on world")
            make_player_world_path(1)
            path_move_speed = 0
            set_current_world_adjacency_path_list_index() // sets the ccurrent world adjacency path list index to the proper place in the list
        }
        else
        {
            find_nearest_path_position(temp_block_collided.associated_path)
            movement_path = temp_block_collided.associated_path
           
           // show_message(new_path_point_x)
           // show_message(new_path_point_y) 
            
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
            //show_message("being controlled")
            speed = 0
        }
        
        sprite_index = spr_player_block
        image_angle = direction
    }
}   //  if unlocked

// Change previous direction variable
previous_direction = direction
previous_path_move_speed = path_move_speed

path_position += path_move_speed / path_get_length(movement_path)
