// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_closest_food(food_locations) {
	
	var closest_location = ds_list_find_value(food_locations, 0);
	var index = 0;
	
	for (var i = 1; i < ds_list_size(food_locations); i++) {
		
		var location = ds_list_find_value(food_locations, i);
		
		if (location[2] < closest_location[2]) {
			
			closest_location = location;
			index = i;
			
		}
		
	}
	
	ds_list_delete(food_locations, index);
	return closest_location;
	
}

function snake_food_positions(food_x, food_y, snake_x, snake_y, offset_x, offset_y) {
	
	var locations = ds_list_create();
	
	var location0;
	location0[0] = food_x;
	location0[1] = food_y;
	location0[2] = point_distance(location0[0], location0[1], snake_x, snake_y);
	
	ds_list_add(locations, location0);
	
	if (offset_x == 0 && offset_y == 0)
		return locations;
	
	var location1;
	location1[0] = food_x - offset_x;
	location1[1] = food_y;
	location1[2] = point_distance(location1[0], location1[1], snake_x, snake_y);
	
	var location2;
	location2[0] = food_x;
	location2[1] = food_y - offset_y;
	location2[2] = point_distance(location2[0], location2[1], snake_x, snake_y);
	
	var location3;
	location3[0] = food_x + offset_x;
	location3[1] = food_y;
	location3[2] = point_distance(location3[0], location3[1], snake_x, snake_y);
	
	var location4;
	location4[0] = food_x;
	location4[1] = food_y + offset_y;
	location4[2] = point_distance(location4[0], location4[1], snake_x, snake_y);
	
	ds_list_add(locations, location1);
	ds_list_add(locations, location2);
	ds_list_add(locations, location3);
	ds_list_add(locations, location4);
	
	return locations
	
}