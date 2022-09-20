event_inherited();

// if snake moved, ai can change direction
if (change_direction) {
	
	// random index direction
	var random_index = irandom(3);
	
	var snake_dir = random_index * 90;
	snake_new_direction(snake, snake_dir);
	
	// depanding on random index simulate key press
	/*switch (random_index) {
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
	
	change_direction = false;
	
}
