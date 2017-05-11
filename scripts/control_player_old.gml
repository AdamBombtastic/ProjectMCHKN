/*****
Player Update & Control Script

*****/


if (needs_update) {
    plyr_attack = player_calc_stats(self)
    needs_update = false
}
if (is_turn) {
    
    if (!plyr_is_warping) {
    
    
        if (keyboard_check(ord('W')) || gamepad_axis_value(0,gp_axislv) < 0) {
            y -= plyr_speed
            //plyr_direction = DIR_UP
        }
        else if (keyboard_check(ord('S')) || gamepad_axis_value(0,gp_axislv)) {
            y += plyr_speed
            //plyr_direction = DIR_DOWN
        }
        if (keyboard_check(ord('A')) || gamepad_axis_value(0,gp_axislh) < 0) {
            x -= plyr_speed
            plyr_direction = DIR_LEFT
        }
        else if (keyboard_check(ord('D'))|| gamepad_axis_value(0,gp_axislh)) {
           x += plyr_speed
           plyr_direction = DIR_RIGHT
        }
        obj_mana += obj_mana_regen
        if (obj_mana > obj_max_mana) {
            obj_mana = 20
        }
    
    }
    else {
        if (x == plyr_warp_point_x && y ==  plyr_warp_point_y || obj_mana <= 0) {
            plyr_is_warping = false
            //obj_mana = 20
            speed = 0
        }
        else if (point_distance(x,y,plyr_warp_point_x,plyr_warp_point_y) < 30) {
            plyr_is_warping = false
            //obj_mana = 20
            speed = 0
        }
        else {
        
            move_towards_point(plyr_warp_point_x,plyr_warp_point_y,30)
            obj_mana -= 1
        }
    
    }
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_face1)) {
        
        
        if (plyr_direction == DIR_RIGHT) {
           obj_temp = instance_create(x+32,y,obj_temp_attack)
           obj_temp.attack = plyr_attack
           obj_temp.owner = plyr_id
        }
        else {
            obj_temp = instance_create(x-32,y,obj_temp_attack)
            obj_temp.attack = plyr_attack
            obj_temp.owner = plyr_id
            with (obj_temp) {
                start_frame = 8
                end_frame = 13
                image_index = start_frame
            
            }
        }
       
    }
    if (keyboard_check_pressed(ord('I')) || gamepad_button_check_pressed(0,gp_face4)) {
        obj_gui.is_showing_item_gui = !obj_gui.is_showing_item_gui
    }
    
    if (mouse_check_button_pressed(mb_right)) {
        if (!plyr_is_warping && obj_mana > 5) {
            plyr_is_warping = true
            plyr_warp_point_x = mouse_x
            plyr_warp_point_y = mouse_y
            
            if (plyr_warp_point_x < x) {
                plyr_direction = DIR_LEFT
            }
            else if (plyr_warp_point_x > x) {
                plyr_direction = DIR_RIGHT
            }
        }
    
    }
    else {
        //x+= plyr_speed * gp_axislh
       // y+= plyr_speed * gp_axislv
    }
}
