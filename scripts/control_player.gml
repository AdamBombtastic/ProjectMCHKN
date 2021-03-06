/*****
Player Update & Control Script

*****/

if (obj_health < 0) {
    obj_health = 0
}
if (needs_update) {
    plyr_attack = player_calc_stats(self)
    needs_update = false
}
if (key_menu && !(in_shop && is_in_gui)) {
        //obj_gui.is_showing_item_gui = !obj_gui.is_showing_item_gui
        is_viewing_items = !is_viewing_items
    }
if ((is_turn || is_party || is_enemy) && !is_viewing_items && !is_in_gui) {
    
    if (!plyr_is_warping) {
    
    
        if (key_up) {
            y -= plyr_speed
            //plyr_direction = DIR_UP
        }
        else if (key_down) {
            y += plyr_speed
            //plyr_direction = DIR_DOWN
        }
        if (key_left) {
            x -= plyr_speed
            plyr_direction = DIR_LEFT
        }
        else if (key_right) {
           x += plyr_speed
           plyr_direction = DIR_RIGHT
        }
        obj_mana += obj_mana_regen
        if (obj_mana > obj_max_mana) {
            obj_mana = obj_max_mana
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
            part_emitter_region(obj_test_particle.FirstParticleSystem,obj_test_particle.first_emitter,x,x,y,y,ps_shape_line,ps_distr_invgaussian)
            part_emitter_burst(obj_test_particle.FirstParticleSystem,obj_test_particle.first_emitter,obj_test_particle.first_particle,10)
            move_towards_point(plyr_warp_point_x,plyr_warp_point_y,30)
            obj_mana -= 1
        }
    
    }
    if (key_attack && obj_mana >= 3 && !in_shop && (current_time - last_attack) > 400 ) {
        
        last_attack = current_time
        
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
        obj_mana -=3
       
    }
    
    
    
    if (key_special) {
        if (!plyr_is_warping && obj_mana > 1) {
            
            plyr_warp_point_x = x + ((-key_left + key_right)*192)
            plyr_warp_point_y = y + ((-key_up + key_down)*192)
            
            if (plyr_warp_point_x != x || plyr_warp_point_y != y) {
                plyr_is_warping = true
            }
            
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
