/****

Title Control Script -- Init

This script is used for initializing the title screen.

May 31, 2017

@Adam Austin

****/


vert_pad = 150


title_text = "PROJECT MCHKN"
draw_set_font(fnt_pxl_title)

title_width = string_width(title_text)
title_height = string_height(title_text)

sub_text = "-- Insert Coin --"
sub_pad = 45
draw_set_font(fnt_pxl_normal)

sub_width = string_width(sub_text)
sub_height = string_height(sub_text)

sub_alpha = 1

is_sub_fading = true

last_time = current_time
time = current_time

fade_rate = 75//Milliseconds? -- Duh 

is_trans = false
