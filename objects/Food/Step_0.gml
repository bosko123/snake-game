// if snake's head collide with Food,
// increase snake size then destroy food instance
if (place_meeting(x, y, SnakeHead)) {
	with (SnakeHead) {
		snake_length++;
		//current_speed = base_speed + ((snake_length * 2.5) / 100)
		var new_speed = logn(base_speed, snake_length) + 1;
		var max_new_speed = logn(base_speed, (global.grid_width div 32) * (global.grid_width div 32));
		current_speed = food_speed_limit(new_speed, 2, max_new_speed, 2, 8);
		//current_speed = 31;
	}
	x = (irandom_range(0, global.grid_width - 1) div 32) * 32 + global.grid_offset_x;
	y = (irandom_range(0, global.grid_height - 1) div 32) * 32 + global.grid_offset_y;
	
	sprite_index = random_sprite(sprites);
	//instance_destroy(self, true);
}

var snake = instance_find(SnakeHead, 0);

// if food spawns in snake body, destroy it 
while (place_meeting(x, y, SnakePart)) {
	
	var length_max = (global.grid_width div 32) * (global.grid_height div 32);
	
	if (snake.snake_length + 1 >= length_max) {
		
		snake.snake_length = length_max - 1
		break;
		
	}
	
	//instance_destroy(self, true);
	x = (irandom_range(0, global.grid_width - 1) div 32) * 32 + global.grid_offset_x;
	y = (irandom_range(0, global.grid_height - 1) div 32) * 32 + global.grid_offset_y;
}
