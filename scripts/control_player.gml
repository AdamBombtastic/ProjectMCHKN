/*****
Player Update & Control Script

*****/
if (needs_update) {
    plyr_attack = player_calc_stats(self)
    needs_update = false
}
if (is_turn) {

    if (!plyr_is_warping) {
    
    
        if (keyboard_check(ord('W'))) {
            y -= plyr_speed
            //plyr_direction = DIR_UP
        }
        else if (keyboard_check(ord('S'))) {
            y += plyr_speed
            //plyr_direction = DIR_DOWN
        }
        if (keyboard_check(ord('A'))) {
            x -= plyr_speed
            plyr_direction = DIR_LEFT
        }
        else if (keyboard_check(ord('D'))) {
           x += plyr_speed
           plyr_direction = DIR_RIGHT
        }
    
    }
    else {
        if (x == plyr_warp_point_x && y ==  plyr_warp_point_y || plyr_warp_strength <= 0) {
            plyr_is_warping = false
            plyr_warp_strength = 20
            speed = 0
        }
        else if (point_distance(x,y,plyr_warp_point_x,plyr_warp_point_y) < 30) {
            plyr_is_warping = false
            plyr_warp_strength = 20
            speed = 0
        }
        else {
        
            move_towards_point(plyr_warp_point_x,plyr_warp_point_y,30)
            plyr_warp_strength -= 1
        }
    
    }
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        
        
        if (plyr_direction == DIR_RIGHT) {
           obj_temp = instance_create(x+32,y,obj_temp_attack)
           obj_temp.attack = plyr_attack
        }
        else {
            obj_temp = instance_create(x-32,y,obj_temp_attack)
            obj_temp.attack = plyr_attack
            with (obj_temp) {
                start_frame = 8
                end_frame = 13
                image_index = start_frame
            
            }
        }
       
    }
    if (keyboard_check_pressed(ord('I'))) {
        obj_gui.is_showing_item_gui = !obj_gui.is_showing_item_gui
    }
    
    if (mouse_check_button_pressed(mb_right)) {
        if (!plyr_is_warping) {
            plyr_is_warping = true
            plyr_warp_point_x = mouse_x
            plyr_warp_point_y = mouse_y
            
        }
    
    }
    else {
        //x+= plyr_speed * gp_axislh
       // y+= plyr_speed * gp_axislv
    }
}
