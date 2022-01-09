//movimentação do personagem
var left, right, attack;
var chao = place_meeting(x, y + 1, obj_block);

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
var jump2 = keyboard_check_pressed(ord("W"))

//codigo de movimentação
velh = (right - left) * max_velh;


//verificação das habilidades 
if(keyboard_check_pressed(ord("M")))
{
	pulos_max = 2;
}

pular();

//iniciando a state machine
switch(estado)
{
	case "parado" :
	{
	//parando o mid_velh
	mid_velh = 0;
	
	//comportamento
	
	
		//movendo
		if(velh != 0)
		{
			estado = "movendo"; 
		}
		else if(jump2 || !chao)
		{
			estado = "pulando";
		}
		break;
	}
	case "movendo" :
	{
		//sprites de movimento
		

		
		//troca de estado parado
		if(abs(velh) < .1)
		{
			estado = "parado";	
			velv = 0;
		}else if(jump2 || !chao)
		{
		estado = "pulando";
		}
	
		break;
	}
	case "pulando" :
	{
		
		//aplica grabidade
		aplicando_gravidade();

		//sprites de pulo:
		//queda
		if(velv > 0)
		{
		
		}
		else //subindo
		{
		
		}
		
		//troca de estado 
		if(chao)
		{
			estado = "parado";
			
		}
		//walljump
		var wall = place_meeting(x + sign(velh), y, obj_block);
		if(wall){
			//fazendo eu pular ao apertar o espaço (jump)
			if(jump2)
			{
				//indo para cima 
				velv = -max_velv
				//indo para a direção certa
				mid_velh = (max_velh * 2) * sign(velh) * -1;
			}
			
			if(velv > 1){
				velv = 1;
			}
			else
			{
				aplicando_gravidade();
				
			}
		}
		else{
			aplicando_gravidade();
			
			//diminuindo o valor do mid_velh
			mid_velh = lerp(mid_velh, 0, 0.04);
		}
		break;
	}
}
