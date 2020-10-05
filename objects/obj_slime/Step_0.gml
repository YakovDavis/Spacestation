if ((x-global.px)*(x-global.px)+(y-global.py)*(y-global.py) < 1000)
	triggered = true;

move_input_total = 0;

if (triggered)&&(abs(global.px - x) > 0.5)
	move_input_total = sign(global.px - x);

if (place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_platform_small))
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_ground;
   }
}
// In air
if !(place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_platform_small))
{
   if move_input_total == 0 || (hspeed * move_input_total < 0)
   {
       hspeed -= hspeed * brake_rate_air;
   }
}

if place_meeting(x, y + 1, obj_floor)
{
   hspeed += move_input_total * accel_rate_ground;
   jumping = false;
}

var pl = instance_place(x, y + 1, obj_platform_small);
if (pl != noone) {
   if (pl.y > y + 13) {
	  hspeed += move_input_total * accel_rate_ground;
	  jumping = false;
   }
}
	   
if !(place_meeting(x, y + 1, obj_floor)||place_meeting(x, y + 1, obj_platform_small))
{
   hspeed += move_input_total * accel_rate_air;
   jumping = true;
}
hspeed = clamp(hspeed, -move_rate, move_rate);

if (vspeed < gravity_vspeed) && !place_meeting(x, y + 1, obj_floor)
{
   vspeed += gravity_rate;
}

var pl = instance_place(x, y + 1, obj_platform_small);
if (vspeed < gravity_vspeed)&&(pl != noone)
   if (pl.y > y + 13)
	   if (vspeed < gravity_vspeed)
			vspeed += gravity_rate;

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

var pl = instance_place(x, y + vspeed, obj_platform_small);
if (pl != noone) {
   if (pl.y > y + 13) {
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

facing = sign(hspeed);