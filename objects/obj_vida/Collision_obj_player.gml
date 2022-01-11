if(global.vidaT < global.vidaMAx)
{
	obj_player.aphaa = 1;
	global.vidaT++;
	instance_destroy(id, false);
}