// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_a_star(grid, path_grid, n_grid, base_width, base_height, teleport) {
	
	if (!change_direction)
		return;
	
	var offset_x = 0;
	var offset_y = 0;
	
	if (teleport) {
		
		offset_x = (ds_grid_width(grid) * 3 - base_width) / 2;
		offset_y = (ds_grid_height(grid) * 3 - base_height) / 2;
		
	}
	else {
		
		offset_x = (ds_grid_width(grid) - base_width) / 2;
		offset_y = (ds_grid_height(grid) - base_height) / 2;
		
	}
	
	//show_debug_message(string(offset_x) + " " + string(offset_y));
	
	// get food and snake (head) instances
	//var fi = instance_find(Food, 0);
	//var si = instance_find(SnakeHead, 0);
	
	// food x and y
	var fx = ((food.x - global.grid_offset_x) div 32) + offset_x;
	var fy = ((food.y - global.grid_offset_y) div 32) + offset_y;
	
	// snake (head) x and y
	var sx = ((snake.x - global.grid_offset_x) div 32) + offset_x;
	var sy = ((snake.y - global.grid_offset_y) div 32) + offset_y;
	
	if (!teleport && skip) {
		
		with (SnakeHead) {
			
			if (sx == 0 && direction == 180 || sx == ds_grid_width(grid) - 1 && direction == 0 
				|| sy == 0 && direction == 90 || sy == ds_grid_height(grid) - 1 && direction == 270) {
				
				//show_debug_message("NO");
				room_restart();
				
			}
			
		}
		
	}
	
	if (skip)
		return;
	
	// distance from snake and food
	var fd = point_distance(fx, fy, sx, sy);
	var sd = point_distance(sx, sy, fx, fy);
	
	if (path != -1 && current_length != snake.snake_length && (array_length(path) <= node_index || path[node_index].node_key == -1)) {
		
		path = -1;
		
	}
	
	var food_locations = snake_food_positions(fx, fy, sx, sy, offset_x, offset_y);
	
	if (path == -1 || (current_length != snake.snake_length && path[node_index].node_key == -1)/* && ds_list_size(food_locations) > 0*/) {
		
		path = -1;
		while (path == -1) {
			
			if (ds_list_empty(food_locations)) {
				
				skip = true;
				break;
				
			}
			
			snake_prepair_nodes(n_grid);
			
			if (snake.snake_length == 157) {
				
				show_debug_message("ne")
				
			}
			
			var closest_food = snake_closest_food(food_locations);
			//var closest_food = ds_priority_delete_min(food_locations);
			
			if (closest_food != undefined) {
				
				fx = closest_food[0];
				fy = closest_food[1];
				skip = false;
				
			}
			else {
				
				skip = true;
				break;
				
			}
			
			// reset snake grid
			snake_grid_reset(path_grid);
			snake_grid_reset(other.path_grid);
			
			// food node
			var node_food = {
				x_coord : fx,
				y_coord : fy,
				g_cost : fd,
				h_cost : 0,
				f_cost : fd,
				previous : -1
			}
			
			// snake node
			var node_snake = {
				x_coord : sx,
				y_coord : sy,
				g_cost : 0,
				h_cost : sd,
				f_cost : sd,
				previous : -1
			}
			
			// find path
			var nodes_path = -1;
			if (teleport) {
				
				var ext_grid_props = snake_extended_grid(grid);
				nodes_path = snake_a_star_find_path(node_snake, node_food, ext_grid_props.ext_grid, path_grid, n_grid);
				ds_grid_destroy(ext_grid_props.ext_grid);
				
			}
			else {
				
				nodes_path = snake_a_star_find_path(node_snake, node_food, grid, path_grid, n_grid);
				
			}
			
			// check if nodes path exist
			if (nodes_path != -1) {
				
				// convert nodes path to array
				path = snake_path_nodes_to_path(nodes_path);
				snake_path_convert(path, offset_x, offset_y, base_width, base_height);
				
				for (var i = 0; i < array_length(path); i++) {
					
					ds_grid_set(other.path_grid, path[i].node_x, path[i].node_y, 2);
					
				}
				
				node_index = 0;
				current_length = snake.snake_length;
				global.path[global.index] = path;
				global.index++;
				//skip = false;
				
			}
			else {
				
				// if path couldn't be found, then skip next path searching
				path = -1;
				skip = true;
				
				if (!teleport) {
					
					with (SnakeHead) {
						
						if (sx == 0 && direction == 180 || sx == ds_grid_width(grid) - 1 && direction == 0 
							|| sy == 0 && direction == 90 || sy == ds_grid_height(grid) - 1 && direction == 270) {
							
							//show_debug_message("NO");
							room_restart();
							
						}
						
					}
					
				}
				
			}
			
			// set values on path grid for start and end
			ds_grid_set(path_grid, fx, fy, 3);
			
		}
		
	}
	
	// if path was found and current snake position is at current node
	if (path != -1 && sx - offset_x == path[node_index].node_x && sy - offset_y == path[node_index].node_y) {
		
		//show_debug_message(path[node_index].node_key);
		// press a key
		//keyboard_key_press(path[node_index].node_key);
		snake_new_direction(snake, path[node_index].node_key);
		node_index++;
	
	}
	
	ds_list_destroy(food_locations);
	change_direction = false;
	
}

function snake_path_convert(path, offset_x, offset_y, base_width, base_height) {
	
	for (var i = 0; i < array_length(path); i++) {
		
		path[i].node_x -= offset_x;
		path[i].node_y -= offset_y;
		
		if (path[i].node_x < 0) {
			
			path[i].node_x += offset_x;
			
		}
		else if (path[i].node_x >= base_width) {
			
			path[i].node_x -= offset_x;
			
		}
		else if (path[i].node_y < 0) {
			
			path[i].node_y += offset_y;
			
		}
		else if (path[i].node_y >= base_height) {
			
			path[i].node_y -= offset_y;
			
		}
		
	}
	
}
