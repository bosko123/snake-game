if (surface_exists(surface)) {
	
	var multiplier = 4;
	var x_offset = ds_grid_width(grid) * multiplier;
	
	draw_surface_ext(surface, global.grid_width - x_offset, 0, multiplier, multiplier, 0, c_white, 1);
	
}
