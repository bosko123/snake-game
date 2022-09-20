// skip if no algorithm is in use 
if (global.ai == -1) {
	
	return;
	
}

// check if snake moved
if (last_x != snake.x || last_y != snake.y) {
	
	last_x = snake.x;
	last_y = snake.y;
	
	tiles_between_life++;
	tiles_between_food++;
	tiles++;
	
}

// check if snake is longer
if (snake.snake_length > current_length) {
	
	var time_passed = get_timer() - time_between_food;
	
	// update min and max amount of tiles between food, if they changed 
	if (tiles_between_food < min_tiles_per_food) {
		
		min_tiles_per_food = tiles_between_food;
		
	}
	
	if (tiles_between_food > max_tiles_per_food) {
		
		max_tiles_per_food = tiles_between_food;
		
	}
	
	avg_tiles_per_food += tiles_between_food;
	
	// write length data into the file
	var score_data = score_get_length_template();
	score_data.len = snake.snake_length + 1;
	score_data.tiles = tiles_between_food;
	score_data.time = score_convert_time(time_passed);
	score_data.time_ums = time_passed;
	
	//scores_food[scores_death_index][scores_food_index] = score_data;
	score_append(string(global.ai_type) + "/scores_per_food/life_" + string(deaths + 1) + ".csv", score_data, data_types_food);
	
	scores_food_index++;
	tiles_between_food = 0;
	time_between_food = get_timer();
	
}

// check if snake is shorter (game over)
if (snake.snake_length < current_length) {
	
	// update min and max values, if they changed 
	if (current_length > max_length) {
		
		max_length = current_length + 1;
		
	}
	
	if (current_length < min_length) {
		
		min_length = current_length + 1;
		
	}
	
	if (tiles_between_life > max_tiles) {
		
		max_tiles = tiles_between_life;
		
	}
	
	if (tiles_between_life < min_tiles) {
		
		min_tiles = tiles_between_life;
		
	}
	
	var time_passed = get_timer() - time_between_life;
	
	if (time_passed > max_death_time) {
		
		max_death_time = time_passed;
		
	}
	
	if (time_passed < min_death_time) {
		
		min_death_time = time_passed;
		
	}
	
	/*score_writer("scores_per_food/" + string(global.ai_type) + "/life_" + string(scores_death_index + 1) + ".csv", 
				"length\ttiles moved\ttimes\ttime (microseconds, µs)\n", 
				data_types_food, scores_food[scores_death_index]);*/
	
	deaths++;
	score_write(string(global.ai_type) + "/scores_per_food/life_" + string(deaths + 1) + ".csv", score_data_names_per_food, undefined);
	
	//show_debug_message((get_timer() - time_between_life) / power(10, 6));
	//show_debug_message((get_timer() - time_between_life) / power(10, 6) / 60);
	
	//write data of current life
	var score_death_data = score_get_death_template();
	score_death_data.life = deaths;
	score_death_data.len = current_length + 1;
	score_death_data.tiles = tiles_between_life;
	score_death_data.min_tiles = min_tiles_per_food;
	score_death_data.max_tiles = max_tiles_per_food;
	score_death_data.avg_tiles = avg_tiles_per_food div scores_food_index;
	score_death_data.time = score_convert_time(time_passed);
	score_death_data.time_ums = time_passed;
	
	//scores_death[scores_death_index] = score_death_data;
	scores_death_index++;
	
	/*score_writer("score_per_life_" + string(global.ai_type) + ".csv", 
				"life\tlength\ttiles moved\ttime alive\ttime alive (microseconds, µs)\n", 
				data_types_death, scores_death);*/
	score_append(string(global.ai_type) + "/score_per_life_" + string(global.ai_type) + ".csv", score_death_data, data_types_death);
	show_debug_message(score_death_data);
	total_time += score_death_data.time_ums
	
	avg_length += (current_length + 1);
	
	delete score_death_data;
	
	//var total_time = 0;
	/*for (var i = 0; i < array_length(scores_death); i++) {
		
		total_time += scores_death[i].time_ums;
		
	}*/
	
	// write current data about entire algorithm runtime
	var score_data = score_get_base_template();
	score_data.deaths = deaths;
	score_data.min_length = min_length;
	score_data.max_length = max_length;
	score_data.avg_length = avg_length div deaths;
	score_data.tiles = tiles;
	score_data.min_tiles = min_tiles;
	score_data.max_tiles = max_tiles;
	score_data.avg_tiles = tiles div deaths;
	score_data.time = score_convert_time(total_time);
	score_data.time_ums = total_time;
	score_data.min_time = score_convert_time(min_death_time);
	score_data.min_time_ums = min_death_time;
	score_data.max_time = score_convert_time(max_death_time);
	score_data.max_time_ums = max_death_time;
	
	/*scores[0] = score_data;
	
	score_writer("score_" + string(global.ai_type) + ".csv", 
				"deaths\tmin length\tmax length\ttotal tiles moved\tmin tiles moved\tmax tiles moved\ttotal time\ttotal time (microseconds, µs)" + 
				+ "\tmin time per life\tmin time per life (microseconds, µs)\tmax time per life\tmax time per life (microseconds, µs)\n", 
				data_types_base, scores);*/
	score_write(string(global.ai_type) + "/score_" + string(global.ai_type) + ".csv", score_data_names, undefined)
	score_append(string(global.ai_type) + "/score_" + string(global.ai_type) + ".csv", score_data, data_types_base);
	
	show_debug_message(score_data);
	delete score_data;
	
	if (life != -1) {
		
		life--;
		show_debug_message("Life: " + string(deaths))
		
		if (life == 0) {
			
			draw_enable_drawevent(true)
			show_debug_message("No Extra Lives Left")
			game_restart()
			
		}
		
	}
	
	scores_food_index = 0;
	time_between_life = get_timer();
	tiles_between_life = 0;
	
	tiles_between_food = 0;
	min_tiles_per_food = infinity;
	max_tiles_per_food = 0;
	avg_tiles_per_food = 0;
	
}

current_length = snake.snake_length;

/*if (array_length(global.path) != paths) {
	
	paths = array_length(global.path);
	
	var file = file_text_open_write("paths.json");
	file_text_write_string(file, "{\n\t[\n");
	
	for (var i = 0; i < array_length(global.path); i++) {
		
		if (i == array_length(global.path) - 1) {
			
			file_text_write_string(file, "\t\t[\n");
			
			for (var j = 0; j < array_length(global.path[i]); j++) {
				
				if (j == array_length(global.path[i]) - 1) {
					
					file_text_write_string(file, "\t\t\t" + string(global.path[i][j]) + "\n");
					
				}
				else {
					
					file_text_write_string(file, "\t\t\t" + string(global.path[i][j]) + ",\n");
					
				}
				
			}
			
			file_text_write_string(file, "\t\t]\n");
			
		}
		else {
			
			file_text_write_string(file, "\t\t[\n");
			
			for (var j = 0; j < array_length(global.path[i]); j++) {
				
				if (j == array_length(global.path[i]) - 1) {
					
					file_text_write_string(file, "\t\t\t" + string(global.path[i][j]) + "\n");
					
				}
				else {
					
					file_text_write_string(file, "\t\t\t" + string(global.path[i][j]) + ",\n");
					
				}
				
			}
			
			file_text_write_string(file, "\t\t],\n");
			
		}
		
	}
	
	file_text_write_string(file, "\t]\n}");
	file_text_close(file);
	
}*/
