// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_bfs(grid, path_grid, n_grid, base_width, base_height, teleport) {
	
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
	
	if (path == -1 || (current_length != snake.snake_length && (array_length(path) <= node_index || path[node_index].node_key == -1))) {
		
		// reset grids
		snake_prepair_nodes(n_grid);
		snake_grid_reset(path_grid);
		snake_grid_reset(other.path_grid);
		
		// get snake grid node and food nodes
		var snake_node = ds_grid_get(n_grid, sx, sy);
		var food_locations = snake_food_positions(fx, fy, sx, sy, offset_x, offset_y);
		
		// loop through all food positions
		for (var i = 0; i < ds_list_size(food_locations); i++) {
			
			var food_location = ds_list_find_value(food_locations, i);
			var food_node = ds_grid_get(n_grid, food_location[0], food_location[1]);
			food_node.goal = true;
			
		}
		
		// reset node path
		var nodes_path = -1;
		
		// check, if teleportation mode is active
		if (teleport) {
			
			// extend the grid
			var ext_grid_props = snake_extended_grid(grid);
			
			// find the shortest path
			nodes_path = snake_bfs_find_path(ext_grid_props.ext_grid, n_grid, snake_node);
			
			// destroy extended grid
			ds_grid_destroy(ext_grid_props.ext_grid);
			
		}
		else {
			
			// find the shortest path
			nodes_path = snake_bfs_find_path(grid, n_grid, snake_node);
			
		}
		
		// check if node path was found
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
			
		}
		
		ds_list_destroy(food_locations);
		
	}
	
	// if path was found and current snake position is at current node
	if (path != -1 && sx - offset_x == path[node_index].node_x && sy - offset_y == path[node_index].node_y) {
		
		//show_debug_message(path[node_index].node_key);
		// press a key
		//keyboard_key_press(path[node_index].node_key);
		snake_new_direction(snake, path[node_index].node_key);
		node_index++;
	
	}
	
	change_direction = false;
	
}