// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_hamiltonian_path_prepair_grid(grid) {
	
	// loop though y coords of grid
	for (var yy = 0; yy < ds_grid_height(grid); yy++) {
		
		// loop though x coords of grid
		for (var xx = 0; xx < ds_grid_width(grid); xx++) {
			
			// create empty node
			var node = {
				node_id : -1,
				x_coord : xx,
				y_coord : yy,
				prev : -1,
				next : -1,
				index : -1
			};
			
			ds_grid_set(grid, xx, yy, node);
			
		}
		
	}
	
}

function snake_hamiltonian_path_node_neighbours(grid, x_coord, y_coord) {
	
	var neighbours;
	var neighbour_index;
	
	var location;
	location[0] = x_coord;
	location[1] = y_coord;
	
	for (var i = 0; i < 4; i++) {
		
		var neighbour = snake_grid_direction_border(grid, i, location);
		
		if (neighbour != -1) {
			
			neighbours[neighbour_index] = neighbour;
			neighbour_index++;
			
		}
		
	}
	
}
