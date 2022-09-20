// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_ai_circle_square_check(snake_location, corners) {
	// this function checks, if snake is already on the path
	
	// check if snake is located in any edge of current radius
	var left = snake_check_edge_vertical(snake_location, corners[0], corners[2]);
	var top = snake_check_edge_horizontal(snake_location, corners[0], corners[1]);
	var right = snake_check_edge_vertical(snake_location, corners[1], corners[3]);
	var bottom = snake_check_edge_horizontal(snake_location, corners[2], corners[3]);
	
	return left || top || right || bottom;
	
}

function snake_check_edge_vertical(snake_location, corner1, corner2) {
	
	// check if snake's location lines up with both corners on y axis
	if (snake_location[0] == corner1[0] && snake_location[0] == corner2[0]) {
		
		// check if snake's location is between both corners on y axis 
		if ((snake_location[1] >= corner1[1] && snake_location[1] <= corner2[1]) || (snake_location[1] >= corner2[1] && snake_location[1] <= corner1[1])) {
			
			return true;
			
		}
		
	}
	
	return false;
	
}

function snake_check_edge_horizontal(snake_location, corner1, corner2) {
	
	// check if snake's location lines up with both corners on y axis
	if (snake_location[1] == corner1[1] && snake_location[1] == corner2[1]) {
		
		// check if snake's location is between both corners on x axis 
		if ((snake_location[0] >= corner1[0] && snake_location[0] <= corner2[0]) || (snake_location[0] >= corner2[0] && snake_location[0] <= corner1[0])) {
			
			return true;
			
		}
		
	}
	
	return false;
	
}
