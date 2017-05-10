if (is_hurt) {
    image_speed = 0.5    
}
else {
    image_speed = 0
}
if (image_index >= end_frame) {
    image_speed = 0
    image_index = start_frame
    is_hurt = false
}
if (is_dead) {
    image_speed = 0
    if image_alpha > 0 image_alpha -= 0.05;
    else {
        instance_destroy()
    }
}

