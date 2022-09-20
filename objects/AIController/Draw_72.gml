if (grid != -1 && !surface_exists(surface)) {
	
	surface = surface_create(ds_grid_width(grid), ds_grid_height(grid));
	surface_set_target(surface);

	draw_clear_alpha(c_white, 1);
	
	for (var yy = 0; yy < ds_grid_height(grid); yy++) {
		
		for (var xx = 0; xx < ds_grid_width(grid); xx++) {
			
			switch (ds_grid_get(grid, xx, yy)) {
				case -2:
					draw_set_color(c_white);
					break;
				
				case 1:
					draw_set_color(c_green);
					break;
				
				case 2:
					draw_set_color(c_red);
					break;
				
				case 3:
					draw_set_color(c_orange);
					break;
				
				case 4:
					draw_set_color(c_purple);
					break;
					
				case 9:
					draw_set_color(c_black);
					break;
				
				default:
					draw_set_color(c_aqua);
					break;
			}
			
			draw_rectangle(xx, yy, xx + 1, yy + 1, false);
			
		}
		
	}

	surface_reset_target();
	
}
