/// @description Control Player

// Get input
move_input_total = 0;
if keyboard_check(control_left) || keyboard_check(control_left_alt) { move_input_total -= 1; }
if keyboard_check(control_right) || keyboard_check(control_right_alt) { move_input_total += 1; }
// Jump input buffer
if keyboard_check_pressed(control_jump) || keyboard_check_pressed(control_jump_alt)
{
   jump_buffer_count = 0;
}
// Check / increment jump buffer
if jump_buffer_count < jump_buffer
{
   jump_buffer_count++;
}

// No move input, brake
// On ground
if place_meeting(x, y + 1, obj_floor)
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_ground;
   }
}
// In air
if !place_meeting(x, y + 1, obj_floor)
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_air;
   }
}

// Move player and clamp value to max
// On ground
if place_meeting(x, y + 1, obj_floor)
{
   hspeed += move_input_total * accel_rate_ground;
   jumping = false;
}
// In air
if !place_meeting(x, y + 1, obj_floor)
{
   hspeed += move_input_total * accel_rate_air;
   jumping = true;
}
// Limit speed to move_rate
hspeed = clamp(hspeed, -move_rate, move_rate);

// Gravity
if (vspeed < gravity_vspeed) || !place_meeting(x, y + 1, obj_floor)
{
   vspeed += gravity_rate;
}

// Jump if on / close to ground
// Account for ledge buffer but prevent wall jumping
if (place_meeting(x + jump_ledge_buffer, y + 1, obj_floor) && jump_buffer_count < jump_buffer && !place_meeting(x + 1, y, obj_floor)) ||
   (place_meeting(x - jump_ledge_buffer, y + 1, obj_floor) && jump_buffer_count < jump_buffer && !place_meeting(x - 1, y, obj_floor))
{
   vspeed = 1 * -jump_rate;
}

// Collisions and stuck/overlap prevention
if (place_meeting(x + hspeed, y, obj_floor)) {
   while (!place_meeting(x + sign(hspeed), y, obj_floor)) {
       x += sign(hspeed);
   }
   hspeed = 0;
}
if (place_meeting(x, y + vspeed, obj_floor)) {
   while (!place_meeting(x, y + sign(vspeed), obj_floor)) {
       y += sign(vspeed);
   }
   vspeed = 0;
}
// Diagonal
if (place_meeting(x + hspeed, y + vspeed, obj_floor)) {
   while (!place_meeting(x + sign(hspeed), y + sign(vspeed), obj_floor)) {
       x += sign(hspeed);
       y += sign(vspeed);
   }
   hspeed = 0;
   vspeed = 0;
}

facing = sign(hspeed);


gun_direction_actual = sign(mouse_x - x) * arccos((y - mouse_y)/sqrt((mouse_y - y)*(mouse_y - y) + (mouse_x - x)*(mouse_x - x)));
gun_direction_animated = round(gun_direction_actual / pi * 4);

if (x > 1280)
{
	with(all)
	{
		if (object_get_name(object_index) == "obj_bullet")
			real_x -= 640;
		else
			x -= 640;
	}
	gone_right();
	clean_up_teleport();
	//show_debug_message(string(global.left_zone) + string(global.current_zone) + string(global.right_zone));
	
}

if (x < 640)
{
	with(all)
	{
		if (object_get_name(object_index) == "obj_bullet")
			real_x += 640;
		else
			x += 640;
	}
	gone_left();
	clean_up_teleport();
	//show_debug_message(string(global.left_zone) + string(global.current_zone) + string(global.right_zone));
}

// Speed debug
/*show_debug_message("HInput: " + string(move_input_total));
show_debug_message("Jump Buffer Count: " + string(jump_buffer_count));
show_debug_message("-global.world_hspeed: " + string(-global.world_hspeed));
show_debug_message("-global.world_vspeed: " + string(-global.world_hspeed));*/

var bg = layer_get_id("Background");
layer_x(bg, x - 160);
camera_set_view_pos(view_camera[0], x - 160, camera_get_view_y(view_camera[0]))
