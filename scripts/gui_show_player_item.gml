/***
    Show Player Item Script
    arg1 = Player Index   
    arg2 = Item Index
***/

plyr_ind= argument0
item_index = argument1

plyr_target = plyr_list[| plyr_ind]

panel_start_x =  room_width/2 -250
panel_start_y = bottom_player_y - 500

panel_width = room_width/4+200 + panel_start_x
panel_height = room_height/4-10 + panel_start_y

t_current_item = plyr_target.plyr_items[| item_index]

draw_set_alpha(0.75)
draw_roundrect_colour(panel_start_x,
                      panel_start_y,
                      panel_width,
                      panel_height,
                      c_gray,
                      c_gray,
                      c_black)
draw_set_alpha(1)




draw_set_font(tmp_fancy_font)

draw_roundrect_colour(panel_start_x+10,
                      panel_start_y+10,
                      panel_width-20,
                      panel_start_y+10 + string_height("Items"),
                      false,
                      c_white,
                      true)
draw_text((panel_start_x+(panel_width-panel_start_x)/2) - string_width("Item Info")/2,panel_start_y+10,"Item Info")


draw_set_font(tmp_font)
draw_sprite_ext(item_icons[t_current_item[? "type"]],0,panel_start_x+30,panel_start_y+90-32,4,4,0,c_white,1)
draw_rectangle_colour(panel_start_x+20,panel_start_y+90-42,panel_start_x+30+74,panel_start_y+90+42,c_white,c_white,c_white,c_white,true)

draw_set_font(temp_font2)
draw_text(panel_start_x+115,panel_start_y+80-32,"Name: " + t_current_item[? "name"])
draw_text(panel_start_x+115,panel_start_y+80-16,"Type: " + item_types[t_current_item[? "type"]])
draw_text(panel_start_x+115,panel_start_y+80,"ATK: " + string(t_current_item[? "dmg"]))
draw_text(panel_start_x+115,panel_start_y+80+16,"Grade: " + item_grades[t_current_item[? "grade"]])
draw_text(panel_start_x+5,panel_start_y+80+58,'"' + t_current_item[? "desc"] + '"')

