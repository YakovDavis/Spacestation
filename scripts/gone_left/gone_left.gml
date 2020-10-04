function gone_left()
{
	global.right_zone = global.current_zone;
	global.current_zone = global.left_zone;
	if (global.left_zone > 0)
		global.left_zone--;
	else
		global.left_zone = 7;
	
}