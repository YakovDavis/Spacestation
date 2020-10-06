exit_door = instance_find(obj_exit_door, 0);
exit_door.opening = true;
enter_door = instance_find(obj_enter_door, 0);
enter_door.closing = true;
for (var i = 0; i < 2; i++)
{
	var iw = instance_find(obj_invisible_wall, i);
	if (iw.is_enter)
		iw.opened = false;
}

alarm[1] = 50;