if (!is_invincible)
{
	global.healthbar--;
	if (global.healthbar < 1)
	{
		instance_create_depth(x, y, -60, obj_death);
		instance_create_depth(0, 0, -60, obj_screen_darkening);
		audio_stop_sound(snd_game_music);
		instance_destroy();
	}
	is_hit = true;
	alarm[0] = 5;
	is_invincible = true;
	alarm[1] = 100;
}