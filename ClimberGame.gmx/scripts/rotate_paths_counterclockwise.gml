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

for (i = 0 ; i < ds_list_size(global.path_list) ; i++)
{
    change_path = ds_list_find_value(global.path_list,i)
    var j
    for(j = 0 ; j < path_get_number(change_path) ; j++)
    {
        pre_x = path_get_point_x(change_path,j) - obj_world_initialize_god.world_center_x
        pre_y = path_get_point_y(change_path,j) - obj_world_initialize_god.world_center_y //  treat rot_god center like an offset
    //    pre_cos = ROT_COS//cos(ROTATION_SPEED*2*pi/360)
  //      pre_sin = ROT_SIN//sin(ROTATION_SPEED*2*pi/360)
        path_change_point(ds_list_find_value(global.path_list,i),j,pre_x*ROT_COS - pre_y*-ROT_SIN + obj_world_initialize_god.world_center_x,pre_x*-ROT_SIN + pre_y*ROT_COS + obj_world_initialize_god.world_center_y,100)
    }
    //path_rotate(global.path_list[i],ROTATION_SPEED)
}

for(i = 0 ; i < ds_list_size(global.world_adjacency_path_list) ; i++) // modify adjacency path list
{
    pre_x = ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,i),0) - obj_world_initialize_god.world_center_x
    pre_y = ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,i),1) - obj_world_initialize_god.world_center_y
    ds_list_replace(ds_list_find_value(global.world_adjacency_path_list,i),0,pre_x*ROT_COS - pre_y*-ROT_SIN + obj_world_initialize_god.world_center_x)
    ds_list_replace(ds_list_find_value(global.world_adjacency_path_list,i),1,pre_x*-ROT_SIN + pre_y*ROT_COS + obj_world_initialize_god.world_center_y)    
}

with(obj_block_parent)
{
    image_angle += ROTATION_SPEED
    pre_x = x - obj_world_initialize_god.world_center_x
    pre_y = y - obj_world_initialize_god.world_center_y //  treat rot_god center like an offset
    pre_cos = ROT_COS//cos(ROTATION_SPEED*2*pi/360)
    pre_sin = -ROT_SIN//sin(ROTATION_SPEED*2*pi/360)
    x = pre_x*pre_cos - pre_y*pre_sin + obj_world_initialize_god.world_center_x
    y = pre_x*pre_sin + pre_y*pre_cos + obj_world_initialize_god.world_center_y
}

with(obj_player)
{
    if(movement_locked && movement_path != obj_world.associated_path)
    {
        image_angle += ROTATION_SPEED
        temp_position = path_position
        path_end()
        path_start(movement_path,0,2,true)
        path_position = temp_position
        if(keyboard_check(vk_right))
            path_position -= 3/path_get_length(movement_path)
        if(keyboard_check(vk_left))
            path_position += 3/path_get_length(movement_path)
    }
    else if (movement_locked) // else you're on the world
    {
        image_angle += ROTATION_SPEED
        pre_x = x - obj_world_initialize_god.world_center_x
        pre_y = y - obj_world_initialize_god.world_center_y //  treat rot_god center like an offset
        pre_cos = ROT_COS//cos(ROTATION_SPEED*2*pi/360)
        pre_sin = -ROT_SIN//sin(ROTATION_SPEED*2*pi/360)
        x = pre_x*pre_cos - pre_y*pre_sin + obj_world_initialize_god.world_center_x
        y = pre_x*pre_sin + pre_y*pre_cos + obj_world_initialize_god.world_center_y   
    }
}
