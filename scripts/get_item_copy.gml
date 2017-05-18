/***

Get Item Copy

arg1 = item

***/

item_to_copy = argument0
copied_item = ds_map_create()
ds_map_copy(copied_item,item_to_copy)

return copied_item
