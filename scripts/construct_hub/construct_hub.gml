function construct_hub(rel_zone)
{
	instance_destroy(obj_exit_door);
	instance_destroy(obj_enter_door);
	instance_create_depth(640 * rel_zone + 235, 0, -100, obj_enter_door);
	instance_create_depth(640 * rel_zone + 215, 143, -1, obj_enter_switch);
	instance_create_depth(640 * rel_zone + 401, 0, -100, obj_exit_door);
	instance_create_depth(640 * rel_zone + 380, 143, -1, obj_exit_switch);
	var iw1 = instance_create_depth(640 * rel_zone + 227, 0, -100, obj_invisible_wall);
	iw1.is_enter = true;
	var iw2 = instance_create_depth(640 * rel_zone + 409, 0, -100, obj_invisible_wall);
	iw2.is_enter = false;
	instance_create_depth(640 * rel_zone + 265, 147, 100, obj_platform_small);
}