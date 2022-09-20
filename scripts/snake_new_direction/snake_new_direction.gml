// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_new_direction(snake, angle) {
	
	var old_direction_x = dcos(snake.direction);
	var old_direction_y = -dsin(snake.direction);
	
	var new_direction_x = dcos(angle);
	var new_direction_y = -dsin(angle);
	
	var difference_x = old_direction_x + new_direction_x;
	var difference_y = old_direction_y + new_direction_y;
	
	if (difference_x == 0 && difference_y == 0)
		return snake.direction;
	
	snake.direction = angle;
	
	return angle;
	
}