// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
 function snake_ai_circle_outside_control(head_location, edge_corner, snake_dir) {
	
	switch (edge_corner[1]) {
		
		// top left corner
		case 0:
			if (head_location[0] < edge_corner[0][0] || head_location[1] < edge_corner[0][1]) {
				if (snake_dir == 90) {
					//keyboard_key_press(ord("D"));
					snake_new_direction(snake, 0);
				}
				if (snake_dir == 180) {
					//keyboard_key_press(ord("S"));
					snake_new_direction(snake, 270);
				}
			}
			break;
			
		// top right corner
		case 1:
			if (head_location[0] > edge_corner[0][0] || head_location[1] < edge_corner[0][1]) {
				if (snake_dir == 0) {
					//keyboard_key_press(ord("S"));
					snake_new_direction(snake, 270);
				}
				if (snake_dir == 90) {
					//keyboard_key_press(ord("A"));
					snake_new_direction(snake, 180);
				}
			}
			break;
		
		// bottom left
		case 2:
			if (head_location[0] < edge_corner[0][0] || head_location[1] > edge_corner[0][1]) {
				if (snake_dir == 180) {
					//keyboard_key_press(ord("W"));
					snake_new_direction(snake, 90);
				}
				if (snake_dir == 270) {
					//keyboard_key_press(ord("D"));
					snake_new_direction(snake, 0);
				}
			}
			break;
		
		// bottom right
		case 3:
			if (head_location[0] > edge_corner[0][0] || head_location[1] > edge_corner[0][1]) {
				if (snake_dir == 0) {
					//keyboard_key_press(ord("W"));
					snake_new_direction(snake, 90);
				}
				if (snake_dir == 270) {
					//keyboard_key_press(ord("A"));
					snake_new_direction(snake, 180);
				}
			}
			break;
		
	}
	
}