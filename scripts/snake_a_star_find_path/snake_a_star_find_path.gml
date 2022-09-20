// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_a_star_find_path(start_node, end_node, grid, path_grid, n_grid) {
	
	// prepair opened and closed nodes lists
	// add start node to opened nodes list
	//var opened_nodes = ds_list_create();
	var opened_nodes_priority = ds_priority_create();
	//ds_list_add(opened_nodes, start_node);
	var global_start_node = ds_grid_get(n_grid, start_node.x_coord, start_node.y_coord);
	global_start_node.g_cost = start_node.g_cost;
	global_start_node.h_cost = start_node.h_cost;
	global_start_node.f_cost = start_node.f_cost;
	
	ds_priority_add(opened_nodes_priority, global_start_node, start_node.f_cost);
	
	var closed_nodes = ds_list_create();
	var current_cost = 0;
	
	var nnnn = 0;
	
	// loop until opened nodes is empty
	while (!ds_priority_empty(opened_nodes_priority) /*!ds_list_empty(opened_nodes)*/) {
		
		nnnn++;
		
		// find cheapest node in opened nodes
		// find index of cheapest node
		//var node = snake_a_star_node_min_f_cost(opened_nodes);
		var node = ds_priority_delete_min(opened_nodes_priority);
		//var index = ds_list_find_index(opened_nodes, node);
		
		//show_debug_message(string(node));
		//show_debug_message(string(start_node) + ", " + string(end_node));
		
		// add node to closed nodes
		node.explored = true;
		ds_list_add(closed_nodes, node);
		
		// remove node from opened nodes
		//ds_list_delete(opened_nodes, index);
		
		// check if node is same as end node
		// if it is return the path
		if (end_node.x_coord == node.x_coord && end_node.y_coord == node.y_coord) {
			
			//ds_list_destroy(opened_nodes);
			ds_priority_destroy(opened_nodes_priority);
			ds_list_destroy(closed_nodes);
			
			return node;
			
		}
		
		// find all neighbours
		var neighbours = snake_a_star_node_neighbours(path_grid, start_node, end_node, node);
		//show_debug_message(neighbours);
		
		// loop through all neighbours
		for (var i = 0; i < array_length(neighbours); i++) {
			
			var neighbour = neighbours[i];
			
			// check if neighbour node is not passable
			if (ds_grid_get(grid, neighbour.x_coord, neighbour.y_coord) == 1) 
				continue;
				
			if (ds_grid_get(grid, neighbour.x_coord, neighbour.y_coord) == 7) 
				continue;
			
			// get neighbour node index
			//var tmp_index = snake_a_star_find_node(opened_nodes, neighbour);
			
			// get global node in at same coords as neighbour node
			var global_node = ds_grid_get(n_grid, neighbour.x_coord, neighbour.y_coord);
			var global_priority = ds_priority_find_priority(opened_nodes_priority, global_node);
			
			// check if neighbour node is already closed
			if (global_node.explored /*snake_a_star_find_node(closed_nodes, neighbour) != -1*/) 
				continue;
			
			// check if neighbour node doesn't exist yet in opened list
			// or neighbour node's f cost is less then the global node's
			if (neighbour.f_cost < global_node.g_cost || global_priority == undefined /*tmp_index == -1*/) {
				
				neighbour.previous = node;
				current_cost = neighbour.f_cost;
				
				// set properties of global node with properties from neighbour node
				global_node.g_cost = neighbour.g_cost;
				global_node.h_cost = neighbour.h_cost;
				global_node.f_cost = neighbour.f_cost;
				global_node.previous = neighbour.previous;
				
				// if index from opened list is equal to -1
				// add neighbour node to opened list
				if (global_priority == undefined /*tmp_index == -1*/) {
					
					//ds_list_add(opened_nodes, global_node);
					ds_priority_add(opened_nodes_priority, global_node, global_node.f_cost)
					
				}
				
			}
			
		}
		
	}
	
	//ds_list_destroy(opened_nodes);
	ds_priority_destroy(opened_nodes_priority);
	ds_list_destroy(closed_nodes);
	
	return -1;
	
}