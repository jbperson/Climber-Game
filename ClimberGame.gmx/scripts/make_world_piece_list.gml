// This method is called in the setup room and assembles the world_piece list from world pieces in the room. Each entry in the list is a list with two values
// , the first of which is an integer N, where N * WORLD_RADIUS * PI = the world piece's x, and the second value is the ID of the world piece object

global.world_piece_list = ds_list_create()

global.world_piece_sort_list = ds_list_create()


with(obj_world_parent)
{   
    added_to_list = false

    for (i = 0 ; i < ds_list_size(global.world_piece_sort_list) ; i++)
    {
        if(x < ds_list_find_value(global.world_piece_sort_list,i).x)
        {
            ds_list_insert(global.world_piece_sort_list,i,id)
            i = ds_list_size(global.world_piece_sort_list)
            added_to_list = true
        }
    }
    
    if(!added_to_list)
        ds_list_insert(global.world_piece_sort_list,ds_list_size(global.world_piece_sort_list),id)
}   //  add world pieces to list and sort them

for(i = 0 ; i < ds_list_size(global.world_piece_sort_list) ; i++)
{
    temp_world_piece_list = ds_list_create()
    
    ds_list_add(temp_world_piece_list,ds_list_find_value(global.world_piece_sort_list,i).x / floor(WORLD_RADIUS * pi)) // add position 
    ds_list_add(temp_world_piece_list,(ds_list_find_value(global.world_piece_sort_list,i).object_index)) // add object id
    
    ds_list_add(global.world_piece_list,temp_world_piece_list) // add piece data to world piece list
}// for each world piece, add it's data to the world piece list
