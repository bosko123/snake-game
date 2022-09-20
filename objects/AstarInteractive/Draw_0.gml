if (surface_exists(path_surface)) {
	
	draw_surface_ext(path_surface, 0, 0, 1, 1, 0, c_white, 1);
	
}

var multiplier = 50;
draw_set_font(Font2);
draw_set_color(c_red);

for (var i = 0; i < ds_list_size(opened_nodes); i++) {
	
	var node = ds_list_find_value(opened_nodes, i);
	
	if (node.x_coord == mouse_x div 50 && node.y_coord == mouse_y div 50) {
		
		draw_set_font(Font);
		draw_set_color(c_yellow);
		
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2, string(int64(node.f_cost * 10)));
		
		draw_set_font(Font2);
		draw_set_color(c_red);
		
		continue;
		
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2 - 24, "g: " + string(int64(node.g_cost * 10)));
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2 + 24, "h: " + string(int64(node.h_cost * 10)));
	
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2, "f: " + string(int64(node.f_cost * 10)));
	
}

draw_set_color(c_green);

for (var i = 0; i < ds_list_size(closed_nodes); i++) {
	
	var node = ds_list_find_value(closed_nodes, i);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2 - 24, "g: " + string(int64(node.g_cost * 10)));
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2 + 24, "h: " + string(int64(node.h_cost * 10)));
	
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_text(node.x_coord * multiplier + multiplier / 2, node.y_coord * multiplier + multiplier / 2, "f: " + string(int64(node.f_cost * 10)));
	
}
