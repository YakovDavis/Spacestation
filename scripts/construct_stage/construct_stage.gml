function construct_stage(wave)
{
	var f = file_text_open_read("platforms.json");
	var s = "";
	while (!file_text_eof(f))
	{
		s += file_text_read_string(f);
		file_text_readln(f);
	}
	file_text_close(f);
	var platform_map = json_decode(s);
	for (var i = 0; i < 8; i++)
	{
		var zone_map = ds_map_find_value(platform_map, string(i));
		for (var j = 0; j < real(ds_map_find_value(zone_map, "count")); j++)
		{
			var platform = ds_map_find_value(zone_map, string(j));
			var pl = instance_create_depth(ds_map_find_value(platform, "x") + (i + 1) * 640, ds_map_find_value(platform, "y"), -10, obj_platform_small);
			if (ds_map_find_value(platform, "type") == "neiher")
			{
				pl.left_bolt = false;
				pl.right_bolt = false;
			}
			if (ds_map_find_value(platform, "type") == "right")
				pl.left_bolt = false;
			if (ds_map_find_value(platform, "type") == "left")
				pl.right_bolt = false;
		}
	}
	ds_map_destroy(platform_map);
	
	if (wave > 0)
	{
			var f = file_text_open_read("wave" + string(wave) +".json");
		var s = "";
		while (!file_text_eof(f))
		{
			s += file_text_read_string(f);
			file_text_readln(f);
		}
		file_text_close(f);
		var level_map = json_decode(s);
		for (var i = 0; i < 8; i++)
		{
			var zone_map = ds_map_find_value(level_map, string(i));
			for (var j = 0; j < real(ds_map_find_value(zone_map, "count")); j++)
			{
					var entity_map = ds_map_find_value(zone_map, string(j));
					var obj_type = obj_zombie;
					if (ds_map_find_value(entity_map, "type") == "slime")
						var obj_type = obj_slime;
					var pl = instance_create_depth(ds_map_find_value(entity_map, "x") + (i + 1) * 640, ds_map_find_value(entity_map, "y"), -10, obj_type);
			}
		}
	}
}