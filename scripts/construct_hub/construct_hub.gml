function construct_hub(rel_zone)
{
	instance_destroy(obj_exit_door);
	instance_destroy(obj_enter_door);
	instance_create_depth(640 * rel_zone + 224, 0, -100, obj_enter_door);
	instance_create_depth(640 * rel_zone + 186, 120, -100, obj_enter_switch);
	instance_create_depth(640 * rel_zone + 418, 0, -100, obj_exit_door);
	instance_create_depth(640 * rel_zone + 380, 120, -100, obj_exit_switch);
}