if (is_hit)
	draw_sprite_ext(spr_zombie_1, round(frame), x, y, facing, 1, 0, c_gray, 1);
else
	draw_sprite_ext(spr_zombie_1, round(frame), x, y, facing, 1, 0, c_white, 1);
frame += animation_speed;