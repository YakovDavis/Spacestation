var b = instance_create_depth(x, y + 5, -100, obj_robot_bullet);
b.vel_x = bullet_speed * (global.px-x) / sqrt((global.px-x)*(global.px-x)+(global.py-y)*(global.py-y));
b.vel_y = bullet_speed * (global.py-y) / sqrt((global.px-x)*(global.px-x)+(global.py-y)*(global.py-y));

if (shooting)
	alarm[1] = 2 / fire_rate;