event_inherited();

if (released) {
	
	global.ai = AIHamiltonianPath;
	global.ai_type = "AIHamiltonian";
	room_goto(GameRoom);
	
}
