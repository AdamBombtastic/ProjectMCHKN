/**
Control Monster Script
**/
if (obj_health < 0) {
    obj_health = 0
}
direction = random(360)
speed = random(5)

if (random(10) > 5) {
    //temp = instance_create(x,y,obj_temp_bullet)
    
    //temp.direction = direction
}
if (is_dead && killer != -1) {
    
    
    t_plyr = obj_gui.plyr_list[| killer]
    path_end()
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
