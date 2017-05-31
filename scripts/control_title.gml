/****

Title Screen - Control

This script is use for handling any input that might make it's way to the title screen.

****/



if ((keyboard_check_pressed(vk_anykey) || gamepad_check_any_pressed()) && !is_trans) {
    is_trans = true
    audio_play_sound(snd_title_go,1,false)
}



time = current_time

if (time - last_time >= fade_rate) {

    if (!is_trans) {
    
        if (is_sub_fading) {
            sub_alpha -= 0.1
        }
        else {
            sub_alpha += 0.1
        }
        
        if (sub_alpha <= 0) {
            is_sub_fading = false
        }
        else if (sub_alpha >= 1) {
            is_sub_fading = true
        }
    }
    else {
        image_alpha -= 0.05
        
        if (image_alpha <= 0) {
                
                room_goto(HUB)
                instance_destroy()
        }
    }
last_time = time
}
