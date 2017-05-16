/****
    Control GUI (In tandem with Player and the Input handler)
        *Also in charge of updating certain variables
        *Also other stuff (Real Descriptive . . . I know.)
        Adam Austin - 5/13/17
    
****/

//Check every player
for (i = 0; i < no_players; i++) {
    t_plyr = plyr_list[| i]
    //If they are interating with gui, pipe the input to this object. . . 
    //if (t_plyr.is_in_gui) {
        if (t_plyr.is_viewing_items && current_player.id == t_plyr.id) {
            if (!is_showing_junk_gui) {
                if (t_plyr.key_up == 1 && t_plyr.last_key_up != 1) {
                    player_item_index[t_plyr.plyr_id] -= 1
    
                }
                else if (t_plyr.key_down == 1 && t_plyr.last_key_down != 1) {
                    player_item_index[t_plyr.plyr_id] += 1
    
                }
                if (player_item_index[t_plyr.plyr_id] < 0){
                 player_item_index[t_plyr.plyr_id] = 0
                 }
                else if (player_item_index[t_plyr.plyr_id] >= ds_list_size(t_plyr.plyr_items )) {
                    player_item_index[t_plyr.plyr_id] = ds_list_size(t_plyr.plyr_items)-1 
                }
                if (t_plyr.key_attack && t_plyr.plyr_id == current_player.plyr_id) {
                    is_showing_item_gui = !is_showing_item_gui
                }
                if (t_plyr.key_special && t_plyr.plyr_id == current_player.plyr_id) {
                    is_showing_junk_gui = !is_showing_junk_gui
                }
                
            }
            else if (is_showing_junk_gui) {
                if (t_plyr.key_attack && t_plyr.plyr_id == current_player.plyr_id) {
                    //FUTURE ds_list_delete(t_plyr.plyr_items,player_item_index[t_plyr.plyr_id])
                    t_plyr.plyr_items[| player_item_index[t_plyr.plyr_id]] = item_none
                    is_showing_junk_gui = false
                    t_plyr.needs_update = true
                }
                else if (t_plyr.key_special && t_plyr.plyr_id == current_player.plyr_id) {
                is_showing_junk_gui = !is_showing_junk_gui
                }
            }
            
        }
        if (!t_plyr.is_viewing_items && t_plyr.plyr_id == current_player.plyr_id) {
            is_showing_item_gui = false
            is_showing_junk_gui = false
        }
        
        // Shop Input Control
        if (t_plyr.in_shop) {
        
            if (!is_showing_shop_gui) {
                if (t_plyr.key_attack && t_plyr.plyr_id == current_player.plyr_id  ) {
                    is_showing_shop_gui = true
                    t_plyr.is_in_gui = true
                    t_plyr.in_shop = true
                    t_plyr.is_viewing_items = false
                }
            }
            else if (is_showing_shop_gui && t_plyr.plyr_id == current_player.plyr_id) {
                 if (t_plyr.key_special   ) {
                    
                    if (obj_tmp_shop.shop_h_index == 0) {
                        is_showing_shop_gui = false
                        t_plyr.is_in_gui = false
                        t_plyr.in_shop = false
                    }
                    else {
                         obj_tmp_shop.shop_h_index -= 1
                         obj_tmp_shop.shop_index = obj_tmp_shop.shop_v_index
                         obj_tmp_shop.shop_v_index = 0
                        
                    }
                }
                else if (t_plyr.key_attack)
                {
                    if (obj_tmp_shop.shop_h_index == 0) {
                        obj_tmp_shop.shop_h_index += 1
                        obj_tmp_shop.shop_v_index = obj_tmp_shop.shop_index
                        obj_tmp_shop.shop_index = 0
                    }
                    
                
                }
                 if (t_plyr.key_up == 1 && t_plyr.last_key_up != 1) {
                    obj_tmp_shop.shop_index -= 1
    
                }
                else if (t_plyr.key_down == 1 && t_plyr.last_key_down != 1) {
                    obj_tmp_shop.shop_index += 1
    
                }
                 if (obj_tmp_shop.shop_index < 0){
                    obj_tmp_shop.shop_index = 0
                 }
                else if (obj_tmp_shop.shop_index >= obj_tmp_shop.shop_options_length) {
                    obj_tmp_shop.shop_index = obj_tmp_shop.shop_options_length-1
                }
            
            }
            
        } 
    //}
    
    
}