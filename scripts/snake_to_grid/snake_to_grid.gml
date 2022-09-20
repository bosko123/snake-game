// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_to_grid(grid, collisions) {
	
	// prepair grid
	for (var yy = 0; yy < ds_grid_height(grid); yy++) {
		
		for (var xx = 0; xx < ds_grid_width(grid); xx++) {
			
			ds_grid_set(grid, xx, yy, -1);
			
		}
		
	}
	
	// find instance of food
	var foor_instance = instance_find(Food, 0);
	
	// calculate location of the food on the grid
	var food_x = (foor_instance.x - global.grid_offset_x) div 32;
	var food_y = (foor_instance.y - global.grid_offset_y) div 32;
	
	ds_grid_set(grid, food_x, food_y, 9);
	
	//show_debug_message(instance_number(SnakePart));
	
	// loop through all instances of SnakePart object
	for (var n = 0; n < instance_number(SnakePart); n++) {
		
		// for each calculate location on the grid
		var snake_part = instance_find(SnakePart, n);
		
		var snake_x = (snake_part.x - global.grid_offset_x) div 32;
		var snake_y = (snake_part.y - global.grid_offset_y) div 32;
		
		// set value 1 to grid at their position
		ds_grid_set(grid, snake_x, snake_y, 1);
		
	}
	
	if (collisions) {
		
		// get posible movement direction location for the head
		var head = instance_find(SnakeHead, 0);
		
		var forward = predict_collisions(grid, head.direction, head);
		var backward = predict_collisions(grid, head.direction + 180, head);
		var side0 = predict_collisions(grid, head.direction + 90, head);
		var side1 = predict_collisions(grid, head.direction + 270, head);
		
		// depending on condition of snake position
		// set 3 for viable direction and 4 for collision
		if (forward[2] == -1) {
			ds_grid_set(grid, forward[0], forward[1], 3);
			ds_grid_set(grid, backward[0], backward[1], 3);
		}
		else if (forward[2] == 1) {
			ds_grid_set(grid, forward[0], forward[1], 4);
			ds_grid_set(grid, backward[0], backward[1], 4);
		}
		
		if (side0[2] == -1) {
			ds_grid_set(grid, side0[0], side0[1], 3);
		}
		else if (side0[2] == 1) {
			ds_grid_set(grid, side0[0], side0[1], 4);
		}
		
		if (side1[2] == -1) {
			ds_grid_set(grid, side1[0], side1[1], 3);
		}
		else if (side1[2] == 1) {
			ds_grid_set(grid, side1[0], side1[1], 4);
		}
		
	}
	
}

function predict_collisions(grid, angle, head) {
	
	// prepair array
	var array;
	
	// calculate x location with given angle
	var xx = ((head.x - global.grid_offset_x) div 32) + dcos(angle);
	
	// fix index, if it's out of bounds
	if (xx < 0)
		xx = ds_grid_width(grid) - 1;
	if (xx >= ds_grid_width(grid))
		xx = 0;
	
	// calculate y location with given angle
	var yy = ((head.y - global.grid_offset_y) div 32) - dsin(angle);
	
	// fix index, if it's out of bounds
	if (yy < 0)
		yy = ds_grid_height(grid) - 1;
	if (yy >= ds_grid_height(grid))
		yy = 0;
	
	// return direction location and value on the grid
	// at that position
	array[0] = xx;
	array[1] = yy;
	array[2] = ds_grid_get(grid, xx, yy);
	
	return array;
	
}
