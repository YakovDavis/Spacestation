function clean_up_teleport()
{
	for (var i = 0; i < 3; i++)
	{
		station = instance_find(obj_station, i);
		station.x = i * 640;
	}
	for (var i = 0; i < 3; i++)
	{
		flooring = instance_find(obj_floor, i);
		flooring.x = i * 640;
	}
	for (var i = 0; i < 3; i++)
	{
		lamp = instance_find(obj_lamp, i);
		lamp.x = i * 640;
	}
}