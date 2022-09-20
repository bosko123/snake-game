// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_horizontal(x0, y0, x1, y1, x2, y2) {
	
	// check if coords are in streight line vertically and horizontally
	var x_part = all_equal(x0, x1, x2) && all_not_equal(y0, y1, y2);
	var y_part = all_not_equal(x0, x1, x2) && all_equal(y0, y1, y2);
	
	return x_part || y_part;
	
}

function all_equal(c0, c1, c2) {
	
	return c0 == c1 && c1 == c2;
	
}

function all_not_equal(c0, c1, c2) {
	
	return c0 != c1 && c0 != c2 && c1 != c2;
	
}
