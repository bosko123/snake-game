snake = instance_find(SnakeHead, 0);
life = 100;

ai_controller = instance_find(global.ai, 0);

time_between_food = get_timer();
time_between_life = get_timer();

min_death_time = infinity;
max_death_time = 0;
total_time = 0;

current_length = snake.snake_length;
min_length = infinity;
max_length = snake.snake_length
avg_length = 0;
deaths = 0;

tiles_between_life = 0;
tiles_between_food = 0;
tiles = 0;
min_tiles = infinity;
max_tiles = 0;
min_tiles_per_food = infinity;
max_tiles_per_food = 0;
avg_tiles_per_food = 0;

last_x = snake.x;
last_y = snake.y;

global.index = 0;
global.path[0] = -1;

paths = 0;

scores[0] = -1;
scores_food[0] = -1;
scores_death[0] = -1;

score_index = 0;
scores_death_index = 0;
scores_food_index = 0;

// if algorithm is enabled, create their files
if (global.ai != -1) {
	
	score_data_names_per_food = "length\ttiles moved\ttime\ttime (µs)\n";
	score_write(string(global.ai_type) + "/scores_per_food/life_" + string(scores_death_index + 1) + ".csv", score_data_names_per_food, undefined);
	
	score_data_names_per_life = "life\tlength\ttiles moved\tmin tiles moved per food\tmax tiles moved per food\tavg tiles moved per food\ttime alive\ttime alive (µs)\n";
	score_write(string(global.ai_type) + "/score_per_life_" + string(global.ai_type) + ".csv", score_data_names_per_life, undefined);
	
	score_data_names = "deaths\tmin length\tmax length\tavg length\ttotal tiles moved\tmin tiles moved\tmax tiles moved\tavg tiles moved" + 
						+ "\ttotal time\ttotal time (µs)\tmin time per life\tmin time per life (µs)\tmax time per life\tmax time per life (µs)\n";
	score_write(string(global.ai_type) + "/score_" + string(global.ai_type) + ".csv", score_data_names, undefined);
	
}

// data columns (entire runtime)
data_types_base[0] = "deaths";
data_types_base[1] = "min_length";
data_types_base[2] = "max_length";
data_types_base[3] = "avg_length";
data_types_base[4] = "tiles";
data_types_base[5] = "min_tiles";
data_types_base[6] = "max_tiles";
data_types_base[7] = "avg_tiles";
data_types_base[8] = "time";
data_types_base[9] = "time_ums";
data_types_base[10] = "min_time";
data_types_base[11] = "min_time_ums";
data_types_base[12] = "max_time";
data_types_base[13] = "max_time_ums";

// data columns (per life)
data_types_death[0] = "life";
data_types_death[1] = "len";
data_types_death[2] = "tiles";
data_types_death[3] = "min_tiles";
data_types_death[4] = "max_tiles";
data_types_death[5] = "avg_tiles";
data_types_death[6] = "time";
data_types_death[7] = "time_ums";

// data columns (tiles)
data_types_food[0] = "len";
data_types_food[1] = "tiles";
data_types_food[2] = "time";
data_types_food[3] = "time_ums";
