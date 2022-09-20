event_inherited();

// Check if path surface exist
if (surface_exists(path_surface)) {
	
	var multiplier = 4;
	var x_offset = ds_grid_width(grid) * multiplier * 2 + (4 * multiplier);
	
	// Draw surface
	draw_surface_ext(path_surface, global.grid_width - x_offset, 0, multiplier, multiplier, 0, c_white, 1);
	
}
