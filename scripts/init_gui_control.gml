/**
Inititate GUI and Player Variables
**/

no_players = 4


gamepads = ds_list_create()
available_gamepads = ds_list_create()


bottom_player_y = 608
bottom_player_x = 150


outline_color = c_black
fill_color = c_gray

current_player_status_width = 300
current_player_status_height = 200

next_player_status_width = 200
next_player_status_height = 200

next_player_padding = 50

/**
Temporary Item Control Structures
**/
item_list = ds_list_create()

temp_item = ds_map_create()

ds_map_add(temp_item,"name","Uber Slayer Sword")
ds_map_add(temp_item,"dmg",5)
ds_map_add(temp_item,"type",0)

temp_item2 = ds_map_create()

ds_map_add(temp_item2,"name","Exalted Shield of The Kitten Slayer")
ds_map_add(temp_item2,"dmg",1)
ds_map_add(temp_item2,"type",1)

temp_item3 = ds_map_create()

ds_map_add(temp_item3,"name","Cursed Wad of Gum")
ds_map_add(temp_item3,"dmg",-4)
ds_map_add(temp_item3,"type",2)

ds_list_add(item_list,temp_item)
ds_list_add(item_list,temp_item2)
ds_list_add(item_list,temp_item3)

/**

Create and Spawn Player(s)?

**/

plyr_list = ds_list_create()
spawn_point_x = (room_width/2)+32
spawn_point_y = (room_height/2)-32



plyr_colors[0] = c_white
plyr_colors[1] = c_red
plyr_colors[2] = c_orange
plyr_colors[3] = c_yellow

for (i = 0; i < no_players; i++) {
    temp = instance_create(spawn_point_x +  i*64,spawn_point_y,obj_temp_player);
    temp.plyr_color = plyr_colors[i]
    temp.plyr_id = i
   
    ds_list_add(temp.plyr_items,temp_item)
    ds_list_add(temp.plyr_items,temp_item2)
    
    temp.needs_update = true
    ds_list_add(plyr_list,temp)
    
}


current_player_turn = 0//First player
current_player = ds_list_find_value(plyr_list,current_player_turn)
current_player.is_turn = true
ds_list_add(current_player.plyr_items,temp_item3)

is_showing_item_gui = false

