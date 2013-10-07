// This script checks to see if the player is going to hit a block in the next step as the player is falling. If so, it moves the player to the 
//          position along that block's path that it is closest to and locks the player.

tempblock = collision_rectangle(x+15+hspeed,y+15+vspeed,x-16+hspeed,y+16+vspeed,obj_block_parent,true,true) //  get instance id of potential block hit
if (tempblock != noone) // if the player would hit a block at the current moving speed
{
    new_path = tempblock.associated_path    //  get path of block you will collide with
}
