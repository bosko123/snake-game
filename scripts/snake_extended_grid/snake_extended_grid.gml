// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_extended_grid(input_grid) {
	
	var base_width = ds_grid_width(input_grid);
	var base_height = ds_grid_height(input_grid);
	
	var resize_width = base_width * 2;
	var resize_height = base_height * 2;
	
	var extended_grid = ds_grid_create(base_width + resize_width, base_height + resize_height);
	snake_grid_fill(extended_grid, 7);
	
	var left_offset = (resize_width / 2);
	var right_offset = ds_grid_width(extended_grid) - (resize_width - left_offset) - 1;
	var top_offset = (resize_height / 2);
	var bottom_offset = ds_grid_height(extended_grid) - (resize_width - top_offset) - 1;
	
	//show_debug_message(string(ds_grid_width(input_grid)) + " " + string(ds_grid_width(extended_grid)));
	//show_debug_message(string(ds_grid_height(input_grid)) + " " + string(ds_grid_height(extended_grid)));
	
	for (var i = 0; i < 9; i++) {
		
		var xx = i mod 3;
		var yy = i div 3;
		
		if (xx == 0 && yy == 0 || xx == 2 && yy == 2 || xx == 0 && yy == 2 || xx == 2 && yy == 0) {
			
			continue;
			
		}
		
		xx *= base_width;
		yy *= base_height;
		
		for (var j = 0; j < base_height; j++) {
			
			for (var k = 0; k < base_width; k++) {
				
				var value = ds_grid_get(input_grid, k, j);
				ds_grid_set(extended_grid, k + xx, j + yy, value);
				
			}
			
		}
		
	}
	
	var ext_grid_props = {
		ext_grid : extended_grid, 
		left : left_offset,
		right : right_offset,
		top : top_offset,
		bottom : bottom_offset
	}
	
	return ext_grid_props;
	
}

function snake_extended_grid_get_original_position(ext_grid_props, original_grid, x_index, y_index) {
	
	if (ds_grid_get(extended_grid, x_index, y_index) == 0) {
		
		return -1;
		
	}
	
	var extended_grid = ext_grid_props.ext_grid;
	
	var lo = ext_grid_props.left
	var ro = ext_grid_props.right
	var to = ext_grid_props.top
	var bo = ext_grid_props.bottom
	
	var xx = x_index;
	var yy = y_index;
	
	xx = (x_index >= lo && x_index < ro) ? (x_index - lo) : ((x_index < lo) ? (x_index + lo) : (x_index - ro));
	yy = (y_index >= to && y_index < bo) ? (y_index - to) : ((y_index < to) ? (y_index + to) : (y_index - bo));
	
	var tab;
	tab[0] = xx;
	tab[1] = yy;
	tab[2] = ds_grid_get(original_grid, xx, yy);
	
	return tab;
	
}

function snake_grid_fill(grid, value) {
	
	for (var i = 0; i < ds_grid_height(grid); i++) {
		
		for (var j = 0; j < ds_grid_width(grid); j++) {
			
			ds_grid_set(grid, j, i, value);
			
		}
		
	}
	
}
