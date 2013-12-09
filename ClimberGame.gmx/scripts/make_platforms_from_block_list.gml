// Makes platforms from block list in the relevant place. Argument0 is the block list, argument1 is the zone_x, and argument2 is zone_y

make_list = argument0

make_zone_x = argument1
make_zone_y = argument2

zone_orientation_dir = 90 + ((180*(obj_world_initialize_god.current_world_x - make_zone_x)) / (pi * WORLD_RADIUS)) // get direction pointing towards zone center
zone_center_dist = WORLD_RADIUS + (obj_world_initialize_god.current_world_y - make_zone_y)

//show_message("Zone orientation: " + string(zone_orientation_dir)+"and dist: "+string(zone_center_dist))

// Make path starter obj at first instance in block
make_block_index = 0

make_block_temp_x = ds_list_find_value(make_list,make_block_index+1)
make_block_temp_y = ds_list_find_value(make_list,make_block_index+2)
    
make_block_dir = zone_orientation_dir + point_direction(0,0,make_block_temp_x,make_block_temp_y) - 90
m_block_x = lengthdir_x(zone_center_dist,zone_orientation_dir) + lengthdir_x(point_distance(0,0,make_block_temp_x,make_block_temp_y),make_block_dir) + obj_world_initialize_god.world_center_x
m_block_y = lengthdir_y(zone_center_dist,zone_orientation_dir) + lengthdir_y(point_distance(0,0,make_block_temp_x,make_block_temp_y),make_block_dir) + obj_world_initialize_god.world_center_y
  
make_path_starter = instance_create(m_block_x,m_block_y,obj_path_starter)  
make_path_starter.parent_block_list = make_list   

for(make_block_index = 0 ; make_block_index < ds_list_size(make_list) ; make_block_index += 3)
{
    make_block_temp_x = ds_list_find_value(make_list,make_block_index+1)
    make_block_temp_y = ds_list_find_value(make_list,make_block_index+2)

    //show_message("Making block temp x: " + string(make_block_temp_x) + " and y: " + string(make_block_temp_y))
        
    make_block_dir = zone_orientation_dir + point_direction(0,0,make_block_temp_x,make_block_temp_y) - 90
    m_block_x = lengthdir_x(zone_center_dist,zone_orientation_dir) + lengthdir_x(point_distance(0,0,make_block_temp_x,make_block_temp_y),make_block_dir) + obj_world_initialize_god.world_center_x
    m_block_y = lengthdir_y(zone_center_dist,zone_orientation_dir) + lengthdir_y(point_distance(0,0,make_block_temp_x,make_block_temp_y),make_block_dir) + obj_world_initialize_god.world_center_y
    
    //show_message("Block : dir: "+string(make_block_dir)+" dist: "+string(make_block_dist))
    
    make_block = instance_create(m_block_x,m_block_y,ds_list_find_value(make_list,make_block_index))    

    make_block.image_angle = zone_orientation_dir - 90 // fixes orientation
    make_block.parent_block_list = make_list // this variable is used when destroying blocks
} // for each block in the block list, create it

with(make_path_starter)
{
    event_perform(ev_other,ev_user0)
} // call path creation event for path starter
