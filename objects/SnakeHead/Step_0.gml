event_inherited();

if (keyboard_check_pressed(ord("P"))) {
	pause = !pause;
}

// remove speed
speed = 0;
var tmp_direction = direction;

if (pause)
	return;

// check if any key is pressed
// if it is, change direction
if (keyboard_check_pressed(ord("D")) && direction != 180) {
	direction = 0;
}
if (keyboard_check_pressed(ord("W")) && direction != 270) {
	direction = 90;
}
if (keyboard_check_pressed(ord("A")) && direction != 0) {
	direction = 180;
}
if (keyboard_check_pressed(ord("S")) && direction != 90) {
	direction = 270;
}

// check if selected direction is directly backwards (180°)
// if so do not change movement direction
var x_to = x + dcos(direction) * max_speed;
var y_to = y - dsin(direction) * max_speed;
if (x_to == next_part.x && y_to == next_part.y) {
	direction = tmp_direction;
}

/*if (keyboard_check_pressed(vk_space)) {
	move = 16;
	show_debug_message(string(dcos(direction)) + " " + string(dsin(direction)))
}*/

// increment move variable with current speed
// if only move snake if said variable gets equal 
// or higher then max speed of snake
move += current_speed;
if (move >= max_speed) {
	
	speed = max_speed;
	
	// check if snake's head will collide with body
	// if so, restart the room
	var movement_x = x + (speed * dcos(direction));
	var movement_y = y - (speed * dsin(direction));
	
	if (movement_x < 16 + global.grid_offset_x) {
		movement_x = right_grid_cell;
	}
	
	if (movement_x > right_grid_cell) {
		movement_x = 16 + global.grid_offset_x;
	}
	
	if (movement_y < 16 + global.grid_offset_y) {
		movement_y = bottom_grid_cell;
	}
	
	if (movement_y > bottom_grid_cell) {
		movement_y = 16 + global.grid_offset_y;
	}
	
	if (place_meeting(movement_x, movement_y, SnakeBody)) {
		room_restart();
		//game_end(0);
	}
	
	// move 
	move_snake(next_part, x, y);
	move = 0;
	prev_direction = direction;
	
}

if (invincibility > 0) {
	invincibility--;
}
