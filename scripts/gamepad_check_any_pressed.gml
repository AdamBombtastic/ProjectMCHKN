gp_check = gamepad_get_device_count()

for (i = 0; i < gp_check; i++) {
    if (gamepad_button_check_pressed(i,gp_face1)) {
        return true
    }
    else if (gamepad_button_check_pressed(i,gp_face2)) {
        return true
    }
    else if (gamepad_button_check_pressed(i,gp_face3)) {
        return true
    }
    else if (gamepad_button_check_pressed(i,gp_face4)) {
        return true
    }
    else if (gamepad_button_check_pressed(i,gp_start)) {
        return true
    }
}
return false
