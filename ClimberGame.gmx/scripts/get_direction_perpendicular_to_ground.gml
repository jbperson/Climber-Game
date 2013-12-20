// This function returns the direction that is perpendicular to the ground the player is currently standing on. If there is no ground near the player,
//  the function returns 0 and displays the message "Error: no ground nearby"
// This function should ONLY be called while the player is locked to a path

//Previous condition: place_meeting(x+lengthdir_x(4,direction+90),y+lengthdir_y(4,direction+90)
// Second previous condition: collision_circle(x+lengthdir_x(8,direction+90),y+lengthdir_y(8,direction+90),16,obj_block_parent,true,true)

if (movement_path != global.world_path)
{
    return(( point_direction(path_get_x(movement_path,path_position),path_get_y(movement_path,path_position),path_get_x(movement_path,path_position + 1/path_get_length(movement_path)),path_get_y(movement_path,path_position + 1/path_get_length(movement_path))) + 270) % 360)
    
    /*if (collision_circle(x+lengthdir_x(8,direction+90),y+lengthdir_y(8,direction+90),16,obj_block_parent,true,true))
        return (direction - 90) % 360
    else if(collision_circle(x+lengthdir_x(8,direction-90),y+lengthdir_y(8,direction-90),16,obj_block_parent,true,true))
        return (direction + 90) % 360
    else
    {
        return 0
    }*/
}
else
{
    return point_direction(obj_world_initialize_god.world_center_x,obj_world_initialize_god.world_center_y,x,y)
}
//collision_circle(x+lengthdir_x(4,direction-90),y+lengthdir_y(4,direction-90),15,obj_block_parent,true,true) != noone
