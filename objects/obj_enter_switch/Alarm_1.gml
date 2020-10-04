for (var i = 0; i < 2; i++)
{
	var iw = instance_find(obj_invisible_wall, i);
	if (iw.is_enter)
		iw.opened = true;
}