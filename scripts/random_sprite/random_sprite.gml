// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function random_sprite(sprites) {
	
	var sprite_number = array_length(sprites);
	var random_index = irandom(sprite_number - 1);
	
	return sprites[random_index];
	
}