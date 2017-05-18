/****
    Buy an Item
    arg0 = Item
*****/

t_b_item = get_item_copy(argument0)


//ind = ds_list_find_index(obj_tmp_shop.shop_items,t_b_item) 
ind = -1

for (i = 0; i < ds_list_size(obj_tmp_shop.shop_items); i++) {
    t_i_item = obj_tmp_shop.shop_items[| i]
    if (t_i_item[? "name"] == t_b_item[? "name"]) {
        ind = i
        break
    }
}


if (t_b_item[? "type"] != 0) {
    
    if (ds_list_size(obj_tmp_shop.shop_items) == 0) {
        t_b_item[? "amount"] = 1
        ds_list_add(obj_tmp_shop.shop_items,t_b_item)
    }
    else {
        if (ind != -1) {
            t_item = obj_tmp_shop.shop_items[| ind]
            t_item[? "amount"] += 1
        }
        else {
            ds_list_add(obj_tmp_shop.shop_items,t_b_item)
            t_b_item[? "amount"] = 1
        
        
        }
    }
}
