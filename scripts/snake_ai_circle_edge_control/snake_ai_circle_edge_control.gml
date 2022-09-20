// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_ai_circle_edge_control(head_location, edge_corner, snake_dir) {
	
	if (head_location[1] == edge_corner[0][1]) {
		
		if (snake_dir == 90 || snake_dir == 270) {
			
			if (head_location[0] > edge_corner[0][0]) {
				
				//keyboard_key_press(ord("A"));
				snake_new_direction(snake, 180);
				
			}
			else {
				
				//keyboard_key_press(ord("D"));
				snake_new_direction(snake, 0);
				
			}
			
		}
		
	}
	else if (head_location[0] == edge_corner[0][0]) {
		
		if (snake_dir == 0 || snake_dir == 180) {
			
			if (head_location[1] > edge_corner[0][1]) {
				
				//keyboard_key_press(ord("W"));
				snake_new_direction(snake, 90);
				
			}
			else {
				
				//keyboard_key_press(ord("S"));
				snake_new_direction(snake, 270);
				
			}
			
		}
		
	}
	
}