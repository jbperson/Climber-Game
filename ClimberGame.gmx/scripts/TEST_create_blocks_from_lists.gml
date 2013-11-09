for(i = 0 ; i < ds_list_size(global.world_list) ; i++)
{
    zone_list = ds_list_find_value(global.world_list,i)
    
    zone_x = ds_list_find_value(zone_list,0)
    zone_y = ds_list_find_value(zone_list,1)
    
    show_message("zone number:" + string(i))
    show_message("zone_x: " + string(zone_x))
    show_message("zone_y: " + string(zone_y))
    
    for (j = 3 ; j < ds_list_size(zone_list) ; j++)
    {
        block_list = ds_list_find_value(zone_list,j)
        
        for(k = 0 ; k < ds_list_size(block_list) ; k += 3)
        {
            block_to_create_type = ds_list_find_value(block_list,k)
            block_to_create_x = ds_list_find_value(block_list,k+1) + zone_x
            block_to_create_y = ds_list_find_value(block_list,k+2) + zone_y
            
            instance_create(block_to_create_x,block_to_create_y,block_to_create_type)
        }
    }
}
