// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print_grid(input_grid) {
	
	for (var yy = 0; yy < ds_grid_height(input_grid); yy++) {
		
		var tmp = "";
		
		for (var xx = 0; xx < ds_grid_width(input_grid); xx++) {
			
			var val = ds_grid_get(input_grid, xx, yy);
			
			if (val == -1) {
				
				tmp += "_ ";
				
			}
			else {
				
				tmp += string(val) + " ";
				
			}
			
		}
		
		show_debug_message(tmp);
		
	}
	
	show_debug_message("");
	
}