player_in_range = (global.px-x)*(global.px-x) + (global.py-y)*(global.py-y) < 15000;

if (player_in_range)
{
	facing = sign(global.px-x);
	fire_frame += fire_rate;
	if (fire_frame >= 2)
		fire_frame -= 2;
	if (!shooting)
	{
		alarm[1] = 2 / fire_rate;
		shooting = true;
	}
}
else
{
	idle_frame += idle_rate;
	if (idle_frame >= 3)
		idle_frame -= 2.99;
	shooting = false;
}

