/****

Temporary Upgrade Solution

arg0 = Item
arg1 = Gold

*****/

upgraded_item = ds_map_create()
ds_map_copy(upgraded_item,argument0)

bonus = argument1

upgraded_item[? "dmg"] = upgraded_item[? "dmg"] + floor(random(bonus)/200) + ceil(random(2)+1)
upgraded_item[? "grade"] += 1 
upgraded_item[? "name"] += "+" 
return upgraded_item
