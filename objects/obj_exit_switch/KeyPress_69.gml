if (selected)
{
	can_be_pressed = false;
	frame = 1;
	if (global.wave < 1)
		global.wave++;
	construct_stage(global.wave);
	audio_play_sound(snd_game_music, 0, true);
	alarm[0] = 10;
}