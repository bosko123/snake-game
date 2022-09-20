event_inherited();

if (released) {
	
	global.ai = AIShortestPathTPBFS;
	global.ai_type = "AIBreadthFirstSearchTP";
	room_goto(GameRoom);
	
}
