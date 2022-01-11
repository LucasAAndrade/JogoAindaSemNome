// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function src_death(){
	if(global.checkpointR != 0)
{
	perde_vida();
	obj_player.x = global.checkpointX;
	obj_player.y = global.checkpointY;
	
}
else
{
	perde_vida();
	room_restart();

}
}