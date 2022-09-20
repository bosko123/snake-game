event_inherited();

if (released) {
	
	global.ai = AIShortestPathTPAstar;
	global.ai_type = "AIAstarTP";
	room_goto(GameRoom);
	
}
