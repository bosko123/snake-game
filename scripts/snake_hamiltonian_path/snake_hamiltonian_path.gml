// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function snake_hamiltonian_path(grid) {
	
	if (ds_grid_width(grid) mod 2 == 1 && ds_grid_height(grid) mod 2 == 1) 
		return undefined;
	
	// start position
	var x_coord = 0;
	var y_coord = 0;
	
	// move direction
	var x_move = 1;
	var y_move = 1;
	
	// current movement direction
	var vertical = false;
	
	// array for path nodes
	var array_len = ds_grid_width(grid) * ds_grid_height(grid);
	var array;
	
	// loop through path nodes array
	for (var i = 0; i < array_len; i++) {
		
		// check is current movement is vertical
		if (vertical) {
			
			// check if current direction is up and y location is 2nd row
			// or direction is down and y location is bottom row
			if ((y_coord == 1 && y_move == -1) || (y_coord + 1 == ds_grid_height(grid) && y_move == 1)) {
				
				// check if location is on 2nd row
				if (y_coord == 1) {
					
					// set y direction to down
					y_move = 1;
					
				}
				else {
					
					// set y direction to up
					y_move = -1;
					
				}
				
				// set current movement direction to horizontal
				vertical = false;
				
				// check if width of playing field is odd
				if (ds_grid_width(grid) mod 2 == 1) {
					
					// check if x location is 2nd last column
					if (x_coord + 2 == ds_grid_width(grid)) {
						
						// set x direction to right
						x_move = 1;
						
					}
					// check if x location is last column
					else if (x_coord + 1 == ds_grid_width(grid)) {
						
						// set x direction to left
						x_move = -1;
						
					}
					
				}
				
			}
			// check if current y location is between 1st and last row
			else if (y_coord > 0 && y_coord < ds_grid_height(grid)) {
				
				// check if width of playing field is odd
				if (ds_grid_width(grid) mod 2 == 1) {
					
					// check is current x location is 2nd last or last column
					if (x_coord + 2 == ds_grid_width(grid) || x_coord + 1 == ds_grid_width(grid)) {
						
						// check if x location is 2nd last column
						if (x_coord + 2 == ds_grid_width(grid)) {
							
							// set x direction to right
							x_move = 1;
							
						}
						// check if x location is last column
						else if (x_coord + 1 == ds_grid_width(grid)) {
							
							// set x direction to left
							x_move = -1;
							
						}
						
						// set current movement direction to horizontal
						vertical = false;
						
					}
					
				}
				
			}
			
		}
		else {
			
			// check if current y location is on 1st row and
			// current x location is on last column
			if (y_coord == 0 && x_coord + 1 == ds_grid_width(grid)) {
				
				// set current movement direction to vertical
				vertical = true;
				
				// set y direction to down and x direction to left
				y_move = 1;
				x_move = -1;
				
			}
			else if (y_coord > 0) {
				
				// set x direction to left
				x_move = -1;
				
				// set current movement direction to vertical
				vertical = true;
				
				// check if width of playing field is odd
				if (ds_grid_width(grid) mod 2 == 1) {
					
					// check if current y location is on last row and
					// current x location is 2nd last or last column
					if (y_coord + 1 == ds_grid_height(grid) && (x_coord + 1 == ds_grid_width(grid) || x_coord + 2 == ds_grid_width(grid))) {
						
						vertical = false;
						
					}
					
				}
				
			}
			
		}
		
		// get a node from node grid
		var node = ds_grid_get(grid, x_coord, y_coord);
		
		// set current array index to the node and
		// add node to array at current index
		node.index = i;
		array[i] = node;
		
		// update node values
		snake_hamiltonian_path_update_nodes(array, node, array_len, i);
		
		if (vertical) {
			y_coord += y_move;
		}
		else {
			x_coord += x_move;
		}
		
	}
	
	return array;
	
}

function snake_hamiltonian_path_update_nodes(array, node, array_len, index) {
	
	// check current node is not the first or is the last in array
	if (index > 0 || index + 1 == array_len) {
		
		// get previous node in array
		var prev_node = array[index - 1];
		
		// link current and previous nodes between themselves
		prev_node.next = node;
		node.prev = prev_node;
		
		// check if current node is the last one
		if (index + 1 == array_len) {
			
			// get first node in array
			var first_node = array[0];
			
			// link first and previous nodes between themselves
			first_node.prev = node;
			node.next = first_node;
				
		}
			
	}
	
}
