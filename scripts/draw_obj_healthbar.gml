/***
Health bar script
***/

base_width = sprite_width;
base_height = 10;

draw_set_alpha(image_alpha)
draw_rectangle_colour(x-sprite_width/2,(y-sprite_height/2)-15,x-(sprite_width/2)+(base_width),(y-sprite_height/2)+base_height-15,c_black,c_black,c_black,c_black,false)
draw_rectangle_colour(x-sprite_width/2,(y-sprite_height/2)-15,x-(sprite_width/2)+(base_width*(obj_health/obj_max_health)),(y-sprite_height/2)+base_height-15,c_red,c_red,c_red,c_red,false)
draw_set_alpha(1)
