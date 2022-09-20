// release all keys
keyboard_key_release(keyboard_key);

// if ai needs grid, create it
if (grid != -1) {
	snake_to_grid(grid, apply_collision_predictions);
}
