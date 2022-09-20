if (sleep > 0) {
	
	sleep--;
	return;
	
}

// if ai was selected, create the instance of selected AI object
if (global.ai != -1) {
	instance_create_layer(x, y, "AI", global.ai);
}

instance_destroy(self);
