if (path_grid != -1 && !surface_exists(path_surface)) {
	
	var multiplier = 50;
	path_surface = surface_create(ds_grid_width(path_grid) * multiplier, ds_grid_height(path_grid) * multiplier);
	surface_set_target(path_surface);

	draw_clear_alpha(c_white, 1);
	
	for (var yy = 0; yy < ds_grid_height(path_grid); yy++) {
		
		for (var xx = 0; xx < ds_grid_width(path_grid); xx++) {
			
			switch (ds_grid_get(path_grid, xx, yy)) {
				
				case 1:
					draw_set_color(c_lime);
					break;
				
				case 2:
					draw_set_color(c_red);
					break;
				
				case 3:
					draw_set_color(c_blue);
					break;
				
				case 4:
					draw_set_color(c_orange);
					break;
				
				default:
					draw_set_color(c_aqua);
					break;
				
			}
			
			draw_rectangle(xx * multiplier, yy * multiplier, xx * multiplier + 1 * multiplier, yy * multiplier + 1 * multiplier, false);
			
			draw_set_color(c_black);
			draw_rectangle(xx * multiplier, yy * multiplier, xx * multiplier + 1 * multiplier, yy * multiplier + 1 * multiplier, true);
			
		}
		
	}

	surface_reset_target();
	
}