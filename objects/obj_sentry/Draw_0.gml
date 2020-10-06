var col = c_white;
if (is_hit)
	col = c_gray;

if (player_in_range)
	draw_sprite_ext(spr_sentry, floor(fire_frame) + 3, x, y, facing, 1, 0, col, 1);
else
	draw_sprite_ext(spr_sentry, floor(idle_frame), x, y, facing, 1, 0, col, 1);