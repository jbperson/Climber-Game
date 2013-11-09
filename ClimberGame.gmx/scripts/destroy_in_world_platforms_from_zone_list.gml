// This function takes a zone list as argument0 and destroys all platforms currently in the world associated with that zone

destroy_list = argument0

for (i = 3 ; i < ds_list_size(destroy_list) ; i++)
{
    global.destroy_block_list_check = ds_list_find_value(destroy_list,i)
    with(obj_block_parent)
    {
        if (parent_block_list == global.destroy_block_list_check)
        {
            instance_destroy()
            
        }
    }
}
