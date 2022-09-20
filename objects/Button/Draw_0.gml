draw_self();

var scaleW = sprite_width / sprite_get_width(sprite_index);
var scaleH = sprite_height / sprite_get_width(sprite_index);

draw_sprite_ext(sprite_index, -1, x, y, scaleW, scaleH, 0, color, 1);
