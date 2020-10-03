/// @description Render player and control animations

if (facing > 0)
{
	if (hspeed > idle_animation_margin)
	{
		draw_sprite_ext(spr_char_running, round(run_frame), x, y, 1, 1, 0, c_white, 1);
		run_frame += run_animation_speed;
	}
	else
		draw_sprite_ext(spr_char_idle, 0, x, y, 1, 1, 0, c_white, 1);
}
else
{
	if (hspeed < -idle_animation_margin)
	{
		draw_sprite_ext(spr_char_running, round(run_frame), x, y, -1, 1, 0, c_white, 1);
		run_frame += run_animation_speed;
	}
	else
		draw_sprite_ext(spr_char_idle, 0, x, y, -1, 1, 0, c_white, 1);
}