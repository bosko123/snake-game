// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function food_speed_limit(old_value, old_min, old_max, new_min, new_max){
	
	var old_range = old_max - old_min;
	var new_range = new_max - new_min;
	
	var new_value = (((old_value - old_min) * new_range) / old_range) + new_min;
	
	return new_value;
	
}