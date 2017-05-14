/****
Animate_Player 

****/





image_blend = plyr_color
image_speed = 0

if (plyr_is_warping) {
draw_set_alpha(0.5)
image_blend = merge_color(c_aqua,c_white,0.5)
draw_set_alpha(1)
}
if (plyr_direction == DIR_LEFT) {
    image_index = 2
}
else if (plyr_direction == DIR_RIGHT) {
    image_index = 1
}
