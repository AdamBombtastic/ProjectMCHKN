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
    
    
    draw_sprite_ext(tmp_shop_face,face_image,panel_start_x+25,panel_start_y+90-32,1.5,1.5,0,c_white,1)
    
    if (current_time - last_time > random(500)+300) {
        face_image += 1
        if (face_image > face_image_end) face_image = 0
        last_time = current_time
    }
    draw_set_font(temp_font2)
    draw_roundrect_colour(panel_start_x+120,panel_start_y+80-32,panel_start_x+120 + string_width(shop_sayings[current_shop_saying]) + 10,panel_start_y+80-32 + string_height("@")*2 + 2,c_white,c_white,false)
    draw_roundrect_colour(panel_start_x+120,panel_start_y+80-32,panel_start_x+120 + string_width(shop_sayings[current_shop_saying]) + 10,panel_start_y+80-32 + string_height("@")*2 + 2,c_black,c_black,true)
    
    draw_set_color(c_black)
    
    draw_text(panel_start_x+125,panel_start_y+85-32,shop_sayings[current_shop_saying])
    draw_set_color(c_white)
    draw_set_font(tmp_fancy_font)
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
        draw_text((panel_start_x+265),panel_start_y+string_width("Shop")+120+(0*string_height("SHOP"))+12,"=== COST ===")
        for (i = 0; i < ds_list_size(shop_items); i++) {
            tmp_s_item = shop_items[| i]
            draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "name"] + " x" + string(tmp_s_item[? "amount"]))
            draw_text((panel_start_x+265),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,tmp_s_item[? "value"])
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
        if (shop_index > ds_list_size(shop_items)-1){
            shop_index = ds_list_size(shop_items)-1
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
        
        //Current Item
        draw_set_font(tmp_font)
        draw_sprite_ext(obj_gui.item_icons[t_current_item[? "type"]],0,panel_start_x+24,panel_start_y+90-32,4,4,0,c_white,1)
        draw_rectangle_colour(panel_start_x+20,panel_start_y+90-42,panel_start_x+30+74,panel_start_y+90+42,c_white,c_white,c_white,c_white,true)
        
        draw_set_font(temp_font2)
        //draw_text(panel_start_x+115,panel_start_y+80-32,"Name: " + t_current_item[? "name"])
        draw_text(panel_start_x+115,panel_start_y+80-16,"Type: " + obj_gui.item_types[t_current_item[? "type"]])
        draw_text(panel_start_x+115,panel_start_y+80,"ATK: " + string(t_current_item[? "dmg"]))
        draw_text(panel_start_x+115,panel_start_y+80+16,"Grade: " + obj_gui.item_grades[t_current_item[? "grade"]])
        draw_text(panel_start_x+115,panel_start_y+80+32,"Value: " + string(t_current_item[? "value"]))
        
        //Upgrade Item
        draw_set_font(tmp_font)
        draw_sprite_ext(obj_gui.item_icons[t_current_item[? "type"]],0,panel_start_x+324,panel_start_y+90-32,4,4,0,c_lime,1)
        draw_rectangle_colour(panel_start_x+320,panel_start_y+90-42,panel_start_x+330+74,panel_start_y+90+42,c_white,c_white,c_white,c_white,true)
        
        draw_set_font(temp_font2)
        
        
        draw_text(panel_start_x+415,panel_start_y+80-16,"Type: " + obj_gui.item_types[t_current_item[? "type"]])
        draw_set_color(c_lime)
        draw_text(panel_start_x+415,panel_start_y+80-32,"Name: ???")
        draw_text(panel_start_x+415,panel_start_y+80,"ATK: " + string(t_current_item[? "dmg"]) + " + ???")
        draw_text(panel_start_x+415,panel_start_y+80+16,"Grade: ???" )
        draw_text(panel_start_x+415,panel_start_y+80+32,"Value: ???" )
        draw_set_color(c_white)
    }
    
    //Case buying a level ? 
    else if (shop_v_index == 3) {
        
        draw_set_font(temp_font2)
        
        tmp_p_gold = plyr_target.plyr_gold 
        gold_options = floor(tmp_p_gold / 1000)
        shop_options_length = gold_options
        
        
        /** More than 6 options **/
        if (gold_options >= 6) {
        
            for (i = 0 +shop_scroll_index; i <= 6+shop_scroll_index; i++) {
                draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+((1+i-shop_scroll_index)*string_height("SHOP"))+12,string(i+1) + " Level")
                draw_text((panel_start_x+265),panel_start_y+string_width("Shop")+120+((1+i-shop_scroll_index)*string_height("SHOP"))+12,string((i+1)*1000))
                
                
                show_debug_message("SI: " + string(shop_index))
                show_debug_message("I: " + string(i))
                if (shop_index == i) {
                    draw_set_alpha(0.3)
                    draw_rectangle_colour((panel_start_x+15),panel_start_y+string_width("Shop")+120+((1+i-shop_scroll_index)*string_height("SHOP"))+12,
                                          (panel_start_x+25+string_width("## LEVEL")),panel_start_y+string_width("Shop")+120+((1+i-shop_scroll_index)*string_height("SHOP"))+12+string_height("SHOP"),
                                          c_white,
                                          c_white,
                                          c_white,
                                          c_white,
                                          false)
                    draw_set_alpha(1)
                }
            }
        }
        else {
             for (i = 0; i < gold_options; i++) {
                draw_text((panel_start_x+20),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,string(i+1) + " Level")
                draw_text((panel_start_x+265),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,string((i+1)*1000))
                
                if (shop_index == i) {
                    draw_set_alpha(0.3)
                    draw_rectangle_colour((panel_start_x+15),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12,
                                          (panel_start_x+25+string_width("## LEVEL")),panel_start_y+string_width("Shop")+120+((1+i)*string_height("SHOP"))+12+string_height("SHOP"),
                                          c_white,
                                          c_white,
                                          c_white,
                                          c_white,
                                          false)
                    draw_set_alpha(1)
                }
            }
        
        }  
        draw_sprite_ext(tmp_shop_face,face_image,panel_start_x+25,panel_start_y+90-32,1.5,1.5,0,c_white,1)
        
        if (current_time - last_time > random(500)+300) {
            face_image += 1
            if (face_image > face_image_end) face_image = 0
            last_time = current_time
        }
        draw_set_font(temp_font2)
        draw_roundrect_colour(panel_start_x+120,panel_start_y+80-32,panel_start_x+120 + string_width(shop_gold_sayings[0]) + 10,panel_start_y+80-32 + string_height("@")*2 + 2,c_white,c_white,false)
        draw_roundrect_colour(panel_start_x+120,panel_start_y+80-32,panel_start_x+120 + string_width(shop_gold_sayings[0]) + 10,panel_start_y+80-32 + string_height("@")*2 + 2,c_black,c_black,true)
        
        draw_set_color(c_black)
         draw_text(panel_start_x+125,panel_start_y+85-32,shop_gold_sayings[0])
        draw_set_color(c_white)
    
    
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
