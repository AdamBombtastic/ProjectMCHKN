/**
Control Monster Script
**/


speed = 0

if (!is_dead) { 
    if (ani_state != STATE_ATTACK) {
        if (point_distance(obj_gui.current_player.x,obj_gui.current_player.y,x,y) < 300 && !is_hurt && !hit_once ) {
            is_moving = true
            ani_state = STATE_WALK
            
            target_x = obj_gui.current_player.x
            target_y = obj_gui.current_player.y
        }
        else if ( point_distance(obj_gui.current_player.x,obj_gui.current_player.y,x,y) <= 500 && !is_hurt && !is_attacking ){
            is_moving = true
            ani_state = STATE_WALK
            
            target_x = x
            target_y = obj_gui.current_player.y
        
        }
        else {
            is_moving = false
            is_attacking = false
            ani_state = STATE_IDLE
        }
        if ( point_distance(x,y,target_x,target_y) <= mon_speed *2  ){
        is_moving = false
        ani_state = STATE_IDLE
        if (hit_once) ani_state = STATE_ATTACK
        
        target_x = x
        target_y = obj_gui.current_player.y
    
    }
     if (obj_gui.current_player.x < x && !is_attacking) {
        mon_direction = 0
    }
    else if ((obj_gui.current_player.x > x) && !is_attacking ) {
        mon_direction = 1
    } 
    if (is_moving == true && ani_state == STATE_WALK) {
        move_towards_point(target_x,target_y,mon_speed)
    
    }
    }
    
    if (is_hurt) {
        ani_state = STATE_HURT
        is_moving = false
        is_attacking = false
    }
    else if (ani_state == STATE_ATTACK && image_index  > 36 && !is_attacking) {
        
        offset_x = (sprite_width/4)
        if (mon_direction == 0) offset_x *=-1
        tmp_l = instance_create(x+offset_x,y-6,obj_pupper_lazer)
        tmp_l.dir = mon_direction
        tmp_l.owner = self
        is_attacking = true
        is_moving = false
        
    }
   
    
   
    
   
    
    
    
    
    
    if (obj_health < 0) {
        obj_health = 0
        is_dead = true
    }
}

if (is_dead && killer != -1) {
    
    
    ani_state = STATE_DEATH
    t_plyr = obj_gui.plyr_list[| killer]
    //path_end()
    t_plyr.plyr_lvl += 1
    t_plyr.needs_update = true
    t_plyr.plyr_gold += floor(random(100))
    effect_create_above(ef_star, t_plyr.x, t_plyr.y-32, 1.8, merge_color(c_white,c_yellow,0.5))
    effect_create_above(ef_star, t_plyr.x-16, t_plyr.y-32, 1.8, merge_color(c_white,c_yellow,0.5))
    effect_create_above(ef_star, t_plyr.x+16, t_plyr.y-32, 1.8, merge_color(c_white,c_yellow,0.5))
    effect_create_above(ef_firework, other.x, other.y, 0.5, c_white);
    
    killer = -1

}













    /*** DEBUG CHANGE PLAYERS   ****/
    if (keyboard_check_pressed(vk_tab)) {
    
        obj_gui.plyr_list[| obj_gui.current_player_turn].is_turn = false
        
        obj_gui.current_player_turn +=1
        if (obj_gui.current_player_turn >= obj_gui.no_players) {
            obj_gui.current_player_turn = 0
        }
        obj_gui.plyr_list[| obj_gui.current_player_turn].is_turn = true
        obj_gui.current_player = obj_gui.plyr_list[| obj_gui.current_player_turn]
        
        
        //show_debug_message("Pressed tab . . .")
 
    }
    /*** DEBUG CHANGE PLAYERS   ****/
