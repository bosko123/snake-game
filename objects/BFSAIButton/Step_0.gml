event_inherited();

if (released) {
	
	global.ai = AIShortestPathBFS;
	global.ai_type = "AIBreadthFirstSearch";
	room_goto(GameRoom);
	
}
