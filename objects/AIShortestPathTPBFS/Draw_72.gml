event_inherited();

// check if grid for a path exist and surface does not exist
if (path_grid != -1 && !surface_exists(path_surface)) {
	
	// create a surface
	path_surface = surface_create(ds_grid_width(path_grid), ds_grid_height(path_grid));
	surface_set_target(path_surface);
	
	// clear surface
	draw_clear_alpha(c_white, 1);
	
	// loop through grid
	for (var yy = 0; yy < ds_grid_height(path_grid); yy++) {
		
		for (var xx = 0; xx < ds_grid_width(path_grid); xx++) {
			
			// depending on grid value set drawing colour
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
				
				default:
					draw_set_color(c_aqua);
					break;
				
			}
			
			// draw rectangle on surface
			draw_rectangle(xx, yy, xx + 1, yy + 1, false);
			
		}
		
	}
	
	surface_reset_target();
	
}