hspeed += sign(other.vel_x);
instance_destroy(other.id);
hp--;
if (hp < 1)
{
	instance_create_depth(x, y, -60, obj_death);
	instance_destroy();
}
is_hit = true;
alarm[0] = 5;