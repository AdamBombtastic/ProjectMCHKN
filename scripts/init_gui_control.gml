/**
Inititate GUI and Player Variables
**/

no_players = 4


// Variables that handle gamepad/controller support
gamepads = ds_list_create()
available_gamepads = ds_list_create()

/** These variables control the player status objects and inventory views */
bottom_player_y = 608
bottom_player_x = 20

outline_color = c_black
fill_color = c_gray

current_player_status_width = 300
current_player_status_height = 500

next_player_status_width = 285
next_player_status_height = 500

next_player_padding = 25

//VERY HACKY, WILL BE CHANGED 
player_item_index[0] = 0
player_item_index[1] = 0
player_item_index[2] = 0
player_item_index[3] = 0


/**
Temporary Item Control Structures
**/
item_list = ds_list_create()

item_none = ds_map_create()

ds_map_add(item_none,"name","<____Empty____>")
ds_map_add(item_none,"dmg",0)
ds_map_add(item_none,"type",0)
ds_map_add(item_none,"grade",0)
ds_map_add(item_none,"desc","<____Empty____>")
ds_map_add(item_none,"value",0)

temp_item0 = ds_map_create()

ds_map_add(temp_item0,"name","Fisticuffs")
ds_map_add(temp_item0,"dmg",1)
ds_map_add(temp_item0,"type",1)
ds_map_add(temp_item0,"grade",1)
ds_map_add(temp_item0,"desc","A pair of wimpy fists, but it's better than having no hands.")
ds_map_add(temp_item0,"value",10)

temp_item = ds_map_create()

ds_map_add(temp_item,"name","Uber Slayer Sword")
ds_map_add(temp_item,"dmg",5)
ds_map_add(temp_item,"type",1)
ds_map_add(temp_item,"grade",5)
ds_map_add(temp_item,"desc","tHe MoSt 1337 swArD in ExIsTeNcE.")
ds_map_add(temp_item,"value",320)

temp_item2 = ds_map_create()

ds_map_add(temp_item2,"name","Shield of The Kitten Slayer")
ds_map_add(temp_item2,"dmg",1)
ds_map_add(temp_item2,"type",2)
ds_map_add(temp_item2,"grade",2)
ds_map_add(temp_item2,"desc","Some people can still hear the feeble meows calling for help.")
ds_map_add(temp_item2,"value",20)

temp_item3 = ds_map_create()

ds_map_add(temp_item3,"name","Cursed Wad of Gum")
ds_map_add(temp_item3,"dmg",-4)
ds_map_add(temp_item3,"type",3)
ds_map_add(temp_item3,"grade",4)
ds_map_add(temp_item3,"desc","Some ninnymuggins stuck this to your shoe. Curses!")
ds_map_add(temp_item3,"value",0)

temp_item4 = ds_map_create()

ds_map_add(temp_item4,"name","Small Health Potion")
ds_map_add(temp_item4,"dmg",10)
ds_map_add(temp_item4,"type",4)
ds_map_add(temp_item4,"grade",2)
ds_map_add(temp_item4,"desc","Drink this and SOME of the pain goes away.")
ds_map_add(temp_item4,"value",100)

ds_list_add(item_list,temp_item0)
ds_list_add(item_list,temp_item)
ds_list_add(item_list,temp_item2)
ds_list_add(item_list,temp_item3)
ds_list_add(item_list,temp_item4)

item_icons[0] = spr_item_none
item_icons[1] = tmp_sword
item_icons[2] = tmp_shld
item_icons[3] = tmp_curse
item_icons[4] = tmp_hp_pot

item_grades[0] = "?"
item_grades[1] = "F"
item_grades[2] = "D"
item_grades[3] = "C"
item_grades[4] = "B"
item_grades[5] = "A"
item_grades[6] = "S"

item_types[0] = "None"
item_types[1] = "Weapon"
item_types[2] = "Shield"
item_types[3] = "Curse"
item_types[4] = "Consumable"


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
   
    ds_list_add(temp.plyr_items,temp_item0)
    ds_list_add(temp.plyr_items,temp_item3)
    ds_list_add(temp.plyr_items,temp_item)
    ds_list_add(temp.plyr_items,temp_item2)
    ds_list_add(temp.plyr_items,item_none)
    //ds_list_add(temp.plyr_items,temp_item2)
    
    temp.needs_update = true
    ds_list_add(plyr_list,temp)
    
}


current_player_turn = 0//First player
current_player = ds_list_find_value(plyr_list,current_player_turn)
current_player.is_turn = true

//plyr_list[| 1].is_party = true
//plyr_list[| 2].is_enemy = true

//ds_list_add(current_player.plyr_items,temp_item3)

is_showing_item_gui = false
is_showing_junk_gui = false
is_showing_shop_gui = false

