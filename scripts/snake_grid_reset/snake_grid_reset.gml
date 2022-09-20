// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_grid_reset(grid) {
	
	// set all field in grid with -1
	for (var i = 0; i < ds_grid_height(grid); i++) {
		
		for (var j = 0; j < ds_grid_width(grid); j++) {
			
			ds_grid_set(grid, j, i, -1);
			
		}
		
	}
	
}