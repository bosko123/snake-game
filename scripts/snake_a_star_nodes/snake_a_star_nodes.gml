// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_a_star_node_min_f_cost(list) {
	
	// take first node in list as cheapest node
	var min_node = ds_list_find_value(list, 0);
	
	// loop through all remaining nodes
	for (var i = 1; i < ds_list_size(list); i++) {
		
		var node = ds_list_find_value(list, i);
		
		// check if current node's f cost is lower then cheapest
		// or if f costs are the same, check if h cost is cheaper
		if (node.f_cost < min_node.f_cost || (node.f_cost == min_node.f_cost && node.h_cost < min_node.h_cost)) {
			
			// set node as cheapest
			min_node = node;
			
		}
		
	}
	
	// return cheapest node
	return min_node;
	
}

function snake_a_star_find_node(list, search_node) {
	
	// loop through all nodes in a list
	for (var i = 0; i < ds_list_size(list); i++) {
		
		var node = ds_list_find_value(list, i);
		
		// check if current node has matching x and y with searching node
		if (node.x_coord == search_node.x_coord && node.y_coord == search_node.y_coord) {
			
			// return found node index
			return i;
			
		}
		
	}
	
	// return -1 if no matching node was found
	return -1;
	
}

function snake_a_star_node_neighbours(grid, start_node, end_node, base_node) {
	
	// prepair variables
	var nodes;
	var index = 0;
	
	// location from which neighbours will be found
	var location;
	location[0] = base_node.x_coord;
	location[1] = base_node.y_coord;
	
	// loop through max 4 neighbours
	for (var i = 0; i < 4; i++) {
		
		// get coords for neighbour
		var node_coords = snake_grid_direction_border(grid, i, location);
		
		// if coords are out of bounds, skip the node
		if (node_coords == -1)
			continue;
		
		// create a node from coords
		nodes[index] = snake_a_star_node(start_node, end_node, base_node, node_coords);
		index++;
		
	}
	
	// return nodes
	return nodes;
	
}

function snake_a_star_node(start_node, end_node, base_node, node_coords) {
	
	// calculate node's g and h costs
	var g = point_distance(node_coords[0], node_coords[1], start_node.x_coord, start_node.y_coord) + base_node.g_cost;
	var h = point_distance(node_coords[0], node_coords[1], end_node.x_coord, end_node.y_coord);
	
	// create a node
	var node = snake_node(node_coords[0], node_coords[1]);
	node.g_cost = g;
	node.h_cost = h;
	node.f_cost = g + h;
	
	// return node
	return node;
	
}
