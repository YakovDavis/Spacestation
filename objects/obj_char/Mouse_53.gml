var b = instance_create_depth(x + bullet_spawn_radius * sin(gun_direction_actual), y  + bullet_spawn_radius * cos(gun_direction_actual), -1000, obj_bullet);
b.vel_x = bullet_speed * sin(gun_direction_actual);
b.vel_y = -bullet_speed * cos(gun_direction_actual);