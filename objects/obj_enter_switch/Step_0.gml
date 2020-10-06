can_be_pressed = (instance_find(obj_zombie, 0) == noone) && (instance_find(obj_slime, 0) == noone) && (instance_find(obj_sentry, 0) == noone);

if (can_be_pressed)
{
	if ((global.px-x)*(global.px-x) + (global.py-y)*(global.py-y) < 500)
		selected = true;
	else
		selected = false;
}
else
	selected = false;

if (frame > 0)&&(frame < 3)
{
	frame += 0.1;
}