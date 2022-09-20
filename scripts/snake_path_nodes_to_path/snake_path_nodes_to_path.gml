// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snake_path_nodes_to_path(nodes) {
	
	// return array of nodes
	// node has it's own x, y and each node has key
	return snake_path_nodes_to_array(nodes, -1);
	
}

function snake_path_nodes_to_array(last_node, key) {
	
	// prepair array
	var array;
	
	// get a node with assigned keyboard key
	var node = snake_keybind_node(last_node.x_coord, last_node.y_coord, key);
	
	// check node doesn't have a parent
	if (last_node.previous == -1) {
		
		// add node to array and return it
		array[0] = node;
		return array;
		
	}
	else {
		
		var prev_node = last_node.previous
		//var key_index = 0;
		var new_dir_index = 0;
		
		// depanding on node positions assign right key index
		if (last_node.x_coord == prev_node.x_coord) {
			
			if (last_node.y_coord < prev_node.y_coord) {
				
				//key_index = 1;
				new_dir_index = 1;
				
			}
			else {
				
				//key_index = 3;
				new_dir_index = 3;
				
			}
			
		}
		else {
			
			if (last_node.x_coord > prev_node.x_coord) {
				
				//key_index = 0;
				new_dir_index = 0;
				
			}
			else {
				
				//key_index = 2;
				new_dir_index = 2;
				
			}
			
		}
		
		// get array recursively from its parent
		// add node to that array and return said array
		array = snake_path_nodes_to_array(prev_node, new_dir_index * 90 /*keys[key_index]*/);
		array[array_length(array)] = node;
		return array;
		
	}
	
}

function snake_keybind_node(x_coord, y_coord, key) {
	
	// create new node with passed x, y and key code
	var node = {
		
		node_x : x_coord,
		node_y : y_coord,
		node_key : key
		
	}
	
	return node;
	
}
