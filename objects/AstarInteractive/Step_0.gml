var cheapest_node;

if (keyboard_check_pressed(ord("C"))) {
	
	cheapest_node = snake_a_star_node_min_f_cost(opened_nodes);
	ds_grid_set(path_grid, cheapest_node.x_coord, cheapest_node.y_coord, 4);
	
}

if (mouse_check_button_pressed(mb_any) || keyboard_check_pressed(ord("Y")) || keyboard_check(ord("X"))) {
	
	var mx = mouse_x div 50;
	var my = mouse_y div 50;
	
	var node = snake_a_star_node_min_f_cost(opened_nodes);
	//var node = ds_grid_get(n_grid, mx, my);
	
	if (node.f_cost == undefined) {
		return;
	}
	
	var index = ds_list_find_index(opened_nodes, node);
	ds_grid_set(path_grid, node.x_coord, node.y_coord, 2);
	
	//show_debug_message(string(node));
	//show_debug_message(string(start_node) + ", " + string(end_node));
	
	ds_list_add(closed_nodes, node);
	ds_list_delete(opened_nodes, index);
	
	if (end_node.x_coord == node.x_coord && end_node.y_coord == node.y_coord) {
		
		final_node = node;
		return;
		
	}
	
	var neighbours = snake_a_star_node_neighbours(path_grid, start_node, end_node, node);
	//show_debug_message(neighbours);
	
	for (var i = 0; i < array_length(neighbours); i++) {
		
		var neighbour = neighbours[i];
		
		if (ds_grid_get(grid, neighbour.x_coord, neighbour.y_coord) == 1) 
			continue;
		
		if (snake_a_star_find_node(closed_nodes, neighbour) != -1) 
			continue;
		
		var tmp_index = snake_a_star_find_node(opened_nodes, neighbour);
		
		var global_node = ds_grid_get(n_grid, neighbour.x_coord, neighbour.y_coord);
		
		if (neighbour.f_cost < global_node.g_cost || tmp_index == -1) {
			
			neighbour.previous = node;
			current_cost = neighbour.f_cost;
			
			global_node.g_cost = neighbour.g_cost;
			global_node.h_cost = neighbour.h_cost;
			global_node.f_cost = neighbour.f_cost;
			global_node.previous = neighbour.previous;
			
			if (tmp_index == -1) 
				ds_list_add(opened_nodes, global_node);
			
			ds_grid_set(path_grid, global_node.x_coord, global_node.y_coord, 1);
			
		}
		
	}
	
}

if (final_node != -1) {
	
	var tmp = final_node;
	while (tmp != -1) {
		
		ds_grid_set(path_grid, tmp.x_coord, tmp.y_coord, 3);
		tmp = tmp.previous;
		
	}
	
}



ds_grid_set(path_grid, end_node.x_coord, end_node.y_coord, 3);
ds_grid_set(path_grid, start_node.x_coord, start_node.y_coord, 3);
