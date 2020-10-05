function clear_stage()
{
	with (all)
	{
		if (object_get_name(object_index) == "obj_zombie")
			instance_destroy();
		if (object_get_name(object_index) == "obj_platform_small")
			instance_destroy();
	}
}