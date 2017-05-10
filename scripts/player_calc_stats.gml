/****

Calculate the Player's Stats

arg0 = Player

****/

target_player = argument0

total_atk = target_player.plyr_lvl

for (i = 0; i < ds_list_size(target_player.plyr_items); i++) {
    t_item = target_player.plyr_items[| i]
    total_atk += t_item[? "dmg"]
    
}

return total_atk
