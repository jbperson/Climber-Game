// This method sorts the world adjacency list in order of increasing x-value. 

for(i = 0 ; i < ds_list_size(global.world_adjacency_path_list) ; i++)
{
    var list_value = ds_list_find_value(global.world_adjacency_path_list,i)

    for(j = i - 1 ; j >= 0 ; j--)
    {
        if(ds_list_find_value(ds_list_find_value(global.world_adjacency_path_list,j),0) > ds_list_find_value(list_value,0))
        {
            ds_list_replace(global.world_adjacency_path_list,j+1,ds_list_find_value(global.world_adjacency_path_list,j))
        }
        else
            break
    }
    
    ds_list_replace(global.world_adjacency_path_list,j+1,list_value)
}
