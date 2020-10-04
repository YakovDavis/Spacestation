function clear_stage()
{
	with (all)
	{
		if (object_get_name(object_index) == "obj_zombie")
			instance_destroy();
		
	}
}