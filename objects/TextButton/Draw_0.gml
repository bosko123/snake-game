event_inherited();

draw_set_font(Font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (!pressed) {
	draw_text(x + (sprite_width / 2), y + (sprite_height / 2), text);
}
else {
	draw_text(x + (sprite_width / 2) + 2, y + (sprite_height / 2) + 2, text);
}
