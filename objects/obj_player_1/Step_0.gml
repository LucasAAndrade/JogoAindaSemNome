//movimentação do personagem
var left, right, dash, corda;
var chao = place_meeting(x, y + 1, obj_block);
var chao1 = place_meeting(x, y + 1, obj_espinho_que_muda);
var onAWall = place_meeting(x-5, y, obj_block) - place_meeting(x+5, y, obj_block);
corda = mouse_check_button_pressed(mb_left);
vida = global.vidaT;

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
dash = keyboard_check_pressed(vk_lshift);
var jump2 = keyboard_check_pressed(ord("W"))

//codigo de movimentação
velh = (right - left) * max_velh;

mvtLocked = max(mvtLocked - 1, 0);
dashDuration = max(dashDuration - 1, 0);
if (dashDuration > 0) velv = 0;
else if (onAWall != 0) velv = min(velv + 1, 5);
else velv++;

 //checando o hook

if(mouse_check_button_pressed(mb_left) )
{
	
	mx = mouse_x;
	my = mouse_y;
	if(place_meeting(mx,my,	obj_blockHook) and my < y)
	{
		ativo = true;
	}
}

if(ativo && !place_meeting(x, y, obj_block))
{

	velv = 10;
	massa = 0.3;
	x += (mx - x ) * 0.1;
	y += (my - y ) * 0.1;
	
}

if(mouse_check_button_released(mb_left))
{

	massa = 1;
	ativo = false;

}


//verificação das habilidades 
if(keyboard_check_pressed(ord("M")))
{
	pulos_max = 2;
}


pular();

//iniciando a state machine
switch(estado)
{
	#region parado
	case "parado" :
	{
	
	
	
	max_velh = spd;
	//parando o mid_velh
	mid_velh = 0;
	
	//comportamento
	sprite_index = spr_player;
	
		//movendo
		if(velh != 0)
		{
			estado = "movendo";
			pulos = pulos_max;
		}
		else if(jump2 || !chao && !chao1 )
		{
			estado = "pulando";
		}else if (dash and dashQQ > 0 and dash_ativo == true)
		{
			image_index = 0;
			dashQQ -= 1;
			estado = "dash";
		}
		break;
	}
	#endregion
	#region movendo
	case "movendo" :
	{
		max_velh = spd;
		//sprites de movimento
		sprite_index = spr_andando;

		
		//troca de estado parado
		if(abs(velh) < .1)
		{
			pulos = pulos_max;
			estado = "parado";	
			velv = 0;
		}else if(jump2 || !chao && !chao1)
		{
			estado = "pulando";
		}else if (dash and dashQQ > 0 and dash_ativo == true)
		{
			image_index = 0;
			estado = "dash";
			dashQQ -= 1;
		}
	
		break;
	}
	#endregion
	#region pulo
	case "pulando" :
	{
		sprite_index = spr_player;
		max_velh = spd;
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
		if(chao || chao1)
		{
			estado = "parado";
			pulos = pulos_max;
		}else if (dash and dashQQ > 0 and dash_ativo == true)
		{
			image_index = 0;
			dashQQ -= 1;
			estado = "dash";
		}
		//walljump
		var wall = place_meeting(x + sign(velh), y, obj_block);
		if(wall){
			sprite_index = spr_wallJump;
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
			mid_velh = lerp(mid_velh, 0, 0.06);
		}
		break;
	}
	#endregion
	#region "dash"
	case "dash" :
	{
		alarm [0] = room_speed;
		max_velh = 300;
		//movendo a sprite
		sprite_index = spr_player_dash;
		
	
		//sprites de movimento
		dashDuration = 5;
		velh = image_xscale * dashSpd;
		
		
		
		if(image_index >= image_number - 1)
		{
			pulos = pulos_max;
			estado = "parado";
		}	
		break;
	}
	#endregion	
}

if(y > 10032){
	src_death();
}

show_debug_message(vida);
