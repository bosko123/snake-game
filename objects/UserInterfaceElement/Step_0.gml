hover = position_meeting(mouse_x, mouse_y, self);

if (hover) {
	released = false;
	var check = mouse_check_button(mb_left);
	
	if (pressed && !check) {
		released = true;
	}
	pressed = check;
}
else {
	pressed = false;	
}
