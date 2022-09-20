event_inherited();

// get max x and y of playing area
right_grid_cell = ((global.grid_width - 1) div 16) * 16 + global.grid_offset_x;
bottom_grid_cell = ((global.grid_height - 1) div 16) * 16 + global.grid_offset_y;

// check different positions of going out of bounds
// if out of bound set position to opposite side of playing area
if (x < 16 + global.grid_offset_x) {
	if (place_meeting(right_grid_cell, y, SnakeBody)) {
		game_restart();
	}
	x = right_grid_cell;
}

if (x > right_grid_cell) {
	if (place_meeting(16 + global.grid_offset_x, y, SnakeBody)) {
		game_restart();
	}
	x = 16 + global.grid_offset_x;
}

if (y < 16 + global.grid_offset_y) {
	if (place_meeting(x, bottom_grid_cell, SnakeBody)) {
		game_restart();
	}
	y = bottom_grid_cell;
}

if (y > bottom_grid_cell) {
	if (place_meeting(x, 16 + global.grid_offset_y, SnakeBody)) {
		game_restart();
	}
	y = 16 + global.grid_offset_y;
}

image_angle = prev_direction;
