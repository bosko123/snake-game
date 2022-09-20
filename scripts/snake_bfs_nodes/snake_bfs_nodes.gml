// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_bfs_node_neighbours(grid, base_node){
	
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
		nodes[index] = ds_grid_get(grid, node_coords[0], node_coords[1]);
		index++;
		
	}
	
	// return nodes
	return nodes;
	
}
