// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_corner_index(){
	
	// This function get index for corner sprite of the body
	var prevDistanceX = round(distance_to_point(prev_part.x, y));
	var prevDistanceY = round(distance_to_point(x, prev_part.y));

	var nextDistanceX = round(distance_to_point(next_part.x, y));
	var nextDistanceY = round(distance_to_point(x, next_part.y));
	
	var n = sprite_width / 2;
	//show_debug_message("{" + string(prevDistanceX) + ", " + string(prevDistanceY) + "}" + "{" + string(nextDistanceX) + ", " + string(nextDistanceY) + "}");
	
	if (prevDistanceX == n) {
		if (nextDistanceY == n) {
			return 6;
		}
		if (nextDistanceY == n + 1) {
			return 5;
		}
	}
	
	if (prevDistanceX == n + 1) {
		if (nextDistanceY == n) {
			return 3;
		}
		if (nextDistanceY == n + 1) {
			return 4;
		}
	}
	
	if (prevDistanceY == n) {
		if (nextDistanceX == n) {
			return 6;
		}
		if (nextDistanceX == n + 1) {
			return 3;
		}
	}
	
	if (prevDistanceY == n + 1) {
		if (nextDistanceX == n) {
			return 5;
		}
		if (nextDistanceX == n + 1) {
			return 4;
		}
	}
	
	if (prevDistanceX > n && x > prev_part.x) {
		if (nextDistanceY == n) {
			return 3;
		}
		if (nextDistanceY == n + 1) {
			return 4;
		}
	}
	
	if (prevDistanceX > n && x < prev_part.x) {
		//show_debug_message("{" + string(prevDistanceX) + ", " + string(prevDistanceY) + "}" + "{" + string(nextDistanceX) + ", " + string(nextDistanceY) + "}");
		if (nextDistanceY == n) {
			return 6;
		}
		if (nextDistanceY == n + 1) {
			return 5;
		}
	}
	
	if (prevDistanceY > n && y > prev_part.y) {
		if (nextDistanceX == n) {
			return 5;
		}
		if (nextDistanceX == n + 1) {
			return 4;
		}
	}
	
	if (prevDistanceY > n && y < prev_part.y) {
		if (nextDistanceX == n) {
			return 6;
		}
		if (nextDistanceX == n + 1) {
			return 3;
		}
	}
	
	if (nextDistanceX > n && x < next_part.x) {
		if (prevDistanceY == n) {
			return 6;
		}
		if (prevDistanceY == n + 1) {
			return 5;
		}
	}
	
	if (nextDistanceX > n && x > next_part.x) {
		if (prevDistanceY == n) {
			return 3;
		}
		if (prevDistanceY == n + 1) {
			return 4;
		}
	}
	
	if (nextDistanceY > n && y < next_part.y) {
		if (prevDistanceX == n) {
			return 6;
		}
		if (prevDistanceX == n + 1) {
			return 3;
		}
	}
	
	if (nextDistanceY > n && y > next_part.y) {
		if (prevDistanceX == n) {
			return 5;
		}
		if (prevDistanceX == n + 1) {
			return 4;
		}
	}
	
	return 1;
}