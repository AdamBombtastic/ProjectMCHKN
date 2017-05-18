/****
    Sell an Item
    arg0 = Item ID
*****/

t_s_item = obj_tmp_shop.shop_items[| argument0]



if (t_s_item[? "type"] != 0) {
    t_s_item[? "amount"] -= 1
    if (t_s_item[? "amount"] == 0) {
        ds_list_delete(obj_tmp_shop.shop_items,argument0)
        
        if (ds_list_size(obj_tmp_shop.shop_items) == 0) {
            ds_list_add(obj_tmp_shop.shop_items,obj_gui.item_none)
        }
    }
}
