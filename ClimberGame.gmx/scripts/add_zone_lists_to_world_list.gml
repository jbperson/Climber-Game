global.world_list = ds_list_create()

global.zone_sort_list = ds_list_create()

global.zone_list_map = ds_map_create()

with(obj_zone_parent)
{   
    added_to_list = false

    for (i = 0 ; i < ds_list_size(global.zone_sort_list) ; i++)
    {
        if(x < ds_list_find_value(global.zone_sort_list,i).x)
        {
            ds_list_insert(global.zone_sort_list,i,id)
            i = ds_list_size(global.zone_sort_list)
            added_to_list = true
        }
    }
    
    if(!added_to_list)
        ds_list_insert(global.zone_sort_list,ds_list_size(global.zone_sort_list),id)
}   //  add zones to sort list and sort them

for(i = 0 ; i < ds_list_size(global.zone_sort_list) ; i++)
{
    temp_zone = ds_list_find_value(global.zone_sort_list,i)
    zone_list_to_add = ds_list_create()
    ds_list_add(zone_list_to_add,temp_zone.x)
    ds_list_add(zone_list_to_add,temp_zone.y)   // add coordinates
    if (i+1 != ds_list_size(global.zone_sort_list))
        ds_list_add(zone_list_to_add, ds_list_find_value(global.zone_sort_list,i+1).x - x)  //  if not end of list, add h_dist to next zone
    else
        ds_list_add(zone_list_to_add, -1)   //  else add sentinel value

    ds_map_add(global.zone_list_map,temp_zone,zone_list_to_add) // add self list to map
    ds_list_add(global.world_list,zone_list_to_add) //  add self list to world list
} // for each zone, make its zone list

with(obj_path_starter)
    add_block_to_zone_list()    //  for every path starter, add its block to zone list
  
global.player_start_x = obj_player_start.x
global.player_start_y = obj_player_start.y
      
//show_message(ds_list_size(global.world_list))
