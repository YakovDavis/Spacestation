/// @description Control Player

//show_debug_message(place_meeting(x, y + 1, obj_platform_small));

global.px = x;
global.py = y;

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
if (place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_platform_small)||place_meeting(x, y + 1, obj_invisible_wall))
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_ground;
   }
}
// In air
if !(place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_platform_small)||place_meeting(x, y + 1, obj_invisible_wall))
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_air;
   }
}

// Move player and clamp value to max
// On ground
if place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_invisible_wall)
{
   hspeed += move_input_total * accel_rate_ground;
   jumping = false;
}

var pl = instance_place(x, y + 1, obj_platform_small);
if (pl != noone) {
   if (pl.y > y + 12) {
	  hspeed += move_input_total * accel_rate_ground;
	  jumping = false;
   }
}
	   
// In air
if !(place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_platform_small)||place_meeting(x, y + 1, obj_invisible_wall))
{
   hspeed += move_input_total * accel_rate_air;
   jumping = true;
}
// Limit speed to move_rate
hspeed = clamp(hspeed, -move_rate, move_rate);

// Gravity
if (vspeed < gravity_vspeed) && !place_meeting(x, y + 1, obj_floor) && !place_meeting(x, y + 1, obj_invisible_wall)
{
   vspeed += gravity_rate;
}

var pl = instance_place(x, y + 1, obj_platform_small);
if (vspeed < gravity_vspeed)&&(pl != noone)
   if (pl.y > y + 12)
	   if (vspeed < gravity_vspeed)
			vspeed += gravity_rate;


// Jump if on / close to ground
// Account for ledge buffer but prevent wall jumping
if (place_meeting(x + jump_ledge_buffer, y + 1, obj_floor) && jump_buffer_count < jump_buffer && !place_meeting(x + 1, y, obj_floor)) ||
   (place_meeting(x - jump_ledge_buffer, y + 1, obj_floor) && jump_buffer_count < jump_buffer && !place_meeting(x - 1, y, obj_floor))
{
   if (!audio_is_playing(snd_jump))
	audio_play_sound(snd_jump, 0, false);
   vspeed = 1 * -jump_rate;
}

if (place_meeting(x + jump_ledge_buffer, y + 1, obj_platform_small) && jump_buffer_count < jump_buffer) ||
   (place_meeting(x - jump_ledge_buffer, y + 1, obj_platform_small) && jump_buffer_count < jump_buffer)
{
   if (!audio_is_playing(snd_jump))
	audio_play_sound(snd_jump, 0, false);
   vspeed = 1 * -jump_rate;
}

if (place_meeting(x + jump_ledge_buffer, y + 1, obj_invisible_wall) && jump_buffer_count < jump_buffer && !place_meeting(x + 1, y, obj_invisible_wall)) ||
   (place_meeting(x - jump_ledge_buffer, y + 1, obj_invisible_wall) && jump_buffer_count < jump_buffer && !place_meeting(x - 1, y, obj_invisible_wall))
{
   if (!audio_is_playing(snd_jump))
	audio_play_sound(snd_jump, 0, false);
   vspeed = 1 * -jump_rate;
}

// Collisions and stuck/overlap prevention
if (place_meeting(x + hspeed, y, obj_floor)) {
   while (!place_meeting(x + sign(hspeed), y, obj_floor)) {
       x += sign(hspeed);
   }
   hspeed = 0;
}
if (place_meeting(x + hspeed, y, obj_invisible_wall)) {
   while (!place_meeting(x + sign(hspeed), y, obj_invisible_wall)) {
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

if (place_meeting(x, y + vspeed, obj_invisible_wall)) {
   while (!place_meeting(x, y + sign(vspeed), obj_invisible_wall)) {
       y += sign(vspeed);
   }
   
   vspeed = 0;
}

var pl = instance_place(x, y + vspeed, obj_platform_small);
if (pl != noone) {
   if (pl.y > y + 12) {
	   while (!place_meeting(x, y + sign(vspeed), obj_platform_small)) {
           y += sign(vspeed);
	   }
   vspeed = 0;
   }
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

if (place_meeting(x + hspeed, y + vspeed, obj_invisible_wall)) {
   while (!place_meeting(x + sign(hspeed), y + sign(vspeed), obj_invisible_wall)) {
       x += sign(hspeed);
       y += sign(vspeed);
   }
   hspeed = 0;
   vspeed = 0;
}

if (hspeed != 0)
	facing = sign(hspeed);
else
{
	if (move_input_total != 0)
		facing = sign(move_input_total)
	else
		facing = 1;
}


gun_direction_actual = sign(mouse_x - x) * arccos((y - mouse_y)/sqrt((mouse_y - y)*(mouse_y - y) + (mouse_x - x)*(mouse_x - x)));
gun_direction_animated = round(gun_direction_actual / pi * 4);

if (x > 1280)
{
	with(all)
	{
		if ((object_get_name(object_index) == "obj_bullet") || (object_get_name(object_index) == "obj_robot_bullet"))
			real_x -= 640;
		else
			x -= 640;
	}
	gone_right();
	clean_up_teleport();
	if (global.current_zone == 0)
	{
		clear_hub();
		construct_hub(1);
	}
	//show_debug_message(string(global.left_zone) + string(global.current_zone) + string(global.right_zone));
	
}

if (x < 640)
{
	with(all)
	{
		if ((object_get_name(object_index) == "obj_bullet") || (object_get_name(object_index) == "obj_robot_bullet"))
			real_x += 640;
		else
			x += 640;
	}
	gone_left();
	clean_up_teleport();
	if (global.current_zone == 0)
	{
		clear_hub();
		construct_hub(1);
	}
	//show_debug_message(string(global.left_zone) + string(global.current_zone) + string(global.right_zone));
}

if ((abs(hspeed) > idle_animation_margin)&&(!audio_is_playing(snd_steps)))
{
	audio_play_sound(snd_steps, 0, true);
}
if (abs(hspeed) <= idle_animation_margin)
{
	audio_stop_sound(snd_steps);
}

// Speed debug
/*show_debug_message("HInput: " + string(move_input_total));
show_debug_message("Jump Buffer Count: " + string(jump_buffer_count));
show_debug_message("-global.world_hspeed: " + string(-global.world_hspeed));
show_debug_message("-global.world_vspeed: " + string(-global.world_hspeed));*/

var bg = layer_get_id("Background");
layer_x(bg, x - 160);
camera_set_view_pos(view_camera[0], x - 160, camera_get_view_y(view_camera[0]))