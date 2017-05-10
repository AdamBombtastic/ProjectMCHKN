/***
Mana Bar script

arg0 = target (Player/Monster/etc)
arg1 = x
arg2 = y
arg3 = width
arg4 = height
***/

bar_color = merge_color(c_blue,c_aqua,0.5)

temp_target = argument0

pos_x = argument1
pos_y = argument2

base_width = argument3;
base_height = argument4;

draw_set_alpha(image_alpha)

draw_roundrect_colour(pos_x,pos_y,pos_x + (base_width*(temp_target.obj_mana/temp_target.obj_max_mana)),pos_y+base_height,bar_color,bar_color,false)
draw_roundrect_colour(pos_x,pos_y,pos_x + (base_width),pos_y+base_height,c_black,c_black,true)
draw_set_alpha(1)
