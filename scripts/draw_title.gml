/***

Title Screen - Draw

This script is used for handling the rendering of the title screen.


***/

//Draw Title Text

draw_set_alpha(image_alpha)
draw_set_color(c_yellow)
if (is_trans) draw_set_color(c_lime)
draw_set_font(fnt_pxl_title)

draw_text(room_width/2 - (title_width/2),vert_pad,title_text)


draw_set_color(c_white)
draw_set_font(fnt_pxl_normal)

draw_set_alpha(sub_alpha)
if (is_trans) {
    draw_set_alpha(image_alpha)
    draw_set_color(c_lime)
}
draw_text(room_width/2 - (sub_width/2),vert_pad + title_height + sub_pad, sub_text)
draw_set_alpha(image_alpha)


 

