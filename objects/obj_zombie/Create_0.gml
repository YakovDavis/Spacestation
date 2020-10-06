move_rate = 0.5;
accel_rate_ground = 0.3;
accel_rate_air = 0.2;
brake_rate_ground = 0.4;
brake_rate_air = 0.2;
gravity_vspeed = 4;
gravity_rate = 0.2;
frame = 0.0;
facing = 1;
animation_speed = 0.1;
triggered = true;
hp = 3;
is_hit = false;
triggered = false;
zombie_sprite = spr_zombie_1;
if (irandom(1) == 1)
	zombie_sprite = spr_zombie_2;

// Fixes
hspeed = 0.000001;

alarm[1] = 200 + 100 * random(5);