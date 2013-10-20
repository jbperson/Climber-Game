// This  script rotates all the paths around the rot_god in a clockwise direction.

/*with(obj_player)
{
    if(movement_locked)
    {
        image_angle += ROTATION_SPEED
        dir = point_direction(obj_rot_god.x,obj_rot_god.y,x,y)
        dist = point_distance(obj_rot_god.x,obj_rot_god.y,x,y)
        dir += ROTATION_SPEED
        x = obj_rot_god.x + lengthdir_x(dist,dir)
        y = obj_rot_god.y + lengthdir_y(dist,dir)
    }
}*/

/*for(i = 0 ; i < global.path_list_count ; i++)
{
    for(j = 0 ; j < path_get_number(global.path_list[i]) ; j++)
    {
        x_point = path_get_point_x(global.path_list[i],j)
        y_point = path_get_point_y(global.path_list[i],j)
        dist = point_distance(obj_rot_god.x,obj_rot_god.y,x_point,y_point)
        dir = point_direction(obj_rot_god.x,obj_rot_god.y,x_point,y_point) + ROTATION_SPEED
        path_change_point(global.path_list[i],j,obj_rot_god.x + lengthdir_x(dist,dir),obj_rot_god.y + lengthdir_y(dist,dir),100)
    }
}

with(obj_block_parent)
{
    image_angle += ROTATION_SPEED
    dir = point_direction(obj_rot_god.x,obj_rot_god.y,x,y)
    dist = point_distance(obj_rot_god.x,obj_rot_god.y,x,y)
    dir += ROTATION_SPEED
    x = obj_rot_god.x + lengthdir_x(dist,dir)
    y = obj_rot_god.y + lengthdir_y(dist,dir)
}*/

for (i = 0 ; i < global.path_list_count ; i++)
{
    change_path = global.path_list[i]
    var j
    for(j = 0 ; j < path_get_number(change_path) ; j++)
    {
        pre_x = path_get_point_x(change_path,j) - obj_rot_god.x
        pre_y = path_get_point_y(change_path,j) - obj_rot_god.y //  treat rot_god center like an offset
        pre_cos = ROT_COS//cos(ROTATION_SPEED*2*pi/360)
        pre_sin = ROT_SIN//sin(ROTATION_SPEED*2*pi/360)
        path_change_point(global.path_list[i],j,pre_x*pre_cos - pre_y*(-pre_sin) + obj_rot_god.x,pre_x*(-pre_sin) + pre_y*pre_cos + obj_rot_god.y,100)
    }
    //path_rotate(global.path_list[i],ROTATION_SPEED)
}

with(obj_block_parent)
{
    image_angle += ROTATION_SPEED
    pre_x = x - obj_rot_god.x
    pre_y = y - obj_rot_god.y //  treat rot_god center like an offset
    pre_cos = ROT_COS//cos(ROTATION_SPEED*2*pi/360)
    pre_sin = -ROT_SIN//sin(ROTATION_SPEED*2*pi/360)
    x = pre_x*pre_cos - pre_y*pre_sin + obj_rot_god.x
    y = pre_x*pre_sin + pre_y*pre_cos + obj_rot_god.y
}

with(obj_player)
{
    if(movement_locked && movement_path != obj_world.associated_path)
    {
        temp_position = path_position
        temp_speed = path_speed
        path_end()
        path_start(movement_path,temp_speed,2,true)
        path_position = temp_position
    }
    else if (movement_locked)
    {
        image_angle -= ROTATION_SPEED
        pre_x = x - obj_rot_god.x
        pre_y = y - obj_rot_god.y //  treat rot_god center like an offset
        pre_cos = ROT_COS//cos(ROTATION_SPEED*2*pi/360)
        pre_sin = -ROT_SIN//sin(ROTATION_SPEED*2*pi/360)
        x = pre_x*pre_cos - pre_y*pre_sin + obj_rot_god.x
        y = pre_x*pre_sin + pre_y*pre_cos + obj_rot_god.y    
    }
}
