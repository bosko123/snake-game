event_inherited();

grid = ds_grid_create(global.grid_width div 32, global.grid_height div 32);
//grid = ds_grid_create(4, 6);
snake_hamiltonian_path_prepair_grid(grid);

nodes_number = ds_grid_width(grid) * ds_grid_height(grid);

hamiltonian_path = snake_hamiltonian_path(grid);

global.ai_type = "AIHamiltonian";
