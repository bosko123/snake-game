event_inherited();
//show_debug_overlay(true);

// set default values for snake
// head of the snake contains info about it
snake_length = 2;
base_speed = 2;
current_speed = base_speed;
max_speed = 32;

move = 0;

// this allow for snake to uncoil
// at the start of the game
invincibility = 3;

right_grid_cell = 0;
bottom_grid_cell = 0;

prev_direction = 0;

pause = false
