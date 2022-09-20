event_inherited();

grid = ds_grid_create(global.grid_width div 32, global.grid_height div 32);
var grid_width = ds_grid_width(grid);
var grid_height = ds_grid_height(grid);
//sub_grid = -1;

// 1 - radius increases
// -1 - radius decreases
radius_resize = 1;

// min radius for x and y
min_radius_x = 0;
min_radius_y = 0;

// max radius for x and y
max_radius_x = (grid_width mod 2 == 0) ? (grid_width div 2) - 1 : (grid_width div 2);
max_radius_y = (grid_height mod 2 == 0) ? (grid_height div 2) - 1 : (grid_height div 2);

// default search radius
start_radius_x = 0;
start_radius_y = 0;

if (grid_width == grid_height) {
	
	start_radius_x = grid_width div 4;
	start_radius_y = grid_height div 4;
	
}
else if (grid_width > grid_height) {
	
	start_radius_y = grid_height div 4;
	start_radius_x = (grid_width div 2) - start_radius_y;
	
}
else {
	
	start_radius_x = grid_width div 4;
	start_radius_y = (grid_height div 2) - start_radius_x;
	
}

radius_x = start_radius_x;
radius_y = start_radius_y;

// radius control variables
radius_changed = true;
start_position = -1;
current_length = -1;

skip = false;
global.ai_type = "AICircleSquare";
