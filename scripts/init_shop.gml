/****

Shop Initiation Script

****/

shop_sayings[0] = "Take yer time. I'm not goin' anywhere."
shop_sayings[1] = "Is that a new scar? Nevermind, me glasses have a scratch. . ."
shop_sayings[2] = "Ya do have money? Right?"
shop_sayings[3] = "Welcome to me humble shop. Items on the right, empty yer pockets on the left."

shop_options[0] = "Buy"
shop_options[1] = "Sell"
shop_options[2]= "Upgrade"
shop_options[3]= "Level"

shop_h_index = 0
shop_v_index = 0
shop_index = 0

shop_options_length = array_length_1d(shop_options)

shop_items = ds_list_create()

cost_discount = 0

ds_list_add(shop_items,obj_gui.item_none)
ds_list_add(shop_items,obj_gui.temp_item4)




