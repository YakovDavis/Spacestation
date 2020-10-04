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