// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_ai_circle_square() {
	
	// get snake's head location
	var head_location = snake_grid_location();
	
	// get grid width and height
	var gw = ds_grid_width(grid);
	var gh = ds_grid_height(grid);
	
	// check for if any side of grid is even or odd
	var even_w = gw mod 2 == 0;
	var even_h = gh mod 2 == 0;
	
	// calculate center of the room
	var cx = even_w ? gw div 2 - 1 : gw div 2;
	var cy = even_h ? gh div 2 - 1 : gh div 2;
	
	// calculate all 4 corners of rectangle
	// top-left
	var c0;
	c0[0] = cx - radius_x;
	c0[1] = cy - radius_y;
	
	// top-right
	var c1;
	c1[0] = even_w ? cx + (radius_x + 1) : cx + radius_x;
	c1[1] = cy - radius_y;
	
	// bottom-left
	var c2;
	c2[0] = cx - radius_x;
	c2[1] = even_h ? cy + (radius_y + 1) : cy + radius_y;
	
	// bottom-right
	var c3;
	c3[0] = even_w ? cx + (radius_x + 1) : cx + radius_x;
	c3[1] = even_h ? cy + (radius_y + 1) : cy + radius_y;
	
	var corners;
	corners[0] = c0;
	corners[1] = c1;
	corners[2] = c2;
	corners[3] = c3;
	
	for (var i = 0; i < array_length(corners); i++) {
		
		if (ds_grid_get(grid, corners[i][0], corners[i][1]) == -1) {
			
			ds_grid_set(grid, corners[i][0], corners[i][1], -2);
			
		}
		
	}
	
	if (change_direction) {
		
		// get closest corner and snake direction
		var edge_corner = snake_closest(grid, head_location, corners);
		var snake_dir = snake_direction();
		
		// update path

		snake_ai_circle_border_control(head_location, corners, edge_corner);
		
		if (snake_same_coords(head_location, edge_corner[0])) {
			
			// change direction depending current direction when head is located on corner
			snake_ai_circle_corner_control(edge_corner, snake_dir);
			
		}
		else if (head_location[0] == edge_corner[0][0] ^^ head_location[1] == edge_corner[0][1]) {
			
			// change direction depending current direction when head is located on edge
			snake_ai_circle_edge_control(head_location, edge_corner, snake_dir);
			
		}
		else {
			
			// change direction depending current direction when head is located on outside square
			snake_ai_circle_outside_control(head_location, edge_corner, snake_dir);
			
		}
		
		change_direction = false;
		
	}
	
}