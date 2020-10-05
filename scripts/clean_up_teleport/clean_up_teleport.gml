function clean_up_teleport()
{
	var h = -1;
	if (global.left_zone == 0)
		h = 0;
	if (global.current_zone == 0)
		h = 1;
	if (global.right_zone == 0)
		h = 2;
	for (var i = 0; i < 3; i++)
	{
		station = instance_find(obj_station, i);
		station.x = i * 640;
		if (i == h)
		{
			station.sprite_index = spr_hub;
			construct_hub(i);
		}
		else
		{
			station.sprite_index = spr_station;
		}
	}
	for (var i = 0; i < 15; i++)
	{
		flooring = instance_find(obj_floor, i);
		flooring.x = i * 640 - 6 * 640;
	}
}