/****
Monster Initiation Script
*****/

depth = 0

target_x = x
target_y = y

hit_once = false

STATE_IDLE = 0
STATE_WALK = 1
STATE_ATTACK = 2
STATE_HURT = 3
STATE_DEATH = 4

mon_speed = 2

mon_direction = 1 //0 = left, 1 =right

ani_state = 0 //IDLE

attack = 1
obj_health = 30
obj_max_health = obj_health
target_hp = obj_health
killer = -1

idle_start = 0
idle_end = 6

walk_start = 7
walk_end = 13

attack_start = 14
attack_end = 48

hurt_start = 49
hurt_end = 53

death_start = 49
death_end = 113

start_frame = idle_start
end_frame = idle_end

r_sprite = spr_mon_pupper_r
l_sprite = spr_mon_pupper


image_index = 0

is_hurt = false
is_dead = false
is_attacking = false
is_moving = false

