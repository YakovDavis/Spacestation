real_x += vel_x;
real_y += vel_y;

x = round(real_x);
y = round(real_y);

if ((x*x+y*y) > 5000000)
{
	instance_destroy();
}