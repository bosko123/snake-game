// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_grid_location() {
	
	// get snake head instance
	var head = instance_find(SnakeHead, 0);
	
	// get snake location on the grid
	var location;
	
	location[0] = (head.x - global.grid_offset_x) div 32;
	location[1] = (head.y - global.grid_offset_y) div 32;
	
	// return location
	return location;
	
}

function snake_direction() {
	
	// get snake head instance
	var head = instance_find(SnakeHead, 0);
	
	// return direction
	return head.direction;
	
}

function snake_get_length() {
	
	// get snake head instance
	var head = instance_find(SnakeHead, 0);
	
	// return direction
	return head.snake_length;
	
}

function snake_grid_direction(grid, angle_index) {
	
	// calculate angle from angle index
	var angle = angle_index * 90;
	var location = snake_grid_location();
	
	// calculate x location with given angle
	var xx = location[0] + dcos(angle);
	
	// fix index, if it's out of bounds
	if (xx < 0)
		xx = ds_grid_width(grid) - 1;
	if (xx >= ds_grid_width(grid))
		xx = 0;
	
	// calculate y location with given angle
	var yy = location[1] - dsin(angle);
	
	// fix index, if it's out of bounds
	if (yy < 0)
		yy = ds_grid_height(grid) - 1;
	if (yy >= ds_grid_height(grid))
		yy = 0;
	
	// return direction
	var dir;
	
	dir[0] = xx;
	dir[1] = yy;
	
	return dir;
	
}

function snake_grid_direction_border(grid, angle_index, location) {
	
	// calculate angle from angle index
	var angle = angle_index * 90;
	
	// calculate x location with given angle
	var xx = location[0] + dcos(angle);
	
	// if it's out of bounds, return -1
	if (xx < 0 || xx >= ds_grid_width(grid))
		return -1;
	
	// calculate y location with given angle
	var yy = location[1] - dsin(angle);
	
	// if it's out of bounds, return -1
	if (yy < 0 || yy >= ds_grid_height(grid))
		return -1;
	
	// return direction
	var dir;
	
	dir[0] = xx;
	dir[1] = yy;
	
	return dir;
	
}
