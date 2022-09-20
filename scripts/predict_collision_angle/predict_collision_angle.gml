// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function predict_collision_angle(angle) {
	var b = 1999;
	
	with (SnakeHead) {
		
		b = place_meeting(x + (speed * dcos(angle)), y - (speed * dsin(angle)), SnakeBody);
		
	}
	
	return b;
}
