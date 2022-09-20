// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_bfs_find_path(grid, n_grid, start_node) {
	
	var queue = ds_queue_create();
	
	ds_queue_enqueue(queue, start_node);
	start_node.explored = true;
	
	while (!ds_queue_empty(queue)) {
		
		var node = ds_queue_dequeue(queue);
		if (node.goal) {
			
			ds_queue_destroy(queue);
			return node;
			
		}
		
		var neighbours = snake_bfs_node_neighbours(n_grid, node);
		
		for (var i = 0; i < array_length(neighbours); i++) {
			
			var neighbour = neighbours[i];
			
			if (!neighbour.explored) {
				
				neighbour.explored = true;
				
				if (ds_grid_get(grid, neighbour.x_coord, neighbour.y_coord) == 1 || ds_grid_get(grid, neighbour.x_coord, neighbour.y_coord) == 7)
					continue;
				
				neighbour.previous = node;
				ds_queue_enqueue(queue, neighbour);
				
			}
			
		}
		
	}
	
	ds_queue_destroy(queue);
	
	return -1;
	
}