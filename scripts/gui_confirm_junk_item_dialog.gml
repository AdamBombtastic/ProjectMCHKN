/***
    Temporary Yes/No dialogue to confirm weapons
    arg0 = Player ID
    arg1 = item_index
***/



//is_showing_item_gui = false

plyr_ind= argument0
item_index = argument1

plyr_target = plyr_list[| plyr_ind]
p_t_item = ds_list_find_value(plyr_target.plyr_items,item_index)


p_width = 285
p_height = 100

p_start_x = bottom_player_x + ((plyr_ind * next_player_status_width) + plyr_ind*next_player_padding) 
p_start_y = bottom_player_y -150 - p_height 

draw_set_alpha(0.75)
draw_roundrect_colour(p_start_x,
                      p_start_y,
                      p_start_x+p_width,
                      p_start_y+p_height,
                      fill_color,
                      fill_color,
                      false)
draw_set_alpha(1)
draw_set_font(temp_font2)
draw_text(p_start_x + ((p_width)/2) - string_width('Junk "' + p_t_item[? "name"] +'" ?')/2,p_start_y+25,'Junk "' + p_t_item[? "name"] +'"?')
draw_sprite(tmp_a_button,0,p_start_x + 20,p_start_y + 50)
draw_text(p_start_x + 55,p_start_y + 55," - Yes")
draw_sprite(tmp_b_button,0,p_start_x + 120,p_start_y + 50)
draw_text(p_start_x + 155,p_start_y + 55," - No")
