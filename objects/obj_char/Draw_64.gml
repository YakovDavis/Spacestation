for (var i = 0; i < global.healthbar; i++)
	draw_sprite(spr_health, 0, 5 + i * 10, 5);

draw_sprite(spr_gun_plate, 0, 1, 147);
draw_sprite(spr_pistol_icon, 0, 1, 147);
draw_set_font(font_main);
draw_set_color(c_black);
draw_text(55, 157, string(global.ammo));

draw_sprite(spr_minimap, global.current_zone, 255, 1);