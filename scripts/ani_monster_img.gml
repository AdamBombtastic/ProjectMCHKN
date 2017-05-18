/*****

Monster Animation Script


******/

image_speed = 0.3


if (mon_direction == 0) {

    if (sprite_index != l_sprite) {
        sprite_index = l_sprite
    }
}
else if (mon_direction == 1) {
    if (sprite_index != r_sprite) {
        sprite_index = r_sprite
    }
}


switch ani_state {
    case STATE_IDLE:
        start_frame = idle_start
        end_frame = idle_end
        break
    case STATE_WALK:
        start_frame = walk_start
        end_frame = walk_end
        break
    case STATE_ATTACK:
        start_frame = attack_start
        end_frame = attack_end
        image_speed = 0.6
        break
    case STATE_HURT:
        start_frame = hurt_start
        end_frame = hurt_end
        
        if (image_index >= end_frame) {
            is_hurt = false
            ani_state = STATE_IDLE
        }
        
        break
    case STATE_DEATH:
        start_frame = death_start
        end_frame = death_end
        
        //image_alpha -= 0.005
        break
    default:
        //CODE
}

if (image_index < start_frame) {
    image_index = start_frame
}
else if (image_index > end_frame) {
    image_index = start_frame
    if (ani_state == STATE_ATTACK) {
        is_attacking = false
        ani_state = STATE_IDLE
    }
    else if (ani_state == STATE_DEATH) {
        instance_destroy()
    }
}

