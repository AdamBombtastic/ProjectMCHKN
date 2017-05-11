/**
Control Monster Script
**/

direction = random(360)
speed = random(5)

if (random(10) > 5) {
    //temp = instance_create(x,y,obj_temp_bullet)
    
    //temp.direction = direction
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
