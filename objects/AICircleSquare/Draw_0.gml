event_inherited();

draw_set_color(c_white);
draw_set_font(Font);

draw_set_halign(fa_left);

draw_text(500, 40, "Radius X: " + string(radius_x));
draw_text(500, 80, "Radius Y: " + string(radius_y));
