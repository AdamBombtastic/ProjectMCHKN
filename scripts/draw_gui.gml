/***

Draw GUI

***/

//Draw Room Title

draw_set_font(tmp_fancy_font)

draw_set_color(c_white)

draw_text((room_width/2)-string_width("Lobby")/2,25,"Lobby")

//Draw player statuses

for (i=0; i < no_players; i++) {
    temp_plyr = plyr_list[| i]
    draw_set_alpha(0.5)
    
    if (i == 0) {
         draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          bottom_player_y, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          bottom_player_y + next_player_status_height,
                          c_yellow,
                          c_yellow,
                          false)
 
    
    }
    draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          bottom_player_y, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          bottom_player_y + next_player_status_height,
                          fill_color,
                          fill_color,
                          false)
    draw_set_alpha(1)
    
    draw_set_font(tmp_font)
    draw_text(50 + bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
                     bottom_player_y + 5,
                     "Player " + string(i+1))
    draw_target_healthbar(temp_plyr, 
                          bottom_player_x + (i * next_player_status_width) + i*next_player_padding + string_width("HP: ") + 15,
                          bottom_player_y + 10 + string_height("A"),
                          145,
                          18)
     draw_target_manabar(temp_plyr, 
                          bottom_player_x + (i * next_player_status_width) + i*next_player_padding + string_width("HP: ") + 15,
                          bottom_player_y + 10 + string_height("A")*2,
                          145,
                          18)             
                     
     draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              bottom_player_y + 10 + string_height("A"),
              "HP: ")
     draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              bottom_player_y + 10 + string_height("A")*2,
              "MP: ")
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              bottom_player_y + 10 + string_height("A")*3,
              "LVL: " +string(temp_plyr.plyr_lvl))
    draw_text(bottom_player_x + (i * next_player_status_width) + i*next_player_padding + 10,
              bottom_player_y + 10 + (string_height("A") * 4),
              "ATK: " +string(temp_plyr.plyr_attack))                
                     
    
}


/*** 
Current Player Items
Full - View
***/


if (is_showing_item_gui) {
    script_execute(gui_show_player_item,current_player)

}




