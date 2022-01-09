//rescrevendo os eventos
event_inherited();

//hook
mx = x;
my = y;
ativo = false;

vida_max = 10;
vida_atual = vida_max;

max_velh = 4;
max_velv = 20;


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