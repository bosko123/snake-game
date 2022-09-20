// check if snake moved
if (last_x != snake.x || last_y != snake.y) {
	last_x = snake.x;
	last_y = snake.y;
	
	change_direction = true;
}
