function clear_stage()
{
	with (all)
	{
		if (object_get_name(object_index) == "obj_zombie")
			instance_destroy();
		if (object_get_name(object_index) == "obj_invisible_wall")
			instance_destroy();
		if (object_get_name(object_index) == "obj_exit_door")
			instance_destroy();
		if (object_get_name(object_index) == "obj_exit_switch")
			instance_destroy();
		if (object_get_name(object_index) == "obj_enter_door")
			instance_destroy();
		if (object_get_name(object_index) == "obj_enter_switch")
			instance_destroy();
		if (object_get_name(object_index) == "obj_platform_small")
			instance_destroy();
	}
}