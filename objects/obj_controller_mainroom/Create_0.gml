global.current_zone = 0;
global.left_zone = 7;
global.right_zone = 1;
global.wave = 0;
global.healthbar = 3;
global.ammo = 10;

instance_create_depth(0, 0, -100, obj_cursor_control);
instance_create_depth(960, 128, -50, obj_char);

display_set_gui_size(320, 180);

clean_up_teleport();