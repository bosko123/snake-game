// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_snake(part, x, y) {
	
	// check if part has a child
	// if not then move to to his parent and
	// end recursion
	if (part.next_part == -1) {
		
		part.move++
		
		if (part.move == 1) {
			
			part.x = x;
			part.y = y;
			part.move = 0;
			
		}
		
	}
	else {
		
		// if part has a child, then first move the child
		// after that move the part
		move_snake(part.next_part, part.x, part.y)
		part.move++
		
		if (part.move == 1) {
			
			part.x = x;
			part.y = y;
			part.move = 0;
			
		}
		
	}
	
}