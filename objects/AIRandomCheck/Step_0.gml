event_inherited();

if (change_direction) {
	
	change_direction = false;
	
	// get all (4) directions locations for next move 
	var all_directions;
	var n = 0;
	
	// loop through all (4) possible indices
	for (var i = 0; i < 4; i++) {
		
		// for each index get possible direction location
		var dir = snake_grid_direction(grid, i);
		
		var xx = dir[0];
		var yy = dir[1];
		
		// get value in given direction, position
		var val = ds_grid_get(grid, xx, yy);
		
		// if value is equal to 4 (not available direction, possible collision), 
		// skip next part of the loop
		if (val == 4) {
			all_directions[i][0] = -1;
			continue;
		}
		
		// save values for later in all_directions
		all_directions[i][0] = i;
		all_directions[i][1] = val;
		all_directions[i][2] = xx;
		all_directions[i][3] = yy;
		
		// n stores number of available direction
		n++;
		
	}
	
	// if there is none available directions
	// skip entire next part of the code
	if (n == 0) {
		return;
	}
	
	// prepair array for filtering only available direction
	var allowed_directions;
	var j = 0;
	
	// loop through all_directions array
	for (var i = 0; i < 4; i++) {
		
		// if first value of current direction is equal -1, then skip it
		if (all_directions[i][0] == -1) {
			continue;
		}
		
		// add direction from all_directions to allowed_directions
		allowed_directions[j] = all_directions[i];
		j++;
		
	}
	
	//show_debug_message(string(allowed_directions) + " " + string(n));
	
	// from allowed_directions select random index
	var random_index = irandom(n - 1);
	var random_value = allowed_directions[random_index][0];
	//show_debug_message(random_value);
	
	var snake_dir = random_value * 90;
	snake_new_direction(snake, snake_dir);
	
	// depanding on random index simulate key press
	/*switch (random_value) {
		case 0:
			keyboard_key_press(ord("D"));
			break;
		case 1:
			keyboard_key_press(ord("W"));
			break;
		case 2:
			keyboard_key_press(ord("A"));
			break;
		default:
			keyboard_key_press(ord("S"));
			break;
	}*/
	
}
