/***

Get Item Copy

arg1 = item_id

***/

item_to_copy = obj_gui.item_list[| argument0]
copied_item = ds_map_create()
ds_map_copy(copied_item,item_to_copy)

return copied_item
