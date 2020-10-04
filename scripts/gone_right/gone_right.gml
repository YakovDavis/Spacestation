function gone_right()
{
	global.left_zone = global.current_zone;
	global.current_zone = global.right_zone;
	if (global.right_zone < 7)
		global.right_zone++;
	else
		global.right_zone = 0;
}