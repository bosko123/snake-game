grid = ds_grid_create(40, 40);
path_grid = ds_grid_create(40, 40);
n_grid = ds_grid_create(40, 40);

snake_prepair_nodes(n_grid);

path = -1;
skip = false;

path_surface = -1;
apply_collision_predictions = false;
node_index = 0;

end_node = {
	x_coord : 39,
	y_coord : 12,
	g_cost : point_distance(39, 12, 19, 19),
	h_cost : 0,
	f_cost : point_distance(39, 12, 19, 19),
	previous : -1
}
		
start_node = {
	x_coord : 19,
	y_coord : 19,
	g_cost : 0,
	h_cost : point_distance(19, 19, 39, 12),
	f_cost : point_distance(19, 19, 39, 12),
	previous : -1
}

ds_grid_set(n_grid, end_node.x_coord, end_node.y_coord, end_node);
ds_grid_set(n_grid, start_node.x_coord, start_node.y_coord, start_node);

opened_nodes = ds_list_create();
ds_list_add(opened_nodes, start_node);
	
closed_nodes = ds_list_create();
current_cost = 0;

ds_grid_set(grid, 19, 19, 1);

final_node = -1;
cheapest = false;
