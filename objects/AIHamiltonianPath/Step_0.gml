event_inherited();

if (!change_direction)
	return;

// snake (head) x and y
var snake_x = (snake.x - global.grid_offset_x) div 32;
var snake_y = (snake.y - global.grid_offset_y) div 32;

var node = ds_grid_get(grid, snake_x, snake_y);

if (node.prev.x_coord != node.next.x_coord && node.prev.y_coord != node.next.y_coord) {
	
	if (snake.direction == 0 || snake.direction == 180) {
		
		if (node.next.y_coord < node.y_coord || node.prev.y_coord < node.y_coord) {
			snake_new_direction(snake, 90);
		}
		else {
			snake_new_direction(snake, 270);
		}
		
	}
	else {
		
		if (node.next.x_coord < node.x_coord || node.prev.x_coord < node.x_coord) {
			snake_new_direction(snake, 180);
		}
		else {
			snake_new_direction(snake, 0);
		}
		
	}
	
}
else if (node.prev.x_coord != node.next.x_coord && node.prev.y_coord == node.next.y_coord) {
	
	if (snake.direction == 90) {
		
		snake_new_direction(snake, 0);
		
	}
	else {
		
		snake_new_direction(snake, 180);
		
	}
	
}
else if (node.prev.x_coord == node.next.x_coord && node.prev.y_coord != node.next.y_coord) {
	
	if (snake.direction == 0) {
		
		snake_new_direction(snake, 90);
		
	}
	else {
		
		snake_new_direction(snake, 270);
		
	}
	
}

change_direction = false;
