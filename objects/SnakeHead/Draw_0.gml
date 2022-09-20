draw_set_color(c_gray);
draw_rectangle(0, 0, global.grid_width, global.grid_offset_y, false);

draw_set_color(c_white);
draw_set_font(Font);

draw_set_halign(fa_left);

//draw_text(20, 40, "Snake Length: " + string(snake_length + 1));
//draw_text(20, 80, "Snake Speed: " + string(current_speed));

draw_self();