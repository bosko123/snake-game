
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_ai_circle_border_control(head_location, corners, closest_corner) {
	
	// check if snake is on the path
	if (snake_ai_circle_square_check(head_location, corners)) {
		
		// check if radius changed flag is true
		if (radius_changed) {
			
			// set start position to snake's current position
			start_position = head_location;
			
			// set radius changed flag to false
			radius_changed = false;
			
			// check if distance from snake to corner is 1
			if (closest_corner[2] == 1) {
				
				// if corner's x value is the same as start position
				if (start_position[0] == closest_corner[0][0]) {
					
					// move start position on y axis by 1 away from the corner
					var bool_y = start_position[1] < closest_corner[0][1];
					start_position[1] = bool_y ? start_position[1] - 1 : start_position[1] + 1;
					
				}
				// if corner's y value is the same as start position
				else if (start_position[1] == closest_corner[0][1]) {
					
					// move start position on x axis by 1 away from the corner
					var bool_y = start_position[0] < closest_corner[0][0];
					start_position[0] = bool_y ? start_position[0] - 1 : start_position[0] + 1;
					
				}
				
			}
			
			//show_debug_message(snake_closest(grid, start_position, corners));
			//show_debug_message(start_position);
			
		}
		else {
			// if radius changed flag wasn't changed to false
			
			// check if snake position is located on start position
			// this means snake made full treversal across the path
			if (head_location[0] == start_position[0] && head_location[1] == start_position[1]) {
				
				// if skip flag was trigered 
				if (skip) {
					
					// reset radius
					radius_x = start_radius_x;
					radius_y = start_radius_y;
					
					// set skip flag to false
					skip = false;
					
				}
				
				// set radius changed flag to true
				radius_changed = true;
				
				// reset start position
				start_position = -1;
				
				// if x radius doesn't equal to max x radius
				if (radius_x != max_radius_x) {
					
					// increment/decrement x radius by radius resize mode
					radius_x += radius_resize;
					
				}
				
				if (radius_y != max_radius_y) {
					
					// increment/decrement y radius by radius resize mode
					radius_y += radius_resize;
					
				}
				
				if (radius_x == max_radius_x && radius_y == max_radius_y) {
					
					// set skip flag to true
					skip = true;
					
					// set radius resize mode to decremental
					radius_resize = -1;
					
				}
				else if (radius_x == min_radius_x || radius_y == min_radius_y) {
					
					// set radius resize mode to incremental
					radius_resize = 1;
					
				}
				
			}
			
		}
		
	}
	
	// save current snake's length, it is not save yet
	if (current_length == -1) {
		
		current_length = snake_get_length();
		
	}
	// if snake's length changed, reset path
	else if (current_length != snake_get_length()) {
		
		// update saved snake's length
		current_length = snake_get_length();
		
		// reset radius
		radius_x = start_radius_x;
		radius_y = start_radius_y;
		
		skip = false;
		
		// set radius changed flag to 0
		radius_changed = true;
		
		// set radius resize mode to incremental
		radius_resize = 1;
		
	}
	
}