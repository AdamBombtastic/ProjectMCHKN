gp_check = gamepad_get_device_count()

for (i = 0; i < gp_check; i++) {
    if (gamepad_is_connected(i)) {
        var pad = i      
        gamepad_set_axis_deadzone(pad, 0.5);       
        gamepad_set_button_threshold(pad, 0.1);    
        
        ds_list_add(gamepads,pad)
        ds_list_add(available_gamepads,pad)
    }

}

