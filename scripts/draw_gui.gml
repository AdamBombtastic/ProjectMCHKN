/***

Draw GUI

***/

//Draw Room Title


draw_set_font(tmp_fancy_font)

draw_set_color(c_white)

//draw_text((room_width/2)-string_width("Lobby")/2,25,"Lobby")

//Draw player statuses

for (i=0; i < no_players; i++) {
    
    temp_y_pos = bottom_player_y
    
    
    temp_plyr = plyr_list[| i]
    
    if (temp_plyr.is_viewing_items) {
        temp_y_pos -= 150 //?
    }
    
    
    draw_set_alpha(0.5)
    
    /* Draw the main status indicators. Check if they are in a party, an enemy, or the current player */
    
    //Current Player
    if (i == current_player_turn) {
         draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          temp_y_pos, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          temp_y_pos + next_player_status_height,
                          c_yellow,
                          c_yellow,
                          false)
 
    
    }
    //Party 
    else if (temp_plyr.is_party) {
         draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          temp_y_pos, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          temp_y_pos + next_player_status_height,
                          c_green,
                          c_green,
                          false)
 
    
    }
    //Enemy
    else if (temp_plyr.is_enemy) {
         draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          temp_y_pos, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          temp_y_pos + next_player_status_height,
                          c_red,
                          c_red,
                          false)
 
    
    }
    //Base 
    draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          temp_y_pos, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          temp_y_pos + next_player_status_height,
                          fill_color,
                          fill_color,
                          false)
    draw_set_alpha(1)
    
    /*** This section pupulates the status with Health, Mana, Level, and Attack stats. **/
    //TODO: Add IN Party and Enemy Status Indicators
    draw_set_font(tmp_font)
    draw_text(50 + bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
                     temp_y_pos + 5,
                     "Player " + string(i+1))
    draw_target_healthbar(temp_plyr, 
                          bottom_player_x + (i * next_player_status_width) + i*next_player_padding + string_width("HP: ") + 15,
                          temp_y_pos + 10 + string_height("A"),
                          220,
                          15)
     draw_target_manabar(temp_plyr, 
                          bottom_player_x + (i * next_player_status_width) + i*next_player_padding + string_width("HP: ") + 15,
                          temp_y_pos + 10 + string_height("A")*2,
                          220,
                          15)             
                     
     draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              temp_y_pos + 10 + string_height("A"),
              "HP: ")
     draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              temp_y_pos + 10 + string_height("A")*2,
              "MP: ")
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              temp_y_pos + 10 + string_height("A")*3,
              "LVL: " +string(temp_plyr.plyr_lvl))
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              temp_y_pos + 10 + (string_height("A") * 4),
              "ATK: " +string(temp_plyr.plyr_attack))                
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              temp_y_pos + 10 + (string_height("A") * 5),
              "=ITEMS=")       
              
    

    // Grab the player's items and display them . . .
    for (j = 0; j < ds_list_size(temp_plyr.plyr_items); j++) {
        item = ds_list_find_value(temp_plyr.plyr_items,j)
        text = item[? "name"]
        str_height = string_height("ATK")
        draw_set_font(temp_font2)
        if (player_item_index[temp_plyr.plyr_id] == j) {
            draw_set_alpha(0.2)
            draw_rectangle_color(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 5,
                                 temp_y_pos + 10 + (str_height * (6+j)+5),
                                 (bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 5) + (next_player_status_width-20),
                                 temp_y_pos + 10 + (str_height * (6+j)+5) + string_height("#")-5,
                                 c_white,
                                 c_white,
                                 c_white,
                                 c_white,
                                 false)
            draw_set_alpha(1)
        }
        draw_sprite(item_icons[item[? "type"]],0,bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 5,temp_y_pos + 10 + (str_height * (6+j))+6)
        /*draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 30,
                  temp_y_pos + 10 + (str_height * (6+j)+5),
                  text + " " + string(item[? "dmg"]))
        */
        if (item[? "dmg"] > -1) {
            draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 30,
                  temp_y_pos + 10 + (str_height * (6+j)+5),
                  text + " +" + string(item[? "dmg"]))
        }
        else {
             draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 30,
                  temp_y_pos + 10 + (str_height * (6+j)+5),
                  text + " " + string(item[? "dmg"]))
        }
        

                             
                            
        
        
        
    }
    draw_sprite(tmp_a_button,0,bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 5,temp_y_pos + 500-278)
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 30,
                  temp_y_pos + 500-270,
                  " - Toggle View ")
    draw_sprite(tmp_b_button,0,bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 150,temp_y_pos + 500-278)
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 180,
                  temp_y_pos + 500-270,
                  " - Junk")

}
/*** 
Current Player Items
Full - View
***/


if (is_showing_item_gui) {
    script_execute(gui_show_player_item,current_player.plyr_id,player_item_index[current_player.plyr_id])

}
if (is_showing_junk_gui) {

    script_execute(gui_confirm_junk_item_dialog,current_player.plyr_id,player_item_index[current_player.plyr_id])

}




