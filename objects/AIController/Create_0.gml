snake = instance_find(SnakeHead, 0);
food = instance_find(Food, 0);

last_x = snake.x;
last_y = snake.y;

keys[0] = ord("D");
keys[1] = ord("W");
keys[2] = ord("A");
keys[3] = ord("S");

change_direction = false;

grid = -1;
surface = -1;

apply_collision_predictions = true;
global.ai_type = "AIController"
