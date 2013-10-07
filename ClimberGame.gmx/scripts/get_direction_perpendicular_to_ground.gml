// This function returns the direction that is perpendicular to the ground the player is currently standing on. If there is no ground near the player,
//  the function returns 0 and displays the message "Error: no ground nearby"
// This function should ONLY be called while the player is locked to a path

if (place_meeting(x+lengthdir_x(4,direction+90),y+lengthdir_y(4,direction+90),obj_block_parent))
    return (direction - 90) % 360
else if(place_meeting(x+lengthdir_x(4,direction-90),y+lengthdir_y(4,direction-90),obj_block_parent))
    return (direction + 90) % 360
else
{
    return 0
}

//collision_circle(x+lengthdir_x(4,direction-90),y+lengthdir_y(4,direction-90),15,obj_block_parent,true,true) != noone
