/***
Init Player Script

***/

plyr_id = id
plyr_color = c_white


obj_health = 10
obj_max_health = obj_health

plyr_speed = 3.5

plyr_attack = 1
plyr_lvl = 1

plyr_is_warping = false
plyr_warp_point_x = false
plyr_warp_point_y = false
plyr_warp_strength = 5

plyr_direction = 0
DIR_DOWN = 0
DIR_UP = 2
DIR_LEFT = 1
DIR_RIGHT = 3

plyr_items = ds_list_create()

is_turn = false
is_party = false
needs_update = false

