/****

Add an item to the specified Player's inventory

arg0 = Player Index
arg1 = Item to add

*****/

plyr_target = obj_gui.plyr_list[| argument0]
item_add = ds_map_create()
ds_map_copy(item_add,argument1)


//Check for empty items
available_slot = -1
for (i = 0; i < ds_list_size(plyr_target.plyr_items); i++) {
    temp_a_item = plyr_target.plyr_items[| i]
    if (temp_a_item[? "type"] == 0) {
        available_slot = i
        break
    }    
}

if (available_slot != -1) {
    ds_list_replace(plyr_target.plyr_items,available_slot,item_add)
    
    plyr_target.plyr_attack = player_calc_stats(plyr_target)
    return true
}
return false
