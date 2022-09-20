// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function score_writer(file_name, data_names, data_types, data_array) {
	
	var scores_file = file_text_open_write(file_name);
	file_text_write_string(scores_file, data_names);
	
	for (var i = 0; i < array_length(data_array); i++) {
		
		for (var j = 0; j < array_length(data_types); j++) {
			
			if (j == array_length(data_types) - 1) {
				
				file_text_write_string(scores_file, string(data_array[i][$ data_types[j]]) + "\n");
				
			}
			else {
				
				file_text_write_string(scores_file, string(data_array[i][$ data_types[j]]) + "\t");
				
			}
			
		}
		
	}
	
	file_text_close(scores_file);
	
}

function score_append(file_name, input, data_types) {
	
	var scores_file = file_text_open_append(file_name);
	
	if (data_types == undefined) {
		
		file_text_write_string(scores_file, string(input) + "\n");
		
	}
	else {
		
		for (var i = 0; i < array_length(data_types); i++) {
			
			if (i == array_length(data_types) - 1) {
				
				file_text_write_string(scores_file, string(input[$ data_types[i]]) + "\n");
				
			}
			else {
				
				var data_type = data_types[i];
				file_text_write_string(scores_file, string(input[$ data_type]) + "\t");
				
			}
			
		}
		
	}
	
	file_text_close(scores_file);
	
}

function score_write(file_name, input, data_types) {
	
	var scores_file = file_text_open_write(file_name);
	
	if (data_types == undefined) {
		
		file_text_write_string(scores_file, string(input));
		
	}
	else {
		
		for (var i = 0; i < array_length(data_types); i++) {
			
			if (i == array_length(data_types) - 1) {
				
				file_text_write_string(scores_file, string(input[$ data_types[i]]) + "\n");
				
			}
			else {
				
				file_text_write_string(scores_file, string(input[$ data_types[i]]) + "\t");
				
			}
			
		}
		
	}
	
	file_text_close(scores_file);
	
}

function score_get_base_template() {
	
	var score_template = {
		
		deaths : -1,
		min_length : -1,
		max_length : -1,
		avg_length : -1,
		tiles : -1,
		min_tiles : -1,
		max_tiles : -1,
		avg_tiles : -1,
		time : -1,
		time_ums : -1,
		min_time : -1,
		min_time_ums : -1,
		max_time : -1,
		max_time_ums : -1
		
	};
	
	return score_template;
	
}

function score_get_death_template() {
	
	var score_template = {
		
		life : -1,
		len : -1,
		tiles : -1,
		min_tiles : -1,
		max_tiles : -1,
		avg_tiles : -1,
		time : -1,
		time_ums : -1
		
	};
	
	return score_template;
	
}

function score_get_length_template() {
	
	var score_template = {
		
		len : -1,
		tiles : -1,
		time : -1,
		time_ums : -1
		
	};
	
	return score_template;
	
}

function score_convert_time(time_ums) {
	
	//show_debug_message(time_ums)
	
	var time_stamp = time_ums div 1000;
	var hour = 60 * 60 * 1000;
	var minute = 60 * 1000;
	var second = 1000;
	
	var hours = time_stamp div hour;
	time_stamp = time_stamp mod hour;
	
	var minutes = time_stamp div minute;
	time_stamp = time_stamp mod minute;
	
	var seconds = time_stamp div second;
	var milliseconds = time_stamp mod second;
	
	return string(hours) + ":" + string(minutes) + ":" + string(seconds) + ":" + string(milliseconds);
	
}
