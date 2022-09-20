draw_set_color(c_white);
draw_set_font(Stats_Font);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

var spr_width = sprite_get_width(spr_stats);
var spr_height = sprite_get_height(spr_stats);

var spr_x = global.grid_offset_x + (global.grid_offset_y - (spr_height * 2)) / 2;
var spr_y = (global.grid_offset_y - (spr_height * 2)) / 2;

draw_sprite_ext(spr_stats, 1, spr_x, spr_y, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_stats, 2, spr_x * 2 + spr_width * 2, spr_y, 2, 2, 0, c_white, 1);

draw_text(spr_x + (69 + 64) * 2, spr_y + spr_height, string(snake.snake_length + 1));
draw_text(2 * spr_x + (69 + 64) * 2 + spr_width * 2, spr_y + spr_height, string(snake.current_speed));
