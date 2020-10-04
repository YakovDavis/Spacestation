if (closing&&opening)
	opening = false;

if (opening)
{
	if (rel_y > 0)
		rel_y -= 0.5;
	else
	{
		opening = false;
		opened = true;
	}
}

if (closing)
{
	opened = false;
	if (rel_y < 60)
		rel_y += 0.5;
	else
	{
		closing = false;
	}
}

if (opened)
{
	var d1 = instance_find(obj_exit_door, 0);
	var d2 = instance_find(obj_enter_door, 1);
}