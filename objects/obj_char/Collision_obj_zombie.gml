if (!is_invincible)
{
	global.healthbar--;
	if (global.healthbar < 1)
		instance_destroy();
	is_hit = true;
	alarm[0] = 5;
	is_invincible = true;
	alarm[1] = 100;
}