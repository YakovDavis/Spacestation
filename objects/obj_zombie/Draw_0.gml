if (is_hit)
	draw_sprite_ext(zombie_sprite, round(frame), x, y, facing, 1, 0, c_gray, 1);
else
	draw_sprite_ext(zombie_sprite, round(frame), x, y, facing, 1, 0, c_white, 1);
frame += animation_speed;