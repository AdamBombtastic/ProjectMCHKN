/***
Init Player Script

***/

plyr_id = id
plyr_color = c_white


obj_health = 10
obj_max_health = obj_health
obj_mana_regen = 0.1

obj_mana = 10
obj_max_mana = obj_mana

plyr_speed = 3.5

plyr_attack = 1
plyr_lvl = 1

plyr_is_warping = false
plyr_warp_point_x = false
plyr_warp_point_y = false
plyr_warp_strength = 5

plyr_direction = 3
DIR_DOWN = 0
DIR_UP = 2
DIR_LEFT = 1
DIR_RIGHT = 3

plyr_items = ds_list_create()

is_turn = false
is_party = false
is_enemy = false
is_viewing_items = false
needs_update = false

controller = -99// -99 = None, -1 = Keyboard, 0-3 = Gamepads

key_up = 0
key_down = 0
key_left = 0
key_right = 0

key_attack = 0
key_special = 0
key_menu = 0

