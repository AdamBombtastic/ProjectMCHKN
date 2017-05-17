/***
    Shop Shop Script
***/

//plyr_ind= argument0
//item_index = argument1

plyr_target = obj_gui.current_player



panel_width = (room_width/2)-20
panel_height = (room_height/2)-20

panel_start_x =  10 + room_width/4 
panel_start_y = room_height/2 - panel_height/2


//t_current_item = plyr_target.plyr_items[| item_index]

draw_set_alpha(0.75)
draw_roundrect_colour(panel_start_x,
                      panel_start_y,
                      panel_start_x + panel_width,
                      panel_start_y + panel_height,
                      panel_color,
                      panel_color,
                      c_black)
draw_set_alpha(1)

/** The title **/
draw_set_font(tmp_fancy_font)

draw_roundrect_colour(panel_start_x+10,
                      panel_start_y+10,
                      panel_width+panel_start_x-20,
                      panel_start_y+10 + string_height("Items"),
                      false,
                      c_white,
                      true)
draw_text((panel_start_x+(panel_width)/2) - string_width("Shop")/2,panel_start_y+10,"Shop")

/** Shop Menu Options **/

if (shop_h_index == 0) {
    shop_options_length = array_length_1d(shop_options)
    for (i = 0; i < shop_options_length; i++) {
        draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+(i*string_height("SHOP"))+12,shop_options[i])
        if (shop_index == i) {
            draw_set_alpha(0.3)
            draw_rectangle_colour((panel_start_x+15),panel_start_y+string_width("Shop")+120+(i*string_height("SHOP"))+12,
                                  (panel_start_x+125),panel_start_y+string_width("Shop")+120+(i*string_height("SHOP"))+12+string_height("SHOP"),
                                  c_white,
                                  c_white,
                                  c_white,
                                  c_white,
                                  false)
            draw_set_alpha(1)
        }
    }
}
else if (shop_h_index > 0) {
    
    /*** Case Buying Items ***/
    draw_set_font(temp_font2)
   
    if (shop_v_index == 0) {
        shop_options_length = ds_list_size(shop_items)
        draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+(0*string_height("SHOP"))+12,"=== ITEM ===")
        draw_text((panel_start_x+245),panel_start_y+string_width("Shop")+120+(0*string_height("SHOP"))+12,"=== COST ===")
        for (i = 0; i < ds_list_size(shop_items); i++) {
            tmp_s_item = shop_items[| i]
            draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "name"])
            draw_text((panel_start_x+245),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "value"])
            if (shop_index == i) {
                draw_set_alpha(0.3)
                draw_rectangle_colour((panel_start_x+15),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,
                                      (panel_start_x+25+string_width(tmp_s_item[? "name"])),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12+string_height("SHOP"),
                                      c_white,
                                      c_white,
                                      c_white,
                                      c_white,
                                      false)
                draw_set_alpha(1)
            }
        }
        t_current_item = shop_items[| shop_index]
        draw_set_font(tmp_font)
        draw_sprite_ext(obj_gui.item_icons[t_current_item[? "type"]],0,panel_start_x+25,panel_start_y+90-32,4,4,0,c_white,1)
        draw_rectangle_colour(panel_start_x+20,panel_start_y+90-42,panel_start_x+30+74,panel_start_y+90+42,c_white,c_white,c_white,c_white,true)
        
        draw_set_font(temp_font2)
        draw_text(panel_start_x+115,panel_start_y+80-32,"Name: " + t_current_item[? "name"])
        draw_text(panel_start_x+115,panel_start_y+80-16,"Type: " + obj_gui.item_types[t_current_item[? "type"]])
        draw_text(panel_start_x+115,panel_start_y+80,"ATK: " + string(t_current_item[? "dmg"]))
        draw_text(panel_start_x+115,panel_start_y+80+16,"Grade: " + obj_gui.item_grades[t_current_item[? "grade"]])
        draw_text(panel_start_x+115,panel_start_y+80+32,"Value: " + string(t_current_item[? "value"]))
        draw_text(panel_start_x+5,panel_start_y+80+58,'"' + t_current_item[? "desc"] + '"')
    }
    
    /*** Case Selling Items ***/
    
    else if (shop_v_index == 1) {
        shop_options_length = ds_list_size(plyr_target.plyr_items)
        draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+(0*string_height("SHOP"))+12,"=== SELL ===")
         draw_text((panel_start_x+245),panel_start_y+string_width("Shop")+120+(0*string_height("SHOP"))+12,"=== VALUE ===")
        for (i = 0; i < ds_list_size(plyr_target.plyr_items); i++) {
            tmp_s_item = plyr_target.plyr_items[| i]
            draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "name"])
            draw_text((panel_start_x+245),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "value"])
            if (shop_index == i) {
                draw_set_alpha(0.3)
                draw_rectangle_colour((panel_start_x+15),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,
                                      (panel_start_x+25+string_width(tmp_s_item[? "name"])),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12+string_height("SHOP"),
                                      c_white,
                                      c_white,
                                      c_white,
                                      c_white,
                                      false)
                draw_set_alpha(1)
            }
        }
        t_current_item = plyr_target.plyr_items[| shop_index]
        draw_set_font(tmp_font)
        draw_sprite_ext(obj_gui.item_icons[t_current_item[? "type"]],0,panel_start_x+25,panel_start_y+90-32,4,4,0,c_white,1)
        draw_rectangle_colour(panel_start_x+20,panel_start_y+90-42,panel_start_x+30+74,panel_start_y+90+42,c_white,c_white,c_white,c_white,true)
        
        draw_set_font(temp_font2)
        draw_text(panel_start_x+115,panel_start_y+80-32,"Name: " + t_current_item[? "name"])
        draw_text(panel_start_x+115,panel_start_y+80-16,"Type: " + obj_gui.item_types[t_current_item[? "type"]])
        draw_text(panel_start_x+115,panel_start_y+80,"ATK: " + string(t_current_item[? "dmg"]))
        draw_text(panel_start_x+115,panel_start_y+80+16,"Grade: " + obj_gui.item_grades[t_current_item[? "grade"]])
        draw_text(panel_start_x+115,panel_start_y+80+32,"Value: " + string(t_current_item[? "value"]))
        draw_text(panel_start_x+5,panel_start_y+80+58,'"' + t_current_item[? "desc"] + '"')
    }
      /*** Case Upgrade Items ***/
     else if (shop_v_index == 2) {
        shop_options_length = ds_list_size(plyr_target.plyr_items)
        draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+(0*string_height("SHOP"))+12,"=== UPGRADE ===")
        for (i = 0; i < ds_list_size(plyr_target.plyr_items); i++) {
            tmp_s_item = plyr_target.plyr_items[| i]
            draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "name"])
            if (shop_index == i) {
                draw_set_alpha(0.3)
                draw_rectangle_colour((panel_start_x+15),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,
                                      (panel_start_x+25+string_width(tmp_s_item[? "name"])),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12+string_height("SHOP"),
                                      c_white,
                                      c_white,
                                      c_white,
                                      c_white,
                                      false)
                draw_set_alpha(1)
            }
        }
        
        
        t_current_item = plyr_target.plyr_items[| shop_index]
        draw_set_font(tmp_font)
        draw_sprite_ext(obj_gui.item_icons[t_current_item[? "type"]],0,panel_start_x+24,panel_start_y+90-32,4,4,0,c_white,1)
        draw_rectangle_colour(panel_start_x+20,panel_start_y+90-42,panel_start_x+30+74,panel_start_y+90+42,c_white,c_white,c_white,c_white,true)
        
        draw_set_font(temp_font2)
        draw_text(panel_start_x+115,panel_start_y+80-32,"Name: " + t_current_item[? "name"])
        draw_text(panel_start_x+115,panel_start_y+80-16,"Type: " + obj_gui.item_types[t_current_item[? "type"]])
        draw_text(panel_start_x+115,panel_start_y+80,"ATK: " + string(t_current_item[? "dmg"]))
        draw_text(panel_start_x+115,panel_start_y+80+16,"Grade: " + obj_gui.item_grades[t_current_item[? "grade"]])
        draw_text(panel_start_x+115,panel_start_y+80+32,"Value: " + string(t_current_item[? "value"]))
        draw_text(panel_start_x+5,panel_start_y+80+58,'"' + t_current_item[? "desc"] + '"')
    }


    


}
if (is_showing_confirm) {
    script_execute(gui_confirm_dialog,"Are you sure?",panel_start_x+320,panel_start_y+220)
}

/*
draw_set_font(tmp_fancy_font)

draw_roundrect_colour(panel_start_x+10,
                      panel_start_y+10,
                      panel_width-20,
                      panel_start_y+10 + string_height("Items"),
                      false,
                      c_white,
                      true)aaaaaas
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
*/
