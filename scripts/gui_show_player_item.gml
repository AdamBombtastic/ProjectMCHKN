/***
    Show Player Item Script
    arg1 = Player    
***/

plyr_target = argument0

panel_start_x =  room_width/4
panel_start_y = room_height/4

panel_width = room_width/2-10 + panel_start_x
panel_height = room_height/2-10 + panel_start_y



draw_set_alpha(0.5)
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
draw_text(panel_width/2+string_width("Items"),panel_start_y+10,"Items")

draw_set_font(tmp_font)


for (j = 0; j < ds_list_size(plyr_target.plyr_items); j++) {
    item = ds_list_find_value(plyr_target.plyr_items,j)
    text = item[? "name"]
    str_height = string_height("ATK")
    
    draw_sprite(item_icons[item[? "type"]],0,panel_start_x+10,panel_start_y+50 + (j*str_height)+ 2)
    draw_text(panel_start_x+36,panel_start_y+50 + (j*str_height),text)
    if (item[? "dmg"] > 0) {
        draw_text(panel_start_x+panel_width/2,panel_start_y+50 + (j*str_height)+2,"ATK: +" + string(item[? "dmg"]))
    }
    else {
         draw_text(panel_start_x+panel_width/2,panel_start_y+50 + (j*str_height)+2,"ATK: " + string(item[? "dmg"]))
    }
    /*
    Might use the rectangle. . . might not
    draw_roundrect_colour(panel_start_x+10,
                      panel_start_y+50 + (i*str_height),
                      panel_width-20,
                      panel_start_y+50 + (i*str_height) + str_height,
                      false,
                      c_white,
                      true
                      )*/

}

