//rescrevendo os eventos
event_inherited();

//criando a cam
var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;

//vida
aphaa = 1;
alarm[0] = room_speed *3;

//hook
mx = x;
my = y;
ativo = false;


max_velh = 4;
max_velv = 20;
spd = 6;

dash_ativo = false;
mvtLocked = 0;
dashSpd = 20;
dashDuration = 0;



mostra_estado = true;

//upgrades
pulos_max = 1;

//metodo pular
pular = function()
{
	var jump = keyboard_check_pressed(ord("W"))
	if(jump) && (pulos > 0)
	{
		pulos -= 1;
		velv = -max_velv
	
	}
}

aplicando_gravidade = function()
{
//aplicando a gravidade
	var chao = place_meeting(x, y + 1, obj_block);
	if(!chao)
	{
		if(velv < max_velv * 2)
		{
		velv += GRAVIDADE * massa;
		}
	}
}

perde_vida = function(){
	if(global.vidaT >= 0)
	{
		global.vidaT--;
		aphaa = 1;
	}
	if(global.vidaT < 0 )
	{	
		global.vidaT = 3;
		global.checkpoint = 0;
		global.checkpointR = 0;
		room_restart()
	}

}

if(global.checkpointR == room)
{
	x = global.checkpointX
	y = global.checkpointY
}