/***

Draw GUI

***/

//Draw Room Title

draw_set_font(tmp_fancy_font)

draw_set_color(c_white)

draw_text((room_width/2)-string_width("Lobby")/2,25,"Lobby")

//Draw player statuses

for (i=0; i < no_players; i++) {
    draw_set_alpha(0.5)
    
    if (i == 0) {
         draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          bottom_player_y, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          bottom_player_y + next_player_status_height,
                          c_yellow,
                          c_yellow,
                          outline_color)
    
    }
    draw_roundrect_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding, 
                          bottom_player_y, 
                          bottom_player_x + ((i * next_player_status_width) + next_player_status_width) + i*next_player_padding, 
                          bottom_player_y + next_player_status_height,
                          fill_color,
                          fill_color,
                          outline_color)
    draw_set_alpha(1)
    
    draw_set_font(tmp_font)
    draw_text_colour(bottom_player_x + (i * next_player_status_width) + i*next_player_padding,
                     bottom_player_y + 10,
                     "Player " + string(i+1),
                     c_white,
                     c_white,
                     c_white,
                     c_white,
                     1)
                     
    
}




