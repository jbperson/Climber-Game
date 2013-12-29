// Takes a list id as argument0 and shows the size and contents of the list. Argument1 is the print prefix for the list; it will be printed at the start
// of each message related to the list

var list_to_print = argument0
string print_prefix = argument1

show_message(print_prefix + " : " + string(ds_list_size(list_to_print)))

for(var i = 0 ; i < ds_list_size(list_to_print) ; i++)
{
    show_message(print_prefix + " : " + string(i) + " : " + string(ds_list_find_value(list_to_print,i)))
}
