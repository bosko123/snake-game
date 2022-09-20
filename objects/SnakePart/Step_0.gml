// each part has it's length value 1 less then parent's
if (prev_part != -1) {
	snake_length = prev_part.snake_length - 1;
}

// if part's length is not 0 and it child part doesn't exist, then create it
if (snake_length > 0 && next_part == -1) {
	next_part = instance_create_depth(x, y, 0, SnakeBody);
	next_part.prev_part = self;
	next_part.direction = direction;
	next_part.image_angle = direction;
	
	// Delay movement of newly created child
	if (move < 0) {
		next_part.move--;
	}
}
