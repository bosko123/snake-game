event_inherited();

if (released) {
	
	global.ai = AIShortestPathAstar;
	global.ai_type = "AIAstar";
	room_goto(GameRoom);
	
}
