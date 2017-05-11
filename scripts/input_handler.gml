/***
    Input Handler
***/

for (i = 0; i < no_players; i++) {

    
    /** Check for blank controller entries and assign controllers **/
    t_plyr = plyr_list[| i]
    

    if (t_plyr.controller == -99) {
        if (current_player.plyr_id == t_plyr.plyr_id) {
            t_plyr.controller = -1
        }
        else {
            loop_done = false
            for (j = 0; j < ds_list_size(available_gamepads) && !loop_done ; j++) {
                t_pad_id = available_gamepads[| j]
                if (gamepad_is_connected(t_pad_id)) {
                    t_plyr.controller = t_pad_id
                    ds_list_delete(available_gamepads,t_pad_id)
                    loop_done = true
                }
            }
        }
    
    }

    // Player is using keyboard
    if (t_plyr.controller == -1) {
        
        t_plyr.key_up = keyboard_check(ord('W'))

        t_plyr.key_down= keyboard_check(ord('S'))

        t_plyr.key_left = keyboard_check(ord('A'))

        t_plyr.key_right = keyboard_check(ord('D'))
        
        t_plyr.key_attack = keyboard_check_pressed(vk_space)
        
        t_plyr.key_special = keyboard_check_pressed(vk_shift)
        
        t_plyr.key_menu = keyboard_check(ord('I'))

    }
    //Player using controller
 
    else if (t_plyr.controller >= 0 && ds_list_find_index(gamepads,t_plyr.controller) > -1 && gamepad_is_connected(t_plyr.controller)) {
        c_id = t_plyr.controller    
    
        if (gamepad_axis_value(c_id,gp_axislv) < 0) {
            t_plyr.key_up = 1    
        }
        else t_plyr.key_up = 0
        if (gamepad_axis_value(c_id,gp_axislv)) {
            t_plyr.key_down = 1    
        }
        else t_plyr.key_down = 0
        if (gamepad_axis_value(c_id,gp_axislh) < 0) {
            t_plyr.key_left = 1    
        }
        else t_plyr.key_left = 0
        if (gamepad_axis_value(c_id,gp_axislh)) {
            t_plyr.key_right = 1    
        }
        else t_plyr.key_right = 0
        
        t_plyr.key_attack = gamepad_button_check_pressed(c_id,gp_face1)
        t_plyr.key_special = gamepad_button_check_pressed(c_id,gp_face2)
        t_plyr.key_menu = gamepad_button_check_pressed(c_id,gp_face4)
    }
    
    else /*Player is AI or has no valid controller */{
    
        t_plyr.key_up = 0

        t_plyr.key_down= 0

        t_plyr.key_left = 0

        t_plyr.key_right = 0
        
        t_plyr.key_attack = 0
        
        t_plyr.key_special = 0
        
        t_plyr.key_menu = 0
    
    
    }
}
