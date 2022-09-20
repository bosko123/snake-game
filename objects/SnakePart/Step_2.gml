// depending on parent and child parts set index of image for the part
// head
if (prev_part == -1) {
	image_index = 0;
	
	if (x > next_part.x) 
		image_angle = 0;
	if (y < next_part.y)
		image_angle = 90;
	if (x < next_part.x)
		image_angle = 180;
	if (y > next_part.y)
		image_angle = 270;
	
	var distance_x = abs(next_part.x - x);
	var distance_y = abs(next_part.y - y);
	
	if (distance_x > 32 || distance_y > 32) {
		image_angle = (image_angle + 180) % 360;
	}
	
	return;
}
// tail
else if (next_part == -1 || next_part.move < 0) {
	image_index = 2;
}
else {
	// body part
	if (is_horizontal(x, y, prev_part.x, prev_part.y, next_part.x, next_part.y)) {
		image_index = 1;
	}
	// corner body part
	else {
		image_angle = 0;
		
		image_index = get_corner_index();
		return;
	}
}

// update rotation to face it's parents
direction = point_direction(x, y, prev_part.x, prev_part.y);

// update sprite rotation
image_angle = direction;

//fix tail rotation if snake goes out of bounds
if (image_index == 2) {
	
	var distance_x = abs(prev_part.x - x);
	var distance_y = abs(prev_part.y - y);
	
	if (distance_x > 32 || distance_y > 32) {
		image_angle = (image_angle + 180) % 360;
	}
	
}
