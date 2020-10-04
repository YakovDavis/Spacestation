var left = 0;
var width = 45;

if (!left_bolt)
	left = 8;
if (!right_bolt)
	width = 37 - left;

draw_sprite_part(spr_platform_small, 0, left, 0, width, 7, x, y);