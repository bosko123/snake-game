// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_prepair_nodes(grid) {
	
	for (var yy = 0; yy < ds_grid_height(grid); yy++) {
		
		for (var xx = 0; xx < ds_grid_width(grid); xx++) {
			
			var node = snake_node(xx, yy);
			ds_grid_set(grid, xx, yy, node);
			
		}
		
	}
	
}

function snake_node(node_x, node_y) {
	
	var node = {
		x_coord : node_x, 
		y_coord : node_y, 
		g_cost : undefined, 
		h_cost : undefined, 
		f_cost : undefined,
		explored : false,
		goal : false,
		previous : -1
	}
	
	return node;
	
}
