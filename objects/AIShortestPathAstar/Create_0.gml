event_inherited();

grid = ds_grid_create(global.grid_width div 32, global.grid_height div 32);
path_grid = ds_grid_create(global.grid_width div 32, global.grid_height div 32);
n_grid = ds_grid_create(global.grid_width div 32, global.grid_height div 32);

//ext_grid = -1;
//ext_path_grid = ds_grid_create((global.grid_width div 32) * 3, (global.grid_height div 32) * 3);
//ext_n_grid = ds_grid_create((global.grid_width div 32) * 3, (global.grid_height div 32) * 3);
//snake_prepair_nodes(ext_n_grid);

//var grid_width = ds_grid_width(grid);
//var grid_height = ds_grid_height(grid);

path = -1;
skip = false;

path_surface = -1;
apply_collision_predictions = false;
node_index = 0;
global.ai_type = "AIAstar";
