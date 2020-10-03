/// @description Init Vars

// Player Vars
move_rate = 4;
jump_rate = 4;
jump_buffer_count = 0;
jump_buffer = 10;
jump_ledge_buffer = 10;
accel_rate_ground = 0.3;
accel_rate_air = 0.2;
brake_rate_ground = 0.4;
brake_rate_air = 0.2;
gravity_vspeed = 8;
gravity_rate = 0.2;
run_frame = 0.0;
facing = 1;
run_animation_speed = 0.5;
idle_animation_margin = 0.2

// Controls
control_left = ord("A");
control_right = ord("D");
control_jump = vk_space;

// Alternate Controls
control_left_alt = vk_left;
control_right_alt = vk_right;
control_jump_alt = vk_up;