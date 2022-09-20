// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_closest(grid, location, corners) {
	
	// prepair variables for searching closest corner
	var closest;
	closest[0] = -1;
	closest[1] = -1;
	closest[2] = point_distance(0, 0, ds_grid_width(grid), ds_grid_height(grid));
	
	// loop through corners
	for (var i = 0; i < array_length(corners); i++) {
		
		// calculate distance between corner and specific location
		var tmp_distance = point_distance(location[0], location[1], corners[i][0], corners[i][1]);
		
		// if current distance is lower then previous, memorize it.
		if (tmp_distance < closest[2]) {
			
			closest[0] = corners[i];
			closest[1] = i;
			closest[2] = tmp_distance;
			
		}
		
	}
	
	return closest;
	
}

function snake_same_coords(coords1, coords2) {
	
	// loop through all coordinates of both locations
	for (var i = 0; i < array_length(coords1); i++) {
		
		// compare if any coordinate is different from 2 locations
		if (coords1[i] != coords2[i]) {
			
			return false;
			
		}
		
	}
	
	return true;
	
}
